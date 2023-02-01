/*
trigger
DML (insert, update, delete)
DDL (create, alter, drop)
1- log (AUDITTING)
2- consistency
*/
create trigger TRG_SalesProduct
       on Table Name
       after, instead of, for
       after insert, update, delete
as 
begin
    inserted_table (New Data)
    deleted_table (Old Data)
    
    insert into (inserted_table)
    update (inserted_table, deleted_table)
    delete  (deleted_table)
    -- trigger body
end
-------------------------------------------------
create trigger TRG_SalesProduct
       on Sales_Product
       after insert, update, delete
as
begin
    declare @sale_id int,
            @Quentity decimal(7,2),
            @unit_Price decimal(7,2),
    if exists (select * from inserted)
    begin
        select @sale_id = sale_id,
               @Quentity = Quentity,
               @unit_Price = unit_Price
        from inserted
        update Sales set Total = Total + (@Quentity * @unit_Price)
        where sale_Id = @sale_id
    end
     if exists (select * from deleted)
    begin
        select @sale_id = sale_id,
               @Quentity = Quentity,
               @unit_Price = unit_Price
        from deleted
        update Sales set Total = Total - (@Quentity * @unit_Price)
        where sale_Id = @sale_id
end
       