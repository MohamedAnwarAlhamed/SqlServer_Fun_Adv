cursor 
declare ddd cursor for select 
open 
fetch next from ddd into varaiable
while @@fetch_status = 0
begin
    -- do something
    fetch next from ddd into variable
end
close
deallocate ddd
----------------------------------
declare ddd cursor for select
open
fetch next from ddd into variable
while @@fetch_status = 0
begin
    -- do something
    fetch next from ddd into variable
end
close
deallocate ddd
----------------------------------
declare @customer_id bigint 
declare @Total_price decimal(18,2)
declare @Total_Purchase decimal(18,2) = 0

set @customer_id = 10

declare data cursor 
         for select Total_pirce from sales where Customer_Id = @customer_id
open data
fetch next from data into @Total_price
while @@fetch_status = 0
begin
    set @Total_Purchase = @Total_Purchase + @Total_price
    fetch next from data into @Total_price
end

print @Total_Purchase
update Customer 
set Total_Purchase = @Total_Purchase
where Customer_Id = @customer_id
close data
deallocate data
