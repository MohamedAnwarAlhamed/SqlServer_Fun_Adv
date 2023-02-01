/*
trigger create, alter, drop, disable, enable
DML (insert, update, delete)
DDL (create, alter, drop)
1- log (AUDITTING)
2- consistency
*/
create trigger TRG_SalesProduct
       on Table Name
       after, instead of, for
       after insert, update, delete
as 
begin
    inserted_table (New Data)
    deleted_table (Old Data)
    
    insert into (inserted_table)
    update (inserted_table, deleted_table)
    delete  (deleted_table)
    -- trigger body
end
-------------------------------------------------
create trigger TRG_SalesProduct
       on Sales_Product
       after insert, update, delete
as
begin
    declare @sale_id int,
            @Quentity decimal(7,2),
            @unit_Price decimal(7,2),
    if exists (select * from inserted)
    begin
        select @sale_id = sale_id,
               @Quentity = Quentity,
               @unit_Price = unit_Price
        from inserted
        update Sales set Total = Total + (@Quentity * @unit_Price)
        where sale_Id = @sale_id
    end
     if exists (select * from deleted)
    begin
        select @sale_id = sale_id,
               @Quentity = Quentity,
               @unit_Price = unit_Price
        from deleted
        update Sales set Total = Total - (@Quentity * @unit_Price)
        where sale_Id = @sale_id
end
-------------------------------------------------
create trigger t1
on student 
after INSERT
as 
begin
    select getdate()
end

    insert into student values(99)
-------------------------------------------------
create trigger t2
on student
instead of update 
as 
begin
    select suser_name()
end

update student set st_age = 30
-------------------------------------------------
create trigger t3
on student
instead of delete, update, insert
as
begin
    select "not allowed"
end
-------------------------------------------------
create trigger t4
on student
as 
begin
if update(st_age)
end
-------------------------------------------------
create trigger t5
on student
after insert, update, delete
as 
begin
    if(datetime(MM,getdate()) = 'March')
    rollback
end
-------------------------------------------------
create trigger t6
on instructor
for update
as 
begin
    insert into audit values(suser_name(), getdate(),(select ins_id from deleted))
   select * from inserted
   select * from deleted
end

update instructor set ins_name = 'ahmed'
where ins_id = 1
-------------------------------------------------
create trigger t1
on database 
for create_table, alter_table, drop_table
as
begin 
    rollback
end 

drop trigger t1
drop table t1
-------------------------------------------------
create trigger t2
on database
for ddl_database_level_events
as 
begin
    declare @x xml = eventdate()
    select @x
end
-------------------------------------------------
create trigger t3
on all server
for ddl_login_events
as 
begin
    print cast(eventdata() as varchar(200))
end




       