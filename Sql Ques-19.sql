/*Question on self join 
Write a query to find all employees who joined after their manager.

hashtag#Create_the_Employees_table
CREATE TABLE Employees_linkedin2 (
employee_id INT PRIMARY KEY,
employee_name VARCHAR(255),
hire_date DATE,
manager_id INT 
);

hashtag#Insert_data_into_the_Employees_table
INSERT INTO Employees_linkedin2 (employee_id, employee_name, hire_date, manager_id) VALUES
(1, 'John Doe', '2023-01-15', NULL), 
(2, 'Jane Smith', '2023-02-20', 1),
(3, 'David Lee', '2023-03-10', 1),
(4, 'Sarah Jones', '2022-01-05', 2);
 
Expected O/P:  */


-- in this question we need to compare the rows of same table ,
-- so we used self join and apply condition emplopyees who joined after their manager

select e1.employee_name from Employees_linkedin2 as e1
join  Employees_linkedin2 as e2
on  e2.employee_id = e1.manager_id
where e1.hire_date > e2.hire_date;