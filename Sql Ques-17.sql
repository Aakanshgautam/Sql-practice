/*## Question 17 (FIRST_VALUE, LAST_VALUE, NTILE)
Analyze product performance by:
- First and last products sold in each category
- Product price quartiles within category
- Comparison with category boundaries

Expected Output:
```
category    | product_name | price | first_sold | last_sold | quartile | price_range
------------|-------------|-------|------------|-----------|----------|-------------
Electronics | Smart Watch | 199.99| Earbuds    | Keyboard  | 4        | High
Sports      | Yoga Mat    | 29.99 | Shoes      | Weights   | 2        | Medium-Low
```
*/
select * ,case when quartile =1 then 'Low' 
    when quartile =2 then 'medium_low' 
    when quartile=3 then "medium" 
    else "high" 
    end as price_range 
from(select  p.category ,
 p.product_name, 
 p.base_price,
 first_value(product_name)over (partition by p.category order by i.last_updated  )as first_sold,
 last_value(product_name)over(partition by p.category order by i.last_updated ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED  FOLLOWING) as last_sold,
 ntile(4)over(partition by p.category  order by p.base_price) as quartile
  from products p
inner join inventory i
on p.product_id = i.inventory_id)as t
 

--   we need to find name of the product which is  last_sold,first _sold witin their category and categorise the products based on price
-- in inner query we used first_value fxn ,last_value()to find the first sold product,last_sold product in this we partion by category 
-- bcoz we need first sold and last sold from their category only 
-- and order by last_updated to find first sold ,last sold with the help of date time
-- ntile is used to divide each windows in  four parts 
-- we use outer query to divide data based in the price that high ,low,medium,medium low