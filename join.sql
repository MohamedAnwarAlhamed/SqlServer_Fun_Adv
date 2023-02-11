select unambiguous column name
from table1 as A  join_type table2 as b on join_conditions
where row_conditions

--join_type
--1) inner join -> [self join]
--2) outer join -> [left outer join, right outer join, full outer join]
--3) cross join -> [self join]
--4) natural join -> [self join]
--5) self join -> [inner join, outer join, cross join, natural join]
-----------------------------------------------------
select * 
from product join product_categories 
     on product.category_id = product_categories.category_id
-----------------------------------------------------
select product_id, product_name, category_name, product.category_id, 
product_categories.category_id
from product join product_categories 
     on product.category_id = product_categories.category_id
----------------------------------------------
select E.*, monthly_salary
from employee as E join employee_fixed as F
        E.employee_id = F.employee_id
where contract_type = 'fixed'
----------------------------------------------
select E.*, monthly_salary
from employee as E left join employee_fixed as F
        E.employee_id = F.employee_id
where contract_type = 'fixed'
----------------------------------------------
select product_id, product_name, category_name, product.category_id, 
product_categories.category_id
from product right join product_categories 
     on product.category_id = product_categories.category_id
where category_name is null
----------------------------------------------
select product_id, product_name, category_name, product.category_id, 
product_categories.category_id
from product full join product_categories 
     on product.category_id = product_categories.category_id
where category_name is null
----------------------------------------------
select *
from customer join sales
        on customer.customer_id = sales.customer_id
    join sales_product 
        on sales.sales_id = sales_product.sales_id
    join product
        on sales_product.product_id = product.product_id
where first_name = 'Merlene' and last_name = 'Vinson'
----------------------------------------------
--join, cross join
select st_fname, dept_name
from student s, department d

select st_fname, dept_name
from student s, department d

--inner join, equi join
select st_fname, dept_name
from student s , department d
where s.dept_id = d.dept_id

select st_fname, dept_name
from student s inner join department d
        on s.dept_id = d.dept_id
--outer join
--left outer join, right outer join, full outer join
select st_fname, dept_name
from student s left outer join department d
        on s.dept_id = d.dept_id
where dept_name is null

select st_fname, dept_name
from student s right outer join department d
        on s.dept_id = d.dept_id
where st_fname is null

select st_fname, dept_name
from student s full outer join department d
        on s.dept_id = d.dept_id
where st_fname is null or dept_name is null

--self join
select s1.st_fname, s2.st_fname
from student s1, student s2
where s1.st_fname = s2.st_fname

select s1.st_fname, s2.st_fname
from student s1 inner join student s2
        on s1.st_fname = s2.st_fname


