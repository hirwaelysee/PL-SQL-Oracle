-- 1. Select all columns from the Products table.
-- 2. Select only product_name and unit_price from the Products table.
-- 3. Select all columns from the Suppliers table using *.
-- 4. Select the category_name from Categories with an alias Category.
-- 5. Select product_name and give it an alias Item Name.
-- 6. Select all fields from Stock_In and use an alias for the table.
-- 7. Select supplier_id and company_name from Suppliers using an alias for each column.
-- 8. Select stock_out_id, product_id, quantity from Stock_Out and rename quantity as QtySent.

select * from PRODUCTS;

select product_name, UNIT_PRICE from PRODUCTS;

select * from SUPPLIERS;

select category_name as Category from CATEGORIES;

select product_name as Item_Name from PRODUCTS;

select * from STOCK_IN elysee;

select supplier_id as id, company_name as company from SUPPLIERS;

select stock_out_id, product_id, quantity as QtySent from STOCK_OUT;