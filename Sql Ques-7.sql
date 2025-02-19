-- ## Question 7 (Complex GROUP BY with conditions
-- Find product categories where:
-- - Average inventory value > $10,000
-- - At least 3 different products in stock
-- - Maximum quantity of any product > 200
-- Show category, product count, avg value, and highest stocked product name.

-- Expected Output:
-- ```
-- category    | product_count | avg_value | highest_stocked_product
-- ------------|--------------|-----------|----------------------
-- Electronics | 5            | 12500.75  | Gaming Mouse
-- Sports      | 4            | 11200.50  | Yoga Mat
-- [...]
-- ``` 



 select p.category,                                -- columns we need
 count(p.product_id) as product_count, 
 avg(i.quantity * p.base_price) as avg_value,
 p.product_name as highest_stocked_product
 from products as p 
 inner join inventory as i                        -- we need columns from products table ,inventory table we used inner join 
 on p.product_id = i.product_id
 group by p.category                              -- we need to find all the categories related values so we did group by with category
 having  avg(i.quantity * p.base_price) >10000    -- we need to filter basesd on Average inventory value > $10,000
 and count(i.product_id)>=3                       -- and atleat three different product in stock and quantity >200
 and max(i.quantity)>200; 
