insert into colors (name)
select * from
(select distinct rtrim(color1) from animals
union
select rtrim(color2) from animals
where color2 is not null);




