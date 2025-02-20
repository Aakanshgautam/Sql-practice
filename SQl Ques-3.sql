/*Question 3 (SEMI JOIN)
Find all suppliers who supply products that have current inventory levels below 100 units in any warehouse. Show supplier name, country,
 and reliability score. Order by reliability score descending.

Expected Output:
```
supplier_name      | country     | reliability_score
------------------|-------------|------------------
FitLife Supplies  | USA         | 4.90
TechPro Solutions | USA         | 4.80
SmartHome Devices | South Korea | 4.50
*/

-- we need  to retrieve the records from suppliers table for which there are corresponding matching records with inventory table 
-- and apply filter based on quantity where quantity <100


select supplier_name, country, reliability_score            
from suppliers s
where exists (select 1 from inventory as i where i.quantity <100 and  i.supplier_id = s.supplier_id);