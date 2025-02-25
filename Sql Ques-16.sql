/*## Question 16 (Self Join)
Find all pairs of products that:
- Are in the same category
- Have price difference < $20
- Are stocked in same warehouse
List them as potential substitute products.

Expected Output:
```
category    | product1     | price1 | product2     | price2 | warehouse
------------|-------------|---------|--------------|---------|----------
Electronics | Gaming Mouse | 59.99   | Keyboard    | 49.99   | Seattle
Sports      | Yoga Mat    | 29.99   | Water Bottle| 19.99   | Dallas
``` */

select a.category,a.product_name as product1, a.base_price  as price1 ,b.product_name as product2,b.base_price as price2, warehouses.location
from products a join products b
on a.category = b.category
join inventory
on a.product_id = inventory.product_id
join warehouses
on inventory.warehouse_id=warehouses.warehouse_id
 where abs(a.base_price-b.base_price)<20
 and a.product_id != b.product_id;
 
 
 -- we need to find the product of same category and having price difference<20  
 -- we need to compare the data of the same table so we used to self join based on category
 -- and join with inventory and warehouse to find warehouses location 
 -- (there is no direct relation with products and warehouses table so we use inventory table to join)
 -- and applied a filter condition where(a.base_price-b.base_price)<20, and a.product_id !=b.product_id
 
