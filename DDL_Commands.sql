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
-- interger, smallint, tinyint, bigint
-- float - real - double - decimal(5,2) - numeric(5,2) - money - smallmoney - numeric(18,0), 
-- char(200) - varchar(50), nchar(50), nvarchar(50) - text - ntext
-- date - time - datetime - datetime2 - smalldatetime - datetimeoffset
-- bit - binary(50) - varbinary(50) - image - timestamp 

-------------constraints----------------
-- primary key
-- foreign key
-- unique
-- check
-- default
-- not null
-- identity(1,1)
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