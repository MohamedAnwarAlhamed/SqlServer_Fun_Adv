select * from product 
where market_price > (select avg(market_price) from product);
order by market_price desc;
--------------------------------------------------
select * from sales
where employee_id in (select employee_id from employee where gender = 'M')
--------------------------------------------------
select * from customer
where customer_id in (select customer_id from sales group by customer_id having count(*) > 3)
--------------------------------------------------
select * from customer 
where customer_id in(
    select customer_id from sales
    where year(sales_date) = 2010
    group by customer_id
    having sum(total_price) > 10000
)
--------------------------------------------------
select *, (select count(*) from product where category_id = product_categories.category_id)
from product_categories
--------------------------------------------------
select *, (select sum(Total_price) from sales 
            where customer_id = customer.customer_id)
from customer
--------------------------------------------------
 select *, (select sum(quentity) from sales_products 
                where product_id = product.product_id)
from product
--------------------------------------------------
update customer 
        set Total_purchaces = (select sum(Total_price) from sales 
                                where customer_id = customer.customer_id)
--------------------------------------------------
update product 
set market_price = market_price * 1.1
where product_id in(
    select product_id
    from product 
    where product_id not in (select distinct product_id from sales_products)
)
--------------------------------------------------
select * from customer
where customer_id in()
select customer_id 
from sales join sales_products
on sales.sales_id = sales_products.sales_id
where year(sales_date) = 2018 and product_id = 2)
--------------------------------------------------
select * into TopCustomer2018 from customer 
where 1 = 2

insert into TopCustomer2018
select * from customer 
where customer_id in(
    select customer_id from sales
    where year(sales_date) = 2018
    group by customer_id
    having sum(total_price) > 10000
)
--------------------------------------------------
select * 
from product 
where market_price > all (select market_price from product where category_id = 1)
--------------------------------------------------
select * 
from product 
where market_price > any (select market_price from product where category_id = 1)
--------------------------------------------------
select * 
from product a 
where exists(select product_id
            from product 
            where category_id = 2 and product_id = a.product_id
)
--------------------------------------------------
select * 
from product_categories 
where not exists(select * from product 
                where category_id = product_categories.category_id)
--------------------------------------------------
select * from customer
where exists(select customer_id 
            from sales
            where year(sales_date) = 2018
            and month(sales_date) = 5)
            and customer_id = customer.customer_id)
--------------------------------------------------
select * from student
where st_age > (select avg(st_age) from student)
--------------------------------------------------
select *, (select count(st_id) from student)
from student
--------------------------------------------------
