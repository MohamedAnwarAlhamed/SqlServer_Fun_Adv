create Sequence Mysequence
start with 1
increment by 1
maxvalue 100
minvalue 1
cycle;

insert into person1 values(next value for Mysequence,'ahmed',20);

alter sequence Mysequence 
restart with 1
increament by 1
cycle;

drop sequence Mysequence;
---------------------------
select name, minimum_value, maximum_value, increment_value, is_cycled, current_value
from sys.sequences
where name = 'Mysequence';
