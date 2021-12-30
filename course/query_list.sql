SELECT s.name, e.type, c.year, c.number_of_budget_places, c.number_of_commercial_places, c.price
FROM ukraine.competition as c
         INNER JOIN ukraine.higher_education_institution f on f.id = c.higher_education_institution_id
         INNER JOIN ukraine.speciality s on s.id = c.speciality_id
         INNER JOIN ukraine.education_form e on e.id = c.education_form_id
WHERE f.name = 'Университет экономики и права "КРОК"' ORDER BY year;

SELECT f.name, s.name, e.type, c.year, c.number_of_budget_places, c.number_of_commercial_places, c.price
FROM ukraine.competition as c
         INNER JOIN ukraine.higher_education_institution f on f.id = c.higher_education_institution_id
         INNER JOIN ukraine.speciality s on s.id = c.speciality_id
         INNER JOIN ukraine.education_form e on e.id = c.education_form_id
WHERE s.name = 'Атомна енергетика' ORDER BY year;

SELECT f.name, s.name, e.type, c.year, c.number_of_budget_places, c.number_of_commercial_places, c.price
FROM ukraine.competition as c
         INNER JOIN ukraine.higher_education_institution f on f.id = c.higher_education_institution_id
         INNER JOIN ukraine.speciality s on s.id = c.speciality_id
         INNER JOIN ukraine.education_form e on e.id = c.education_form_id
WHERE e.type = 'дистанционная' ORDER BY year;

SELECT f.name, s.name, e.type, c.year, c.number_of_budget_places, c.number_of_commercial_places, c.price
FROM ukraine.competition as c
         INNER JOIN ukraine.higher_education_institution f on f.id = c.higher_education_institution_id
         INNER JOIN ukraine.speciality s on s.id = c.speciality_id
         INNER JOIN ukraine.education_form e on e.id = c.education_form_id
WHERE f.region = 'Великобритания' ORDER BY year;


SELECT *
FROM ukraine.competition
         WHERE higher_education_institution_id = (SELECT id FROM  ukraine.higher_education_institution WHERE  name = 'Университет экономики и права "КРОК"');

--------------------------------
SELECT f.name, s.name, e.type, c.year, c.price
FROM ukraine.competition as c
         INNER JOIN ukraine.higher_education_institution f on f.id = c.higher_education_institution_id
         INNER JOIN ukraine.speciality s on s.id = c.speciality_id
         INNER JOIN ukraine.education_form e on e.id = c.education_form_id
ORDER BY e.id, price DESC;


SELECT f.name, s.name, e.type, c.year, c.price
FROM ukraine.competition as c
         INNER JOIN ukraine.higher_education_institution f on f.id = c.higher_education_institution_id
         INNER JOIN ukraine.speciality s on s.id = c.speciality_id
         INNER JOIN ukraine.education_form e on e.id = c.education_form_id
ORDER BY s.id, price;


