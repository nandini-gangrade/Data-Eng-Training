-- 1. Create Table (Employees)

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,        -- Primary Key: Employee ID
    FirstName VARCHAR(50),             -- First Name of Employee
    LastName VARCHAR(50),              -- Last Name of Employee
    Position VARCHAR(50),              -- Job Title
    Department VARCHAR(50),            -- Department Name
    HireDate DATE                      -- Date of Hiring
);

-- 2. Insert Operation (Create)
-- Inserting employee records into the Employees table

INSERT INTO Employees (EmployeeID, FirstName, LastName, Position, Department, HireDate)
VALUES 
(1, 'Amit', 'Sharma', 'Software Engineer', 'IT', '2022-01-15'),
(2, 'Priya', 'Mehta', 'Project Manager', 'Operations', '2023-02-20'),
(3, 'Raj', 'Patel', 'Business Analyst', 'Finance', '2021-06-30'),
(4, 'Sunita', 'Verma', 'HR Specialist', 'HR', '2019-08-12'),
(5, 'Vikram', 'Rao', 'Software Engineer', 'IT', '2021-03-18'),
(6, 'Anjali', 'Nair', 'HR Manager', 'HR', '2020-05-14'),
(7, 'Rohan', 'Desai', 'Finance Manager', 'Finance', '2022-11-25'),
(8, 'Sneha', 'Kumar', 'Operations Coordinator', 'Operations', '2023-07-02'),
(9, 'Deepak', 'Singh', 'Data Scientist', 'IT', '2022-08-05'),
(10, 'Neha', 'Gupta', 'Business Analyst', 'Finance', '2020-10-10');

-- 3. Select Operation (Read)
-- Retrieve all employee records

SELECT * FROM Employees;

-- Retrieve a specific employee by EmployeeID
SELECT * FROM Employees
WHERE EmployeeID = 3;

-- 4. Update Operation
-- Update an employee's position and department

UPDATE Employees
SET Position = 'Senior Data Scientist', Department = 'Data Science'
WHERE EmployeeID = 9;

-- 5. Delete Operation
-- Delete an employee record by EmployeeID

DELETE FROM Employees
WHERE EmployeeID = 4;

-- Verify the changes after update and delete
SELECT * FROM Employees;
