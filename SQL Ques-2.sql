/*Question 2 (INNER JOIN)
List all warehouses that store electronics products, along with the total quantity and total value of
 electronics inventory (quantity * base_price). Only include warehouses with electronics inventory worth over $20,000. 
 Order by total value descending.

Expected Output:
```
location    | total_quantity | total_value
------------|---------------|-------------
Seattle, WA | 350           | 31497.50
Boston, MA  | 365           | 25696.35
Chicago, IL | 275           | 21997.25``` */


select w.location,i.quantity as toatal_quantity, (i.quantity * p.base_price) as total_value   -- columns we need
from warehouses as w
inner join inventory  as i                         -- we need values that match in warehoues table and product table                                        
on w.warehouse_id= i.warehouse_id
inner join products as p                               -- join product table with inventory table
on i.product_id= p.product_id 
where p.category = 'Electronics'  and  (i.quantity * p.base_price) >20000      -- filter based on category and price 
order by  total_value desc;