--color
SELECT DISTINCT rtrim(color1) FROM animals
union
SELECT DISTINCT rtrim(color2) FROM animals
WHERE color2 IS NOT NULL

--cat only
SELECT DISTINCT animal_type FROM animals

--animal_id: 28209
SELECT animal_id, COUNT(DISTINCT animal_id) FROM animals 
--color_id: 29421
SELECT animal_id, COUNT(DISTINCT animal_id) FROM animal_color
--"index": 29421
SELECT "index", COUNT(DISTINCT "index") FROM animals
--color2: 19
SELECT color2, COUNT(DISTINCT rtrim(color2)) FROM animals where color2 IS NOT NULL
SELECT color1, COUNT(DISTINCT rtrim(color1)) FROM animals where color1 IS NOT NULL
select color2, count(*) from animals group BY color2 HAVING count(*) > 0

SELECT color2, COUNT(color2) FROM animals where color2 is not NULL group BY color2
UNION 
SELECT color1, COUNT(color1) FROM animals where color1 is not NULL group BY color1

--breed: 65
SELECT DISTINCT breed FROM animals


--Missing ...: 8
SELECT DISTINCT outcome_type FROM animals WHERE outcome_type IS NOT NULL

SELECT DISTINCT outcome_subtype FROM animals WHERE outcome_subtype IS NOT NULL


--29421
SELECT COUNT( (date_of_birth)) FROM animals where date_of_birth IS NOT NULL
SELECT date_of_birth FROM animals

--29421/ DISTINCT 28209
SELECT COUNT(DISTINCT (animal_id)) FROM animals where animal_id IS NOT NULL

--12months
SELECT DISTINCT outcome_month FROM animals ORDER BY outcome_month ASC

--years: 6
SELECT DISTINCT outcome_year FROM animals ORDER BY outcome_year ASC


SELECT DISTINCT age_upon_outcome FROM animals ORDER BY age_upon_outcome ASC
SELECT DISTINCT age_upon_outcome FROM animals WHERE age_upon_outcome LIKE '%day%'
SELECT DISTINCT age_upon_outcome FROM animals WHERE age_upon_outcome LIKE '%week%'
SELECT DISTINCT age_upon_outcome FROM animals WHERE age_upon_outcome LIKE '%month%' ORDER BY age_upon_outcome ASC
SELECT DISTINCT age_upon_outcome FROM animals WHERE age_upon_outcome LIKE '%year%' ORDER BY age_upon_outcome ASC



