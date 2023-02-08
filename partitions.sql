create partition function mypfun(int)
as range right 
for values(1000, 2000)

create patition scheme mypscheme
as partition mypfun
to(fg1, fg2, fg3)

create table emp
(
    empid int,
    empname varchar(20),
    salary int
) on mypscheme(salary)

select *, $partition.myfun(salary)
from emp