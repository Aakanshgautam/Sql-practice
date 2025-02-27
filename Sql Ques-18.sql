/*## Question 18 (Role-Based Access Control)
Create a permission structure for an inventory management system with these roles:
- Inventory Manager: Full access to all tables
- Stock Clerk: Can view all tables, update inventory quantities
- Analyst: Can only view (SELECT) all tables
- Auditor: Can only view inventory and audit_log tables

Expected Output after running GRANT commands:
```
Role              | Select | Insert | Update | Delete | References | Trigger
------------------|---------|---------|---------|---------|------------|----------
inventory_manager | Yes    | Yes    | Yes    | Yes    | Yes       | Yes
stock_clerk      | Yes    | No     | Partial| No     | No        | No
analyst          | Yes    | No     | No     | No     | No        | No
auditor          | Partial| No     | No     | No     | No        | No
```    */

 create role 'inventory manager';                      -- to create role inventory manager
 
 -- to grant full acces  to all tables
 grant select ,insert , update,delete,references,trigger on * . *   to 'inventory manager';
 
 create role 'stock_clerk';                           -- to create role stock clerk
 
 -- to grant access only to view tables 
 grant  select on * . * to  'stock_clerk';
 
 -- grant  access only to updates in inventory tables
 grant update on inventory to 'stock_clerk';
 
 create role 'analyst';                              --  to create role analyst
 
 -- grant access only to view all tables 
 grant select on * . *  to 'analyst';
 
 create role "Auditor";                             -- to crate role auditor
 
 -- to grant  access  only to view inventory table, audit_log table
 grant select on inventory   to "Auditor";
 grant select on audit_log to "Auditor";