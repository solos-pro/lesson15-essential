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

INSERT INTO breeds (breed) 
SELECT DISTINCT breed FROM animals

create table animal_breed (
     animal_id integer,
     breed_id integer,
     PRIMARY KEY (animal_id),
     FOREIGN KEY (animal_id)	REFERENCES animals("index"),
     FOREIGN KEY (breed_id) 	REFERENCES breeds("breed")
     )

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
	initial text,--age_upon_outcome
	num integer,--age_upon_outcome
	unit varchar (10),--age_upon_outcome
	outcome_month integer,
	outcome_year integer
	)
	
INSERT INTO times (initial, num, unit, outcome_month, outcome_year)
SELECT
	age_upon_outcome as initial,
	substr(age_upon_outcome,1, instr(age_upon_outcome,' ')-1) as num,
    trim(replace(age_upon_outcome,substr(age_upon_outcome,1, instr(age_upon_outcome,' ')-1),''))  as unit,
    outcome_month,
    outcome_year
FROM short 											--!!!!!!!!!!!!!!!!!!!!!
---------------------------------------------------------------------------

CREATE TABLE typeAnimal (
	type_id integer PRIMARY KEY AUTOINCREMENT,
	typeAnimal varchar (10))

INSERT INTO typeAnimal (typeAnimal) 
SELECT DISTINCT animal_type FROM animals

drop table typeAnimal

create table animal_type (
     animal_id integer,
     type_id integer,
     PRIMARY KEY (animal_id),
     FOREIGN KEY (animal_id)	REFERENCES animals("index"),
     FOREIGN KEY (type_id) 		REFERENCES typeAnimal(type_id)
     )

INSERT INTO animal_type (animal_id, type_id)
SELECT 	animals."index",
		typeAnimal.type_id 
FROM animals
JOIN typeAnimal ON animals.animal_type=typeAnimal.typeAnimal 
---------------------------------------------------------------------------

CREATE TABLE typeAnimal (
	type_id integer PRIMARY KEY AUTOINCREMENT,
	typeAnimal varchar (10))

INSERT INTO typeAnimal (typeAnimal) 
SELECT DISTINCT animal_type FROM animals

drop table animal_type

create table animal_type (
     animal_id integer,
     type_id integer,
     PRIMARY KEY (animal_id),
     FOREIGN KEY (animal_id)	REFERENCES animals("index"),
     FOREIGN KEY (type_id) 		REFERENCES typeAnimal(typeAnimal)
     )

INSERT INTO animal_type (animal_id, type_id)
SELECT 	animals."index",
		typeAnimal.type_id 
FROM animals
JOIN typeAnimal ON animals.animal_type=typeAnimal.typeAnimal 


---------------------------------------------------------------------------

CREATE TABLE outcomeType (
	type_id integer PRIMARY KEY AUTOINCREMENT,
	typeAnimal varchar (10))

INSERT INTO typeAnimal (typeAnimal) 
SELECT DISTINCT animal_type FROM animals

drop table animal_type

create table animal_type (
     animal_id integer,
     type_id integer,
     PRIMARY KEY (animal_id),
     FOREIGN KEY (animal_id)	REFERENCES animals("index"),
     FOREIGN KEY (type_id) 		REFERENCES typeAnimal(typeAnimal)
     )

INSERT INTO animal_type (animal_id, type_id)
SELECT 	animals."index",
		typeAnimal.type_id 
FROM animals
JOIN typeAnimal ON animals.animal_type=typeAnimal.typeAnimal 




