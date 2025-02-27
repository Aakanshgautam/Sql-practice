/*## Question 14 (Single-Row and Multi-Row Subqueries)
-- Find products that meet ALL these conditions:
-- - Price higher than average category price (single-row subquery)
-- - Stocked in warehouses with >80% capacity utilization (multi-row subquery)
-- - Total inventory value higher than any Sports category product (multi-row subquery)

-- Expected Output:
-- ```
-- product_name    | category    | price  | total_value | warehouses
-- ----------------|------------|--------|-------------|------------
-- Gaming Mouse    | Electronics| 199.99 | 45000.50   | Seattle, Dallas
-- Smart Watch     | Electronics| 159.99 | 42500.75   | Chicago, Boston */


select  p.product_name, 
    p.category,p.base_price,
    sum(i.quantity* p.base_price) as total_value,
    w.location as warehouse 
from products p
inner join inventory i 
on p.product_id= i.product_id
inner join warehouses w
on i.warehouse_id=w.warehouse_id
where  p.base_price > (select avg(base_price) from products group by category having category=p.category)

and w.warehouse_id = (select warehouse_id from (select product_id, sum(quantity) qt, warehouse_id from inventory 
group by product_id having product_id = i.product_id and qt > .01 * (w.capacity)) temp)

and (i.quantity* p.base_price)>  (select max(i.quantity* p.base_price) q 
from products p 
inner join inventory i
on p.product_id= i.product_id
where p.category ='Sports') ;



  
  select * from warehouses;
  

  select * from inventory;
  delete  from inventory where inventory_id between 21 and 25;
  
  --  in this question we need to fetch the productname,category ,price ,toatalvalue(sum(i.quantity* p.base_price)) , warehouse location
  -- we need to apply inner join to fetch these columns from the tables
  -- after that we applied some given condition 
  -- 1.condition. Price higher than average category price -(for this we writen a subquery that select only the avg(base_price) from 
  -- product after we did group by category as we need to find average baseprice and apply having condition to compare based on category) 
  -- 2.condition- Stocked in warehouses with >80% capacity utilization - we wrote a subquery which checks sum(quantity )>80% capacity utilization
  -- 3.condition- Total inventory value higher than any Sports category product (we need to calculate the max of inventory value  of sports category product
  -- and compare it with all the  inventory value )