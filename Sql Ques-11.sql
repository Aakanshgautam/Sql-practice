/*## Question 11 (COALESCE, NULLIF, LPAD/RPAD)- Product code (LPAD with zeros to 5 digits)
- Product name (RPAD with dots to 30 characters)
- Current stock (COALESCE with 'Out of Stock')
- Stock status (NULLIF comparison with minimum threshold)
For all products in Electronics category.

Expected Output:
```
product_code | formatted_name                | stock_level | status
-------------|------------------------------|-------------|--------
00001        | Wireless Earbuds............| 150         | NORMAL
00002        | Gaming Mouse................| Out of Stock| LOW
00006        | Smart Watch................. | 175         | NULL
``` */

select * from inventory;
insert into inventory values(21, 20, 1, null, current_timestamp());

Select  LPAD(p.product_id ,5,'0') as Product_code,                -- lpad is used to add the required no of zero in product_id 
rpad(p.product_name,30,'.') as formatted_name,                    -- rpad to add the required no of dots to right side of product_name
coalesce(i.quantity,"out of stock") as stock_level,               -- colesce to fetch the non null value
nullif(case when i.quantity =0 then "low"                         -- nuulif to compare the  two expression if both the expression  
when i.quantity>0 and i.quantity<=150 then "Normal"               -- are equal it return null  or if both the expression are different  
when i.quantity>150   then "high"                                 -- then it return the firstexpression
else "empty"end, null) as status from products p
join inventory i                                                  -- join the products table with inventory to find the stock level  coressponds to the product_code
on p.product_id = i.product_id;
