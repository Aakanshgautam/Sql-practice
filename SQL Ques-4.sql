
/*Question 4 (CROSS JOIN)
Generate a report showing all possible product-warehouse combinations for 'Sports' category products and 'Large' type
 warehouses to help with expansion planning. Show product name, warehouse location, and warehouse capacity.

Expected Output:
```
product_name  | location    | capacity
-------------|-------------|----------
Yoga Mat     | Dallas, TX  | 15000
Yoga Mat     | Chicago, IL | 20000
Yoga Mat     | Houston, TX | 16000
Running Shoes| Dallas, TX  | 15000
[...all combinations...] */

Select p.product_name, w.location , w.capacity                 -- column we ned 
from products as p
cross join warehouses as w                                    -- we need to fetch all possible product warehouses combination we did cartesian product  
where p.category = 'Sports' AND w.warehouse_type='Large'      -- filter based on the category and warehouse_type
order by p.product_name desc;