create clustered index myindex
on coures(crs_name)

create nonclustered index myindex
on coures(crs_name)

select * from courses
where crs_name = 'java'
---------------------------------- 
-- auto for pk an Qk
create index IX_Customer_FName
on Customer(First_name)

drop index IX_Customer_FName on Customer

create index IX_Customer_FName
on Customer(First_name, last_name)

create index IX_Customer_FName
on Customer(First_name desc, last_name asc)
include (email)


