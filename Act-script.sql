CREATE TABLE animal (
	animal_id integer PRIMARY KEY AUTOINCREMENT,
	name text,
	date_of_birth date
);

CREATE TABLE types (
	animal_type_id text PRIMARY KEY AUTOINCREMENT,
	animal_type text
);



CREATE TABLE colors (
	color_id text PRIMARY KEY AUTOINCREMENT,
	color text
);

CREATE TABLE compet (
	outcome_subtype_id text PRIMARY KEY AUTOINCREMENT,
	outcome_subtype text
);

CREATE TABLE nawdays (
	outcome_type_id text PRIMARY KEY AUTOINCREMENT,
	outcome_type text
);

CREATE TABLE outcome (
	outcome_month integer,
	outcome_year integer,
	age_upon_outcome date
);

CREATE TABLE period (
	period_time_id integer PRIMARY KEY AUTOINCREMENT,
	period_time integer,
	period_time_unit text PRIMARY KEY AUTOINCREMENT
);











--Удаление таблицы
DROP TABLE short

--Удаление столбца
ALTER TABLE colors 
DROP COLUMN name



--insert into animal_color
--    select animals."index",
--           colors."color"
--from animals
--join colors on rtrim(animals.color1)=colors.name

INSERT INTO animal_color (animal_id, color_id)
	FOREIGN KEY animals."index",
	FOREIGN KEY animal_color.color



---------------------------------------
create table normalizedTable (
     animal_id integer,
     animal_id_pk text(7),
     name varchar(30),
     date_of_birth data,
--     color_id integer,
     PRIMARY KEY (animal_id_pk),
     FOREIGN KEY (animal_id)	REFERENCES animals("index")
--     FOREIGN KEY (color_id) 	REFERENCES colors("color")
     )

create table animalstable (
	animal_id integer PRIMARY KEY AUTOINCREMENT,
	animal_id_pk varchar(7)
)
 
insert into animalstable (animal_id_pk)
select animals.animal_id from animals 

select animal_id, color_id, second_color_id from animal_color WHERE second_color_id is not NULL 


select DISTINCT COUNT(animal_color.animal_id) from animal_color --WHERE animal_id=6

select animal_id, count(*) from animals group BY animal_id HAVING count(*) > 0--WHERE COUNT(animal_id>1)

SELECT  color1, color2, animal_id 
from animals WHERE "index" <10
join animal_color --ON animals.animal_id=color_id-- group by color_id 
 
CREATE TABLE short AS SELECT * FROM animals WHERE 0
	
INSERT INTO short 
select 	*
FROM animals
WHERE animals."index" <10

INSERT INTO animal_color (animal_id, color_id)--, second_color_id) 
	SELECT 	short.animal_id, colors.color_id 
	FROM short
	JOIN colors ON rtrim(short.color1)=colors.color--, rtrim(animals.color2)=colors.color
UNION 
	SELECT 	short.animal_id, colors.color_id 
	FROM short
	JOIN colors ON rtrim(short.color2)=colors.color


