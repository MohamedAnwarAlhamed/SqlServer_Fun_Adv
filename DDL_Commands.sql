alter table projectEmps add HourPrice int check (HourPrice >= 0)
---------------------------
alter table projectEmps drop column HourPrice;
---------------------------
alter table projectEmps drop constraint c1;
---------------------------
alter table Departments alter column DepName varchar(50) not null;
---------------------------
alter table Departments add ManagerId int references Employees(EmpId);
---------------------------
alter table bill add finalamount as (totalamount - discount);
---------------------------
create table test
(
    id int identity(1,1),
    name varchar(50)
)

drop table test;
-------------datatypes----------------
-- interger
-- float - real - double - decimal(5,2)
-- char(200) - varchar(50)
-- date - time - datetime - 
-- bit - binary(50)

-------------constraints----------------
-- primary key
-- foreign key
-- unique
-- check
-- default
-- not null
-- identity(1,1)
---------------------------------------
delete from emlopyee 
where gender = 'F'
and age>60;

update department set deptmanagerid = NULL

delete from ProjectEmps;

truncate table ProjectEmps;
---------------------------------------
create table test
(
    id int identity(1,1),
    name varchar(50)
    department_id int,
    foreign key (department_id) references department(dept_id)
)
-- no action (on delete, on update)
-- cascade (on delete, on update)
-- set null (on delete, on update)
-- set default (on delete, on update)