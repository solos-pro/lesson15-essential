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
	id integer,
	animal_id varchar(7),
	name varchar(30),
	birthday date,
	FOREIGN KEY (id)	REFERENCES animals("index")
	)

INSERT INTO animal (id, animal_id, name, birthday)
SELECT "index", animal_id, name, date_of_birth
FROM short 											--!!!!!!!!!!!!!!!!!!!!!
---------------------------------------------------------------------------

drop table animal 

CREATE TABLE times (
    id integer,
	initial text,--age_upon_outcome
	age integer,--age_upon_outcome
	ageUnit varchar (10),--age_upon_outcome
	outcome_month integer,
	outcome_year integer,
	PRIMARY KEY (id),
    FOREIGN KEY (id)	REFERENCES animals("index")
	)
	
INSERT INTO times (id, initial, age, ageUnit, outcome_month, outcome_year)
SELECT
	"index" as id,
	age_upon_outcome as initial,
	substr(age_upon_outcome,1, instr(age_upon_outcome,' ')-1) as age,
    trim(replace(age_upon_outcome,substr(age_upon_outcome,1, instr(age_upon_outcome,' ')-1),''))  as ageUnit,
    outcome_month,
    outcome_year
FROM short 											--!!!!!!!!!!!!!!!!!!!!!

---------------------------------------------------------------------------
select A.id, A.animal_id, A.name, T.age, T.ageUnit, T.outcome_month, T.outcome_year, B.breed, C.color, typeAnimal.typeAnimal
from animal as A
LEFT join times as T ON A.id=T.id
LEFT JOIN animal_breed as AB ON A.id=AB.animal_id
LEFT JOIN breeds as B ON AB.breed_id=B.breed_id
LEFT JOIN animal_color as AC ON A.animal_id=AC.animal_id
LEFT JOIN colors as C ON AC.color_id=C.color_id
LEFT JOIN animal_type as ATy ON A.id=ATy.animal_id
LEFT JOIN typeAnimal ON ATy.type_id=typeAnimal.type_id 

select breed from animal_breed ab
---------------------------------------------------------------------------
create table fruit (
	
	)
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

CREATE TABLE outcomeType (
	outcomeType_id integer PRIMARY KEY AUTOINCREMENT,
	outcomeType varchar (10))

INSERT INTO outcomeType (outcomeType)
SELECT DISTINCT outcome_type FROM animals

drop table outcomeType

create table animal_outcomeType (
     animal_id integer,
     outcomeType_id integer,
     PRIMARY KEY (animal_id),
     FOREIGN KEY (animal_id)	    REFERENCES animals("index"),
     FOREIGN KEY (outcomeType_id) 	REFERENCES outcomeType(outcomeType_id)
     )

INSERT INTO animal_outcomeType (animal_id, outcomeType_id)
SELECT 	animals."index",
		outcomeType.outcomeType_id
FROM animals
JOIN outcomeType ON animals.outcome_type=outcomeType.outcomeType

---------------------------------------------------------------------------

CREATE TABLE outcomeSubtype (
	outcomeSubtype_id integer PRIMARY KEY AUTOINCREMENT,
	outcomeSubtype varchar (10))

INSERT INTO outcomeSubtype (outcomeSubtype)
SELECT DISTINCT outcome_subtype FROM animals

drop table outcomeSubtype

create table animal_outcomeSubtype (
     animal_id integer,
     outcomeSubtype_id integer,
     PRIMARY KEY (animal_id),
     FOREIGN KEY (animal_id)	        REFERENCES animals("index"),
     FOREIGN KEY (outcomeSubtype_id)    REFERENCES outcomeSubtype(outcomeSubtype_id)
     )

INSERT INTO animal_outcomeSubtype (animal_id, outcomeSubtype_id)
SELECT 	animals."index",
		outcomeSubtype.outcomeSubtype_id
FROM animals
JOIN outcomeSubtype ON animals.outcome_subtype=outcomeSubtype.outcomeSubtype

---------------------------------------------------------------------------


