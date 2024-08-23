Scenario: Apply a 15% discount, round the discounted price to 2 decimal places, and show both the ceiling and floor values of the final discounted price.

---

•  Using an Equi Join:
Write a query to list all employees and their salaries using an equi join between the Employees and Salaries tables.
•  Using a Self Join:
Write a query to list each employee and their manager's name using a self join on the Employees table.
•  Using GROUP BY with HAVING:
Write a query to calculate the average salary by department. Use GROUP BY and filter out departments where the average salary is below 6000.
•  Using GROUP BY with Grouping Sets:
Write a query using grouping sets to calculate the total salary by department and the overall total salary.
•  Querying Data by Using Subqueries:
Write a query to list all employees whose salary is above the average salary using a subquery
•  Using the EXISTS Keyword:
Write a query to list all employees who have received a salary in 2024 using the EXISTS keyword.
•  Using the ANY Keyword:
Write a query to find employees whose salary is greater than the salary of any employee in the Engineering department.
•  Using the ALL Keyword:
Write a query to find employees whose salary is greater than the salary of all employees in the Finance department.
•  Using Nested Subqueries:
Write a query to list employees who earn more than the average salary of employees in the HR department using nested subqueries.
•  Using Correlated Subqueries:
Write a query to find employees whose salary is above the average salary for their respective department using a correlated subquery.
•  Using UNION:
Write a query to list all employee names from the HR and Finance departments using UNION.
•  Using INTERSECT:
Write a query to list employees who have worked in both Finance and Engineering using INTERSECT.
•  Using EXCEPT:
Write a query to list employees who are in Finance but not in HR using EXCEPT.
•  Using MERGE:
Write a query using MERGE to update employee salaries based on a new table of salary revisions. If the employee exists, update their salary; if not, insert the new employee and salary.

---

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(255),
    department VARCHAR(255),
    manager_id INT
);

CREATE TABLE Salaries (
    salary_id INT PRIMARY KEY,
    employee_id INT,
    salary DECIMAL(10, 2),
    salary_date DATE,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);



INSERT INTO Employees (employee_id, employee_name, department, manager_id) VALUES
(1, 'John Doe', 'HR', NULL),
(2, 'Jane Smith', 'Finance', 1),
(3, 'Robert Brown', 'Finance', 1),
(4, 'Emily Davis', 'Engineering', 2),
(5, 'Michael Johnson', 'Engineering', 2);

INSERT INTO Salaries (salary_id, employee_id, salary, salary_date) VALUES
(1, 1, 5000, '2024-01-01'),
(2, 2, 6000, '2024-01-15'),
(3, 3, 5500, '2024-02-01'),
(4, 4, 7000, '2024-02-15'),
(5, 5, 7500, '2024-03-01');


----

1. Calculate the total amount spent by each customer.
 
2. Find customers who have spent more than $1,000 in total.
 
3. Find Product Categories with More Than 5 Products
 
4. Calculate the total number of products for each category and supplier combination.
 
5. Summarize total sales by product and customer, and also provide an overall total.
 
 
has context menu

![image](https://github.com/user-attachments/assets/010ca5a8-d599-4247-a343-fe4501f30a8f)
