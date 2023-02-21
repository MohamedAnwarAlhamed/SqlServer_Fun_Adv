/*varaible and conditional*/
declare @s varchar(100) = 'Hello World'
declare @x int = 30
declare @y int = 20
declare @z int = @x + @y
declare @m int = (select avg(st_age) from student)
select @l = 4;
set @f = 5;
print @z /* begin and end like {} */
--------------------------------------------
if @x > @y
begin
    print 'x value' + cast(@x as varchar)
    print 'x is greater than y'
end
else
    print 'y is greater than x'
--------------------------------------------
declare @t table(int id)
insert into @t 
select st_id from student 
select * from @t
--------------------------------------------
declare @id int 
update student 
set st_age = 20, @id = st_id
where st_fname = 'ali'
select @id
--------------------------------------------
declare @x int = 3
select top(@x)*
from student
--------------------------------------------
/*loop statement*/

select @n=phone from customer where customer_Id = 1;
select @n=sum(Total_price) from Sales
--------------------------------------------
declare @fac int =1;
declare @n int;

set @n=7;
while @n > 0
begin
    set @fac = @fac * @n
    set @n = @n - 1
end

print @fac
--------------------------------------------
--control of flow statements
--if
declare @x int 
update student 
set st_age = 21
where st_age =20
select @x=@@rowcount
if @x=1
    select 'one row affected'
else if @x>1
    select 'multiple rows affected'
--if exists
if exists(select * from student where st_age = 21)
    select 'record found'
else
    select 'record not found'
--while 
declare @x int =1
while @x <= 5
    begin
    set @x = @x + 1
    if @x = 3
        continue
    if x = 4
        break
    select @x
    end 
--begin end
--continue
--breake
--case
update Instructor
set salary =  -- 
    case -- في حالة
    when salary < 1000 then salary * 1.20
    when salary > 1000 then salary * 1.10
    else salary * 1.30
    end

select ins_name,salary= 
           case
           when salary >= 2000 then 'high salary'
           when salary >= 1000 then 'medium salary'
           else 'low salary'
           end  
from Instructor

select ins_name, gender=
                case gender
                 when 'F' then 'female'
                 when 'M' then 'male'
                 end 
from Instructor


