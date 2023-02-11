select  col1, col2, col3
union 
select col1, col2, col3
---------------------------
select st_lname from student 
union all
select ins_name from instructor

select st_lname from student 
intersect
select ins_name from instructor

select st_lname from student 
except
select ins_name from instructor
---------------------------
select first_name, last_name
from customer
union 
select first_name, last_name
from employee

select first_name, last_name
from customer
union all
select first_name, last_name
from employee

select first_name, last_name
from customer
union 
select first_name, last_name
from employee
order by last_name

select first_name, last_name
from customer
intersect 
select first_name, last_name
from employee

select first_name, last_name
from customer
except 
select first_name, last_name
from employee
---------------------------
select c.customer_id,first_name + ' ' + last_name as fullname
from customer c join sales s on c.customer_id = s.customer_id
where year(sale_date) = 2005
and month(sale_date) = 9
except 
select c.customer_id,first_name + ' ' + last_name as fullname
from customer c join sales s on c.customer_id = s.customer_id
where year(sale_date) = 2005
and month(sale_date) = 12
---------------------------
select distinct product_name
from product join sales_products
on product.product_id = sales_products.product_id
where month(sale_date) = 9 and year(sale_date) = 2005
intersect
select distinct product_name
from product join sales_products
on product.product_id = sales_products.product_id
where month(sale_date) = 8 and year(sale_date) = 2005
---------------------------
select First_nme + ' ' + Last_nme, monthly_salary
from employee join employee_fixed 
on employee.emp_id = employee_fixed.emp_id
union 
select First_nme + ' ' + Last_nme, working_hourly * hour_salary
from employee join employee_hourly 
on employee.emp_id = employee_hourly.emp_id
---------------------------
select st_id, st_fname from student
union all 
select ins_id, ins_name from instructor
