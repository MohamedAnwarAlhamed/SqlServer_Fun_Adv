create type TVP as table
(
    id int,
    name varchar(50)
)  
-------------------------------------

declare @x as TVP

insert into @x values(1,'ahmed'),(2,'ali'),(3,'mohammed')

select * from @x As x 
-------------------------------------
create proc p1 (@tvp1 as TVP readonly)
as
select * from @tvp1


declare @x as TVP
insert into @x values(1,'ahmed'),(2,'ali'),(3,'mohammed')
exec p1 @x
-------------------------------------
create function f1 (@tvp1 as TVP readonly)
return int 
AS
begin
    declare @c int 
    select @c = count(*) from @tvp1
    return @c
end

declare @x as TVP
insert into @x values(1,'ahmed'),(2,'ali'),(3,'mohammed')
select dbo.f1(@x)