CREATE
    OR REPLACE FUNCTION update_time()
    RETURNS TRIGGER AS
$$
BEGIN
    IF
        row (NEW.*) IS DISTINCT FROM row (OLD.*) THEN
        NEW.updated_at := now();
        RETURN NEW;
    ELSE
        RETURN OLD;
    END IF;
END;
$$ language 'plpgsql';


-- DROP SCHEMA IF EXISTS hei CASCADE;
CREATE SCHEMA ukraine;

CREATE TABLE ukraine.higher_education_institution
(
    id      SERIAL PRIMARY KEY,
    name    VARCHAR(10000) UNIQUE NOT NULL,
    region  VARCHAR(5000)         NOT NULL CHECK (region <> ''),
    city    VARCHAR(1000)         NOT NULL CHECK (city <> ''),
    address VARCHAR(10000)        NOT NULL CHECK (address <> '')
);

CREATE TABLE ukraine.speciality
(
    id   serial PRIMARY KEY,
    name VARCHAR(10000) UNIQUE NOT NULL CHECK (name <> '')
);

-- CREATE TYPE education_form_types AS ENUM ('очка', 'заочка', '');

CREATE TABLE ukraine.education_form
(
    id   serial PRIMARY KEY,
    type VARCHAR(100) UNIQUE NOT NULL CHECK (type <> '')
);

CREATE TABLE ukraine.competition
(
    higher_education_institution_id VARCHAR NOT NULL,
    speciality_id                   VARCHAR NOT NULL,
    education_form_id               VARCHAR NOT NULL,
    year                            date    NOT NULL,
    number_of_budget_places         INT       DEFAULT 0,
    number_of_commercial_places     INT       DEFAULT 0,
    updated_at                      TIMESTAMP DEFAULT NOW(),
    price                           DOUBLE PRECISION,

    CONSTRAINT year_must_be_1st_jan CHECK ( date_trunc('year', year) = year ),
    PRIMARY KEY (higher_education_institution_id, speciality_id, education_form_id),
    CONSTRAINT fk_higher_education_institution FOREIGN KEY (higher_education_institution_id)
        REFERENCES ukraine.higher_education_institution (id) ON DELETE CASCADE,
    CONSTRAINT fk_speciality FOREIGN KEY (speciality_id)
        REFERENCES ukraine.speciality (id) ON DELETE CASCADE,
    CONSTRAINT fk_education_form_id FOREIGN KEY (education_form_id)
        REFERENCES ukraine.education_form (id) ON DELETE CASCADE

);


-- Triggers
CREATE TRIGGER prevent_timestamp_changes
    BEFORE UPDATE
    ON ukraine.competition
    FOR EACH ROW
EXECUTE PROCEDURE update_time();

