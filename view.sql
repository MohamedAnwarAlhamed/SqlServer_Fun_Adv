create view v1 as 
select st_id, st_fname
from student 

select * from v1
------------------------
create view v2 as (id, name) 
select st_id, st_fname
from student 

select * from v2
------------------------
create view v3 as (id, name) 
with encryption
select st_id, st_fname
from student 
------------------------
create view v4 
as 
select st_id, st_name, s.dept_id, dept_name
from student s, Department d
where s.dept_id = d.dept_id

select * from v4

insert into v4(st_id, st_name, dept_id, dept_name) values(1, 'ahmed', 1, 'cs')
update v4 set st_name = 'ali' where st_id = 1
------------------------
create view v5
as
select * from student 
where St_address in ('sanaa', 'aden')

update v5 set st_address = 'sanaa' where st_address = 'aden'
update v5 set st_address = 'taiz' where st_address = 'sanaa'

insert into v5 values(1, 'ahmed', 'sanaa', 20, 1)
------------------------
create view v6
as
select * from student 
where St_address in ('sanaa', 'aden')
with check option

update v5 set st_address = 'sanaa' where st_address = 'aden'
update v5 set st_address = 'taiz' where st_address = 'sanaa'
------------------------
create view v7
with schemabinding
as 
select st_id, st_name, st_age
from dbo.student
where st_age between 20 and 30

create unique clustered index idx on v7(st_id)


