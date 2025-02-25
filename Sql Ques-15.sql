/*## Question 15 (RANK, DENSE_RANK, ROW_NUMBER)
Create a warehouse performance report showing:
- Regular ranking by total inventory value
- Dense ranking by number of products
- Row number by average quantity
Include only warehouses handling >5 products.

Expected Output:
```
warehouse    | total_value | value_rank | products | product_rank | avg_qty | qty_rn
-------------|-------------|------------|----------|--------------|---------|--------
Chicago      | 120500.75  | 1          | 12       | 1            | 245     | 3
Dallas       | 120500.75  | 1          | 10       | 2            | 300     | 1
Seattle      | 98750.50   | 3          | 10       | 2            | 280     | 2  */  

Select w.location as warehouse, 
  sum(p.base_price * i.quantity)as total_value ,
  rank() over(order by sum(p.base_price * i.quantity) )as value_rank, 
  count(*) as product,
  dense_rank()over(order by count(*)) as product_rank,
  avg(i.quantity) as avg_qty,
  Row_number()over() qty_rn from products p
inner join inventory i
on p.product_id = i.product_id
inner join warehouses w
on i.warehouse_id = w.warehouse_id
group by w.warehouse_id;



-- in this question we fetch value_rank based on total value we used simple rank fxn
-- and shows product_rank based on product by using dense rank as given in question and shows qty _rn based on avg quantity


Select * from products;
select * from inventory;
select * from warehouses;
