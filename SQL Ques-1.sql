use aakanshdb;

/* ## Question 1 (LEFT JOIN)
Find all products and their current inventory levels in Seattle warehouse (warehouse_id = 1), including products with no inventory. 
Display product name, category, and quantity. Order by quantity descending, with NULLs last.

Expected Output:
```
product_name        | category    | quantity
-------------------|-------------|----------
Gaming Mouse       | Electronics | 200 */

Select p.product_name ,p.category, i.quantity       -- columns we need 
from products as p                  
left join inventory as i                            -- We need all the left table values and the matching values from the right table
on p.product_id =i.product_id                       
where i.warehouse_id = 1                              -- we need only the products  which are in warehouse whose id =1
order by i.quantity  desc ;



