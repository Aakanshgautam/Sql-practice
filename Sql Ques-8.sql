
/*## Question 8 (UNION and UNION ALL)
Create a report showing:
1. Products with zero inventory (from LEFT JOIN)
2. Products with over 400 units in any warehouse
3. Products with value over $10,000 in any warehouse
Label each row with its source category.

Expected Output:
```
source_category | product_name    | quantity | value
----------------|----------------|----------|-------
No Stock        | Smart Watch    | 0        | 0.00
High Stock      | Backpack       | 450      | 22495.50
High Value      | Gaming Mouse   | 350      | 20996.50
[...]
``` */
-- in this quetion we applied 
select "No Stock" source_category, p.product_name, i.quantity as quantity ,(p.base_price* i.quantity) value 
from products as p
left join inventory as i
on p.product_id= i.product_id
where  (i.quantity)=0
union 
select "High Stock" source_category ,p.product_name,i.quantity as quantity ,(p.base_price* i.quantity) value 
from products as p 
left join inventory as i
on p.product_id= i.product_id
where quantity >400
union 
select "High Value" source_category ,p.product_name,i.quantity as quantity ,(p.base_price* i.quantity) value 
from products as p 
left join inventory as i
on p.product_id= i.product_id
where (p.base_price* i.quantity) >10000;

-- in this question we are going to categorise the product in three category No stock ,High stock, High value
-- firstly we took the product which are not in in stock we applied left join as we need to check for all the product_id , 
-- then we check for High stock if the quantity greater than 400 
-- then we check for High Value  if the Products with value over $10,000 in any warehouse 
-- after we did the unoin with the result of these three query
 
 
 
