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

select m.employee_name from Employees_linkedin2 as e
join  Employees_linkedin2 as m
on  e.employee_id = m.manager_id
where e.hire_date < m.hire_date;
