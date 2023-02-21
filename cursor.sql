--cursor 
declare ddd cursor for select 
open 
fetch next from ddd into varaiable or fetch ddd int variable
while @@fetch_status = 0
begin
    -- do something
    fetch next from ddd into variable or fetch ddd int variable
end
close
deallocate ddd
----------------------------------
declare ddd cursor for select
open
fetch next from ddd into variable
while @@fetch_status = 0
begin
    -- do something
    fetch next from ddd into variable
end
close
deallocate ddd
----------------------------------
declare @customer_id bigint 
declare @Total_price decimal(18,2)
declare @Total_Purchase decimal(18,2) = 0

set @customer_id = 10

declare data cursor 
         for select Total_pirce from sales where Customer_Id = @customer_id
open data
fetch next from data into @Total_price
while @@fetch_status = 0
begin
    set @Total_Purchase = @Total_Purchase + @Total_price
    fetch next from data into @Total_price
end
print @Total_Purchase
update Customer 
set Total_Purchase = @Total_Purchase
where Customer_Id = @customer_id
close data
deallocate data
----------------------------------
declare c1 cursor 
for select st_id, st_name from student
for read only
declare @id int
declare @name varchar(50)
open c1
fetch c1 into @id, @name
while @@fetch_status = 0
begin
    select @id, @name
    fetch c1 into @id, @name
end
close c1
deallocate c1
----------------------------------
declare c2 cursor
for select ins_name, salary from instructor
     where salary is not null
for update 
declare @n varchare(50)
declare @sal int
open c2
fetch c2 into @n, @sal
while @@fetch_status = 0
begin
    if @sal <= 2000 then 
        update instructor set salary = @sal * 1.2 where where current of c2
    else 
        update instructor set salary = @sal * 1.1 where where current of c2
    end
    fetch c2 into @n, @sal
end
close c2
deallocate c2
