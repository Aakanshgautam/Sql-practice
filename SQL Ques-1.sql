/* ## Question 1 (LEFT JOIN)
Find all products and their current inventory levels in Seattle warehouse (warehouse_id = 1), including products with no inventory. Display product name, category, and quantity. Order by quantity descending, with NULLs last.

Expected Output:
```
product_name        | category    | quantity
-------------------|-------------|----------
Gaming Mouse       | Electronics | 200 */

Select p.product_name ,p.category, coalesce(i.quantity,0) as quantity from products as p
left join inventory as i
on p.product_id =i.product_id
left join warehouses as w
on i.warehouse_id = w.warehouse_id
where w.warehouse_id=1
order by i.quantity  desc ;