insert into department (dept_id, dept_name, dept_lacatoin) values (1, 'IT', 'alex')
insert into department values (2, 'HR', 'cairo')
---------------------------
update employee 
set salary = 1500
where gender = 'F'

update project 
set PName = 'HR'
where PName = 'IT'

update employee 
set salary = salary + (salary * 0.1)
where EmDeptId = 4 and gender = 'M'


delete from emlopyee 
where gender = 'F'
and age>60;

delete from ProjectEmps;
---------------------------
update department set deptmanagerid = NULL

truncate table ProjectEmps;
---------------------------
-- some operationa with a where clause
-- = > >= < <= <> 
-- between and, in, like, is null, is not null
-- and, or, not