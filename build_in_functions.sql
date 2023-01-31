-- aggregate count(), sum(), avg(), min(), max()
select Country_Nmae, count(Customer_Id) 
from Customers join Countries on Customers.Country_Id = Countries.Country_Id
group by Country_Name
having  count(Customer_Id) > 1
-----------------------------------------
select Countries.Country_Name, count(Sales.Customert_id)
from Sales join Customers on Sales.Customer_Id = Customers.Customer_Id 
join Countries on Customers.Country_Id = Countries.Country_Id
where year(Sales.Sale_Date) = 2019
-----------------------------------------
select Country_Name, gender_id , count(Customer_Id)
from Customers join Countries on Customers.Country_Id = Countries.Country_Id
group by Country_Name, gender_id
order by Country_Name, gender_id
-----------------------------------------
select Country_Name, count(case when Customer.gender_id = 1 then 1 end) male,
                    count(case when Customer.gender_id = 2 then 1 end) female,
                    count(*) all_customer
from Customers join Countries on Customers.Country_Id = Countries.Country_Id
group by Country_Name
order by Country_Name
-----------------------------------------
select Gender.gender_name,
        count(case when Employee.Contract_Type = 'FIXED' then 1 end) fixed,
        count(case when Employee.Contract_Type = 'HOURLY' then 1 end) hourly,
        count(*)
from Employee join Gender on Employee.Gender_Id = Gender.gender_id
group by   gender_name
-----------------------------------------
-----------------------------------------
--date
select getdate()
select CURRENT_TIMESTAMP
select year(getdate()) or year('2019-01-01')
select month(getdate()) or month(hire_date)
select day(getdate())
select datepart(week, getdate()) --year, hour, minute, second, dayofyear, dayofweek
--https://www.w3schools.com/sql/func_sqlserver_datepart.asp

select datediff(year, '2019-01-01', '2019-01-02')

select first_name, hire_date, datediff(year, hire_date, getdate()) as years
from Employee

select dateadd(month, 1, '2019-01-01')
--https://www.w3schools.com/sql/sql_ref_sqlserver.asp
-----------------------------------------
-----------------------------------------

--string
--convrting
--controlling