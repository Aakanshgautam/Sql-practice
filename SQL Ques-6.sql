-- ## Question 6 (MERGE/UPSERT)
-- Using this temporary table structure and data:
-- ```sql
CREATE table inventory_updates (
    inventory_id INT,
    product_id INT,
    warehouse_id INT,
    new_quantity INT,
    last_updated timestamp
);
Select * from inventory_updates;

INSERT INTO inventory_updates VALUES
(1, 1, 1, 200, current_timestamp),  -- Update existing
(25, 20, 1, 100 ,current_timestamp); -- Insert new


-- Write a MERGE (UPSERT) query to update inventory quantities, inserting new records if they don't exist. */

insert into inventory (inventory_id, product_id, warehouse_id, quantity, last_updated)
select inventory_id, product_id, warehouse_id, new_quantity, last_updated from inventory_updates
on duplicate key update
quantity = values(quantity),
last_updated = values(last_updated);

  -- in this question we need to insert the value if it is not there or if the values is there  then update
  -- we need to insert the value into inventory  we took the value from the inventory_updates table  and match it with inventory table 
  -- by using the clause on duplicate key update we check for the quantity ,last updated value 