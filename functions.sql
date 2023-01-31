/*
scalar function
inline function
https://www.w3schools.com/sql/sql_ref_sqlserver.asp
--https://www.mssqltips.com/sqlservertip/2655/format-sql-server-dates-with-format-function/
*/
create function FunctionName (@param1 int, @param2 varchar(50))
        returns int
as
begin
    return 10   
end
-------------------------------------------------- 
create function GetEmployeeSalary (@EmployeeID bigint)
        returns decimal(7,2)
as
begin 
    declare @Salary decimal(7,2)
    declare @Contract_Type varchar(200)
    select @Contract_Type = Contract_Type from Employee where EmployeeId = @EmployeeId
    if  @Contract_Type is null
        begin
        set @Contract_Type = 0
        --print 'Employee does not exist'
        end
    if @contract_Type = 'FIXED'
         select @Salary = Monthly_Salary from Employee_Fixed where EmployeeId = @EmployeeId
    else
         select @Salary = Hour_Salary*Working_Hour from Employee_Hourly where EmployeeId = @EmployeeId   
        
    return @Salary
end

select EmployeeId, first_name, GetEmployeeSalary(EmployeeId) 
from Employee
--------------------------------------------------
create function GetCustomerTotalPurchases (@CustomerID bigint)
        returns decimal(7,2)
as
begin 
    declare @TotalPurchases decimal(7,2)
    select @TotalPurchases = sum(Total_Price) from Sales where CustomerId = @CustomerId
    return @TotalPurchases
end

select *, GetCustomerTotalPurcgases(CustomerId)
from Customer
--------------------------------------------------
create function GetAVG(@StdNo bigint)
        returns decimal(5,2)
as
begin 
    declare @AVG decimal(5,2) = 0;
    select @AVG = sum(StudentSubject.Mark*Subject.SubHr)/sum(Subject.SubHr) 
    from StudentSubject INNER JOIN Subject ON 
    StudentSubject.SubNo = Subject.SubNo
    where StudentSubject.StdNo = @StdNo
    return @AVG
end

select StdNo, StdName, GetAVG(StdNo) 
from Student
--------------------------------------------------
create function getname(@id int)
returns varchar(50)
as 
begin
    declare @name varchar(50)
    select @name = st_fname from student where st_id = @id
    return @name
end
select getname(1) 
--------------------------------------------------
create function getsal(@sal1 int, @sal2 int)
return table 
as 
return 
(
    select ins_name, salary from Instructor where salary between @sal1 and @sal2
)

select * from getsal(1000, 2000)
--------------------------------------------------
create function getstudentnames(@format varchar(50))
return @t table (id int, name varchar(50))
as 
begin 
    if @format = 'first'
        insert into @t
        select st_id, st_fname from student
    else if @format = 'last'
        insert into @t
        select st_id, st_lname from student
    else
        insert into @t
        select st_id, st_fname + ' ' + st_lname from student
return
end 

select * from getstudentnames('first')
--------------------------------------------------
--------------------build in functions------------
select Ins_Name, IIF(salary > 3000, 'High', 'Low')
from Instructor

like 

select Ins_Name, case when salary > 3000 then 'High' else 'Low' end
from Instructor
--
declare @x int = 3;
select CHOOSE(@x, 'one', 'two', 'three', 'four') AS Chooseee

select CHOOSE(1, 'one', 'two', 'three', 'four')
from student 
where st_id <= 4
---
select year(getdate())
select month(getdate())
select day(getdate())
----
select isnull(st_fname, '')
from student

select coalesce(salary, bouns, 0)
from Ins_Course

select st_fname + convert(varchar(10), st_age)
from student

select st_fname + cast(st_age as varchar(10))
from student

select getdate()
select convert(varchar(10), getdate(), 3)
select db_name()
select SUSER_NAME()

--srting
select upper(st_fname) from student
select lower(st_fname) from student
select SUBSTRING(st_fname, 1, 3) from student
select concat(st_fname, ' ', st_lname) from student

--math
select power(salary, 3) from Instructor
--agg
select count(*) from student
select count(st_fname) from student
select avg(isnull(salary, 0)) from Instructor

--date
select getdate()
select datename(MM, getdate())
select FORMAT(getdate(), 'dd/MM/yyyy')
select FORMAT(getdate(), 'dd/MM/yyyy hh:mm:ss')
select FORMAT(getdate(), 'dddd mmmm yyyy')
select Dept_name, FORMAT(Manager_hiredate, 'dd/MM/yyyy') As FormattedDate 
from Department
--------------------------------------------------
declare @id int 
update student 
set st_age = 20, @id = st_id
where st_id = @id
select @id
--------------------------------------------------
declare @col varchar(50)
declare @t varchar(50)

set @col = 'st_fname'
set @t = 'student'

execute ('select ' + @col + ' from ' + @t)
--------------------------------------------------
select @@rowcount 
select @@identity
select @@servername
select @@version
select @@language
SET LANGUAGE 'Arabic'
select @@language
--------------------------------------------------
declare @t table (int id)
insert into @t 
select st_id from student

select * from @t