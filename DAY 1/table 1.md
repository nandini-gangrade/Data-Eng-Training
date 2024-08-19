# Employee CRUD Operations
![image](https://github.com/user-attachments/assets/001ea99f-a88d-4f87-931a-c1f757ca9efe)

- Soln: https://codeshare.io/k0NrMp

## 1. Create Table (Employees)
```
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,        -- Primary Key: Employee ID
    FirstName VARCHAR(50),             -- First Name of Employee
    LastName VARCHAR(50),              -- Last Name of Employee
    Position VARCHAR(50),              -- Job Title
    Department VARCHAR(50),            -- Department Name
    HireDate DATE                      -- Date of Hiring
);
```

## 2. Insert Operation (Create)
-- Inserting employee records into the Employees table
```
INSERT INTO Employees (EmployeeID, FirstName, LastName, Position, Department, HireDate)
VALUES 
(1, 'Shruti', 'Verma', 'Software Developer', 'IT', '2023-09-10'),
(2, 'Priyanshi', 'Mehta', 'Data Analyst', 'Analytics', '2023-08-20'),
(3, 'Nandini', 'Gangrade', 'UI Developer', 'Design', '2024-01-15'),
(4, 'Prakhar', 'Sharma', 'Project Manager', 'Management', '2024-03-05'),
(5, 'Raghav', 'Patel', 'System Engineer', 'Support', '2023-11-25');
```
## 3. Select Operation (Read)
-- Retrieve all employee records
```
SELECT * FROM Employees;
```
-- Retrieve a specific employee by EmployeeID
```
SELECT * FROM Employees
WHERE EmployeeID = 3;
```
## 4. Update Operation
-- Update an employee's position and department
```
UPDATE Employees
SET Position = 'Senior Data Analyst', Department = 'Business Intelligence'
WHERE EmployeeID = 2;
```
## 5. Delete Operation
-- Delete an employee record by EmployeeID
```
DELETE FROM Employees
WHERE EmployeeID = 4;
```
-- Verify the changes after update and delete
```
SELECT * FROM Employees;
```
