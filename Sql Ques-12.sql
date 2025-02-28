-- ## Question 12 (Cumulative Sum and Average)
-- Generate a monthly sales trend analysis showing:
-- - Running total of inventory value
-- - Running average of quantity
-- - Percentage of total inventory
-- Ordered by warehouse location and product category.

-- Expected Output:
-- ```
-- location    | category    | quantity | running_total | running_avg | pct_of_total
-- ------------|------------|----------|---------------|-------------|-------------
-- Chicago, IL | Electronics| 250      | 12500.00      | 250.00      | 15.5
-- Chicago, IL | Sports     | 300      | 27500.00      | 275.00      | 28.3
-- Dallas, TX  | Electronics| 200      | 37500.00      | 250.00      | 35.8

  select w.location ,
   p.category, 
   i.quantity,
   round(sum(i.quantity * p.base_price)over(ROWS BETWEEN  UNBOUNDED PRECEDING  AND current row), 2)as running_total,  -- we need to find running sum 
   round(avg(i.quantity * p.base_price)over(ROWS BETWEEN  UNBOUNDED PRECEDING  AND current row), 2) as running_avg,   -- running avg
   round(((i.quantity * p.base_price)*100)/sum(i.quantity * p.base_price)over(ROWS BETWEEN  UNBOUNDED PRECEDING  AND unbounded following) ,2) as pct_of_total    -- percentage of every inventory value
from products p             
inner join inventory i
on p.product_id =i.product_id
inner join warehouses w 
on i.warehouse_id = w.warehouse_id; 