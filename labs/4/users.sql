CREATE USER db_god WITH PASSWORD 'secret';
GRANT admin TO db_god;

CREATE USER tamara WITH PASSWORD 'secret';
GRANT ukraine_owner TO tamara;

CREATE USER vasya WITH PASSWORD 'secret';
GRANT read_write_ukraine TO vasya;

CREATE USER gorlum WITH PASSWORD 'secret';
GRANT read_ukraine TO gorlum;

