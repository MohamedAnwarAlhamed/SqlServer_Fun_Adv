-- get the last generated identity column value
SELECT SCOPE_IDENTITY() AS LastID
SELECT @@IDENTITY AS LastID
SELECT ident_current('tableofname') AS LastID

--Replicate, Space, Patindex, Replace and Stuff functions
select replicate('a', 5) --aaaaa
select space(5) -- '     '
select patindex('%a%', 'abc') -- 1
select replace('abc', 'abc', 'aaa') -- bbc
select stuff('sam@gamil.com', 2, 3, 'aaaaa') -- saaaaagamil.com

/*
The Master database is the primary configuration database in SQL Server. 
It contains information on all the databases that exist on the server, 
including the physical database files and their locations. 
The Master database also contains SQL Server's configuration settings and 
login account information.
The Model database is the template database that SQL Server uses to create new 
databases. Each time you create a new database in SQL Server, 
the contents of the Model database are copied to the new database to 
establish its default objects, including tables, stored procedures, 
and other database objects.
The msdb database is used by SQL Server Agent for scheduling alerts and jobs 
and by other features such as SQL Server Management Studio, Service Broker and 
Database Mail. For example, SQL Server automatically maintains a complete online
backup-and-restore history within tables in msdb.
The tempdb system database is a global resource that holds: Temporary user 
objects that are explicitly created. They include global or local temporary 
tables and indexes, temporary stored procedures, table variables, 
tables returned in table-valued functions, and cursors.
A report server is a stateless server that uses the SQL Server Database Engine 
to store metadata and object definitions. A native mode Reporting Services 
installation uses two databases to separate persistent data storage from 
temporary storage requirements. The databases are created together and bound 
by name.
A database snapshot is a read-only, static view of a SQL Server database 
(the source database). The database snapshot is transactionally consistent with 
the source database as of the moment of the snapshot's creation. A database 
snapshot always resides on the same server instance as its source database.
*/
select * into test from students  
select * into Mytest from students where 1 = 2
select top(5)* from students 

select top(5)* with ties st_age 
from students  
order by st_age desc

select top(5) percent * from students
select *,newid() from students

select st_lname from student 
union all
select ins_name from instructor

select st_lname from student 
intersect
select ins_name from instructor

select st_lname from student 
except
select ins_name from instructor

select st_fname, st_age, ROW_NUMBER() over (order by st_age) as 'order by age'
from students

select st_fname, st_age, rank() over (order by st_age desc) as 'rank'
from students

select st_fname, st_address, st_age,
        row_number() over(order by st_age) as 'order by age',
        rank() over(order by st_age) as 'rank',
        dense_rank() over(order by st_age) as 'exact ranking'
from students

select st_fname, st_address, st_age,
        row_number() over(order by st_address, st_age desc) as 'order by age'
from students

select st_fname, st_age,
        row_number() over(order by st_age desc) as 'order by age'
from students

select st_fanme, st_age
from 
(select * 
       row_number() over(order by st_age) as rn,
        rank() over(order by st_age) as r,
        dense_rank() over(order by st_age) as dr
from student
) as newtable
where dr <= 3

/*
What is a NDF file? 
A file wiht .ndf extension is a secondary database file used by 
Microsoft SQL Server to store user data. NDF is secondary storage file because 
SQL server stores user specified data in primary storage file known as MDF. 
NDF data file is optional and is user-defined to manage data storage in case the
primary MDF file uses all the allocated space. It is usually stored on separate
disk and can spread to multiple storage devices. The presence of MDF files is
necessary in order to open NDF files.

What is a MDF file? 
A file with .mdf extension is a Master Database File used by 
Microsoft SQL Server to store user data. It is of prime importance as all 
the data is stored in this file. The MDF file stores users data in relational 
databases in the form columns, rows, fields, indexes, views, and tables. SQL
Server allows to set autogrow and autoshrink settings to have a positive 
impact on the performance of the database. MDF files can be loaded and attached
to a database using Microsoft SQL Server. MDF files have 
Application/octet-stream mime type.

What is a LDF file? 
A file with .ldf extension is a log file maintained by Microsoft SQL Server 
which is a relational database management system (RDBMS). All the transactions 
performed on primary database files (MDF)(such as insertion, update, deletion) 
are recorded in the LDF file. LDF files are critical components of any database.
In case of a system failure, the log file is used to restore the database to a 
consistent state. Transactions log file can increase in size if transactions 
are not fully committed. LDF files can be opened with Microsoft SQL Server 
software application.
*/

------------constraints in sql-------------------
-- constraint c1 primary key
-- constraint c2 check(salary > 1000) or check(address in ('sanaa','aden'))
-- constraint c3 unique 
-- constraint c4 foreign key(----) references ---(---)
-- Default 'male'
-- not null

create rule as @x > 1000;

create default deft as 1000; 

truncate table table_name;
------------------------------
select productid, quentity,
        prod_prev = lag(quentity) over(order by quentity),
        prod_next = lead(quentity) over(order by quentity)
from mysales

select productid, quentity,
        prod_prev = lag(quentity) over(partition by productid order by quentity),
        prod_next = lead(quentity) over(partition by productid order by quentity)
from mysales

select productid, quentity,
        lowest = first_value(quentity) over(partition by productid order by quentity),
        highest = last_value(quentity) over(partition by productid order by quentity),
        prod_prev = lag(quentity) over(partition by productid order by quentity),
        prod_next = lead(quentity) over(partition by productid order by quentity)
from mysales

select productid, quentity,
        prod_prev = lag(quentity) over(partition by productid order by quentity),
        prod_prev_diff = quentity - isnull(lag(quentity) over(partition by productid order by quentity),0)
from mysales
---------------------------
--local temp table(session based table)
create table #table1
(
    id int identity(1,1),
    name varchar(50)    
)

--shared table
create table ##table1
(
    id int identity(1,1),
    name varchar(50)    
)




