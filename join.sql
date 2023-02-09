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

