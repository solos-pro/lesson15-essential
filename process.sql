CREATE TABLE colors (
color_id integer PRIMARY KEY AUTOINCREMENT,
color varchar (30))

insert into colors (color)
select * from
(select distinct rtrim(color1) from animals
where color1 is not null
union
select distinct rtrim(color2) from animals
where color2 is not null)

DROP TABLE animal_color

create table animal_color (
     animal_id integer,
     color_id integer,
     PRIMARY KEY (animal_id, color_id),
     FOREIGN KEY (animal_id)		REFERENCES animals(animal_id),
     FOREIGN KEY (color_id)		 	REFERENCES colors(color)
     )
     
INSERT INTO animal_color (animal_id, color_id)--, second_color_id) 
	SELECT 	animals.animal_id, colors.color_id 
	FROM animals
	JOIN colors ON rtrim(animals.color1)=colors.color--, rtrim(animals.color2)=colors.color
UNION 
	SELECT 	animals.animal_id, colors.color_id 
	FROM animals
	JOIN colors ON rtrim(animals.color2)=colors.color--, rtrim(animals.color2)=colors.color


---------------------------------------------------------------------------
CREATE TABLE breeds (
	breed_id integer PRIMARY KEY AUTOINCREMENT,
	breed varchar (30))

create table animal_breed (
     animal_id integer,
     breed_id integer,
     PRIMARY KEY (animal_id),
     FOREIGN KEY (animal_id)	REFERENCES animals("index"),
     FOREIGN KEY (breed_id) 	REFERENCES breeds("breed")
     )

INSERT INTO breeds (breed) 
SELECT DISTINCT breed FROM animals

INSERT INTO animal_breed (animal_id, breed_id)
SELECT 	animals."index",
		breeds.breed_id 
FROM animals
JOIN breeds ON animals.breed=breeds.breed

---------------------------------------------------------------------------

CREATE TABLE animal (
	id integer PRIMARY KEY AUTOINCREMENT,
	animal_id varchar(7),
	name varchar(30),
	birthday date
	)

INSERT INTO animal (animal_id, name, birthday)
SELECT animal_id, name, date_of_birth
FROM short 											--!!!!!!!!!!!!!!!!!!!!!
---------------------------------------------------------------------------
drop table times

CREATE TABLE times (
	id integer PRIMARY KEY AUTOINCREMENT,
	initial text,
	num integer,
	unit varchar (10)
	)
	
INSERT INTO times (initial, num, unit)
SELECT
	age_upon_outcome as initial,
	substr(age_upon_outcome,1, instr(age_upon_outcome,' ')-1) as num,
    trim(replace(age_upon_outcome,substr(age_upon_outcome,1, instr(age_upon_outcome,' ')-1),''))  as unit
FROM short 											--!!!!!!!!!!!!!!!!!!!!!




