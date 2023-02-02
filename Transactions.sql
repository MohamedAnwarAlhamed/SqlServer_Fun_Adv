--batch script transaction

--batch
insert into student(st_id, st_name) values (1, 'John')
update student set st_age = 'John' where st_id = 21

--script
insert into student(st_id, st_name) values (1, 'John')
go
update student set st_age = 'John' where st_id = 21

--transaction
begin transaction  
--insert
--update
--delete
commit rollback
----------------------------------------
begin transaction
insert into student(st_id, st_name) values (1, 'John')
insert into student(st_id, st_name) values (2, 'John')
insert into student(st_id, st_name) values (3, 'John')
commit tran

begin transaction
insert into student(st_id, st_name) values (1, 'John')
insert into student(st_id, st_name) values (2, 'John')
insert into student(st_id, st_name) values (3, 'John')
rollback tran
----------------------------------------
begin transaction
insert into student(st_id, st_name) values (1, 'John')
insert into student(st_id, st_name) values (2, 'John')
insert into student(st_id, st_name) values (3, 'John')
if @@error != 0
         rollback tran
else 
         commit tran
----------------------------------------
begin try 
     begin transaction 
        insert into student(st_id, st_name) values (1, 'John')
        insert into student(st_id, st_name) values (2, 'John')
        insert into student(st_id, st_name) values (3, 'John')
        commit tran
        print 'transaction commited'
end try
begin catch
        rollback
        print 'transaction rolled back'
        select error_number() as "number",
        error_message() as "message",
        error_line() as "line"
end catch


