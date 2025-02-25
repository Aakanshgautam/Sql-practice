/*## Question 13 (LEAD/LAG Analysis)
Analyze inventory changes by comparing:
- Current quantity with previous month
- Current quantity with next month
- Percentage change from previous
- Projected next month change
For each product in a specific warehouse.

Expected Output:
```
product_name    | current_qty | prev_month_qty | next_month_qty | pct_change | projected_change
----------------|-------------|----------------|----------------|------------|------------------
Wireless Earbuds| 150         | 120            | 180            | +25%       | +20%
Gaming Mouse    | 200         | 180            | 220            | +11%       | +10%
Smart Watch     | 175         | NULL           | 160            | NULL       | -8.5% */

select t.product_name , current_qty ,prev_month_qty,next_month_qty, pct_change,projected_change from (select p.product_name ,i.last_updated, i.quantity as current_qty ,
lag(i.quantity)over( partition by p.product_id order by i.last_updated)as prev_month_qty,
lead(i.quantity) over(partition by p.product_id order by i.last_updated) as next_month_qty,
((i.quantity -lag(i.quantity)over( partition by p.product_id order by i.last_updated))/lag(i.quantity)over( partition by p.product_id order by i.last_updated) *100) as pct_change,
((lead(i.quantity) over(partition by p.product_id order by i.last_updated)  - i.quantity)/lead(i.quantity) over(partition by p.product_id order by i.last_updated))*100 as projected_change
from products p 
inner join inventory i
on p.product_id = i.product_id ) as t where month(t.last_updated) = month(current_timestamp());

-- in this question we need to compare the qty  of the previous month ,current month,next month and find the the percentagecanges 
-- from lastmonth to current month and next mont to current month
-- we use the lead and lag fxn to find previous month and next month quantity respectively
-- in this question i used subquery approch, in inner query i fetch the prev_month _qty,next_month_qty,pct-change,projected_change by using inner join
-- in outer query filterd the given output based on condition ie.month(t.last_updated) = month(cuurrent(current_timestamp())

