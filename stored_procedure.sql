--drop, alter, create procedure
create procedure name or create proc name
        @param1 type,
        @param2 type output
as
begin
        statements
end 
----------------------------
create procedure Customer_total_purchases
        @customer_id bigint,
        @total_purchases decimal output
        @sales_count decimal output
---------------------------
create procedure SalesDate
as
begin
        select * from Sales;
end

exec SalesDate
---------------------------
create procedure SalesDate
        @customerId bigint = null
        @min_price decimal(7,2)
        @max_price decimal(7,2) = 99999
as
begin
        select * from Sales
        where Total_price >= @min_price
        and (CustomerId = @customerId or 
                    @customerId is null)
        and Total_price <= @max_price
end

exec SalesDate 10, 100.00
---------------------------
create procedure InsertUpdateOnDepartment
        @DeptNo int,
        @DeptName varchar(50),
        @DeptParent int
as
begin
        if not exists (select * from Department where DeptNo = @DeptParent)
                begin
                    print 'Parent department does not exist' 
                    return;
                end
        if not exists (select * from Department where DeptNo = @DeptNo)
                begin
                    insert into Department
                    values (@DeptNo, @DeptName, @DeptParent)
                end
        else
                begin
                    update Department
                    set DeptName = @DeptName,
                    DeptParent = @DeptParent
                    where DeptNo = @DeptNo
                end

end

exec InsertUpdateOnDepartment 10, 'Sales', 1
---------------------------
create procedure GetEmployeeSalary
        @EmployeeId bigint,
        @salary decimal output
as
begin
        declare @contract_type varchar(200)
        select @contract_type = Contract_Type
        from Employee
        where EmployeeId = @EmployeeId
        if @contract_type is NULL
            begin
                set @salary = 0
                print 'Employee does not exist'
            end
        if @contract_type = 'FIXED'
                select @salary = Monthly_Salary from Employee_Fixed
                where EmployeeId = @EmployeeId
        else
                select @salary = Hour_salary * Working_Hour from Employee_Hourly
                where EmployeeId = @EmployeeId
end
declare @salary decimal
exec GetEmployeeSalary 1, @salary output
print @salary
---------------------------
create procedure updateSaleProductsAsString
        @saleId bigint,
        --@products varchar(200)
begin
        declare @product_Name nvarchar(300), @Quantity decimal(7,2),
                @productsString nvarchar(MAX) = ''
        declare Products cursor
             for select Product_Name, Quantity
                from Sales_Products inner join Product
                on Sales_Products.Product_Id = Product.Product_Id
                where SaleId = @saleId
        open Products
        fetch next from Products into @product_Name, @Quantity
        while @@fetch_status = 0 
                begin
                    set @productsString = @productsString + ',' + @product_Name + '(' + cast(@Quantity as varchar(10)) + ')'

                        fetch next from Products into @product_Name, @Quantity
                end
                update Sales set ProductsString = @productsString
                where SaleId = @saleId
                --print @productsString
                close Products
                deallocate Products

end

exec updateSaleProductsAsString 1
---------------------------
--/////////////////////////
--/////////////////////////
create proc p2 @id int, @name varchar(50),@age int
as 
declare @i int = (select st_id from student where st_id = @id)
if(@age<30 and @i is null)
insert into student (st_id, st_name, st_age) values (@id, @name, @age)
else 
print 'invalid age or id'

exec p2 1, 'abc', 20
---------------------------
create proc p3 @id int
as 
declare @age int
select @age = st_age from student where st_id = @id
return @age

declare @a int
exec @a = p3 1
select @a
---------------------------
create proc p3 @id int, @age int output
as 
seelct @age = st_age from student where st_id = @id

declare @a int
exec p3 1, @a output
select @a
---------------------------
declare @t table(age int)
create proc p3 @id int, @t table output
as 
select @age = st_age from student where st_id = @id
---------------------------
create proc p5 @x int,@y int = 10
as 
select @x + @y

exec p5 @y = 10, @x = 5
---------------------------
create proc p7 @col varchar(50), @t varchar(50)
with encryption
as 
execute ('select ' + @col + ' from ' + @t)

exec p7 'st_id, st_name', 'student'
---------------------------
sp_help p7