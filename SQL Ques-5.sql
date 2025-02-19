/*## Question 5 (Multiple Aggregations)
Generate a warehouse analytics report showing:
- Total number of products
- Average quantity per product
- Total inventory value
- Maximum and minimum stock levels
- Number of distinct categories
Group by warehouse location and only show warehouses with total inventory value > $50,000.

Expected Output:
```
location    | product_count | avg_quantity | total_value | max_stock | min_stock | category_count
------------|--------------|--------------|-------------|-----------|-----------|---------------
Chicago, IL | 8            | 245.5        | 75890.50    | 500       | 125       | 4
Dallas, TX  | 7            | 232.1        | 68720.25    | 450       | 100       | 3
[...]
*/


select w.location as location,
count(p.product_id) as product_count,                 -- used count() to count the product
avg(i.quantity) as avg_quantity,                      -- to calculate the avg quantity
sum(p.base_price * i.quantity) as Total_value ,       -- to calculate the total value of the products 
max(i.quantity) as max_count,                         -- to find  max quantity  
min(i.quantity) as min_count,                         -- to find min quantity
count(p.category) as category_count                   -- to calculate category
from products as p
inner join inventory as i                            -- we need columns from threee  table so we used inner join  
on p.product_id = i.product_id
inner join warehouses as w
on i.warehouse_id = w.warehouse_id 
group by w.location having sum(p.base_price * i.quantity)>50000;    -- we applied group on warehouse location,and having clause based on given condition 
                                                                    
