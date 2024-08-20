| Topic | Details |
|-------|---------|
| [Database Basics & Schema](#database-basics--schema) | Overview of database concepts, schema design, and normalization. |
| [Managing Database and Tables](#managing-database-and-tables) | How to create, modify, and manage databases and tables in SQL. |
| [Functions and Creating Sub-Totals](#functions-and-creating-sub-totals) | Using SQL functions to calculate sub-totals, aggregate data, and perform calculations. |
| [Stored Procedure](#stored-procedure) | Explanation and creation of stored procedures for executing complex SQL logic. |

---

## Database Basics & Schema

### Definition:
**Database Basics** ka matlab hai, databases kya hote hain aur kaise kaam karte hain. **Schema** ek structure ya design hai jo batata hai ki database mein tables, columns, relationships kaise honge.

### Explanation:
- **Database** ek organized collection hai data ka, jo electronically store kiya jata hai.
- **Schema** database ka blueprint hota hai, jisme tables, columns, and their data types define hote hain.

### Example:
```sql
CREATE DATABASE CompanyDB;
```
```sql
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT
);
```

**Output Explanation:**
- Pehle `CompanyDB` naam ka database create kiya gaya.
- Phir `Employees` naam ki table create hui jisme `EmployeeID`, `FirstName`, `LastName`, aur `DepartmentID` columns hain. `EmployeeID` primary key hai jo har row ko uniquely identify karegi.

---

## Managing Database and Tables

### Definition:
**Managing Database and Tables** ka matlab hai databases aur tables ko create, modify, aur delete karna.

### Explanation:
- Aap database aur tables ko SQL commands ka use karke manage kar sakte hain, jaise `CREATE`, `ALTER`, `DROP` commands.

### Example: Table Creation and Modification
```sql
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);
```
```sql
ALTER TABLE Employees
ADD Salary DECIMAL(10, 2);
```

**Output Explanation:**
- `Departments` table create ki gayi jisme `DepartmentID` aur `DepartmentName` columns hain.
- `Employees` table mein ek naya column `Salary` add kiya gaya.

---

## Functions and Creating Sub-Totals

### Definition:
**Functions** SQL mein predefined operations hote hain jo calculations ya manipulations ke liye use hote hain. **Sub-Totals** ka matlab hota hai aggregate calculations on a subset of data.

### Explanation:
- SQL functions jaise `SUM()`, `AVG()`, `COUNT()`, `MIN()`, `MAX()` ka use hota hai data aggregate karne ke liye.
- Sub-totals tab use hote hain jab aap specific groups ya categories ke upar calculations karna chahte hain.

### Example:
```sql
SELECT DepartmentID, SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY DepartmentID;
```

**Output Table:**

| DepartmentID | TotalSalary |
|--------------|-------------|
| 1            | 150000.00   |
| 2            | 200000.00   |

**Output Explanation:**
- Is query mein, har department ka `Salary` ka sum calculate kiya gaya hai.
- `GROUP BY` clause se `DepartmentID` ke basis par grouping ki gayi hai, aur har group ka total salary display hoti hai.

---

## Stored Procedure

### Definition:
**Stored Procedure** ek precompiled SQL code ka set hota hai jo baar baar execute kiya ja sakta hai.

### Explanation:
- Stored procedures complex logic ko encapsulate karne ke liye use hote hain, jisse performance improve hota hai aur reusability badhti hai.

### Example:
```sql
CREATE PROCEDURE GetEmployeeDetails
AS
BEGIN
    SELECT EmployeeID, FirstName, LastName, DepartmentName
    FROM Employees E
    JOIN Departments D ON E.DepartmentID = D.DepartmentID;
END;
```
```sql
EXEC GetEmployeeDetails;
```

**Output Table:**

| EmployeeID | FirstName | LastName | DepartmentName |
|------------|-----------|----------|----------------|
| 101        | Amit      | Sharma   | IT             |
| 102        | Sita      | Verma    | HR             |

**Output Explanation:**
- `GetEmployeeDetails` naam ka stored procedure create kiya gaya jo `Employees` aur `Departments` tables ko join karke result return karta hai.
- `EXEC` command se stored procedure ko execute kiya gaya, jisse employee details return hui.
