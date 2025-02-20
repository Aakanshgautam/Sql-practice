/*## Question 10 (Stored Procedure)
Create a stored procedure called `transfer_inventory` that:
- Takes  source_warehouse_id, target_warehouse_id, product_id, and quantity  as parameters
- Transfers specified quantity from source to target warehouse
- Includes error handling for insufficient stocktransfer_inventory
- Logs the transfer in a new audit_log table
- Returns success/failure message

Test the procedure with:
- Success case: Transfer 50 units of product_id 1 from warehouse 1 to warehouse 2
- Failure case: Try to transfer 1000 units (more than available) */

create table audit_log (source_warehouse_id int, 
target_warehouse_id int, 
 product_id int,  
quantity int);

select *from inventory;
desc inventory;
call transfer_inventory(1,2,2,10);
select * from audit_log;

Alter table inventory modify inventory_id int not null auto_increment;





CREATE DEFINER=`root`@`localhost` PROCEDURE `transfer_inventory`(IN source_warehouse_id int, IN target_warehouse_id int, IN t_product_id int, IN t_quantity int)
BEGIN
	declare v_count int;
	declare w_count int;
    -- we need to check the procrdure parameters (quantity, product_id,source_werehouse_id) is in the inventory table or not , 
    -- if the given parameters is in the table we increase count 
	select count(1) into v_count
	from inventory
	where warehouse_id = source_warehouse_id
	and product_id = t_product_id
	and quantity >= t_quantity ;

   -- we check here if the count>0 means paramters are in the inventory table then transfer the quantity 
   -- from source to target and update it into the inventory 
   

	if v_count>0 then 
		update inventory set quantity = quantity-t_quantity where warehouse_id = source_warehouse_id;
        
      -- we also need to check the given target_warehouse_id,product_id  is in the inventory or not
      -- here we create count, if the the parameters are in inventory  then count>0
		select count(1) into w_count
		from inventory
		where warehouse_id = target_warehouse_id
		and product_id = t_product_id;
      
      
       -- if count>0  update the value into inventory
		if w_count>0 then
			update inventory  set quantity= quantity + t_quantity where warehouse_id = target_warehouse_id and product_id = t_product_id;
           
		else 
          -- if the values are not in inventory than insert it into inventory
			insert into inventory values(inventory_id, t_product_id, target_warehouse_id, t_quantity, current_timestamp());
		end if ;
        
		insert into audit_log values(source_warehouse_id, target_warehouse_id, t_product_id, t_quantity);
	else
		select "Insufficient Quantity";
	end if;
END