insert into colors (name)
select * from
(select distinct rtrim(color1) from animals
union
select rtrim(color2) from animals
where color2 is not null);




create table age_uppon (
    id_age_uppon INTEGER PRIMARY KEY AUTOINCREMENT,
    age_upon_outcome TEXT,
    cnt_args INT,
    name_args VARCHAR(10)  )

insert into age_uppon (age_upon_outcome,cnt_args,name_args)
select distinct
       age_upon_outcome
     , substr(age_upon_outcome,1, instr(age_upon_outcome,' ')-1) as cnt_args
     , trim(replace(age_upon_outcome,substr(age_upon_outcome,1, instr(age_upon_outcome,' ')-1),''))  as name_args
from animals;

select *
from animals an
left join age_uppon au on an.age_upon_outcome=au.age_upon_outcome;