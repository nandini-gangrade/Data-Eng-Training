# TOC

| Topic                                                                 | Details                                                            |
|------------------------------------------------------------------------|--------------------------------------------------------------------|
| [Using an Inner Join](#using-an-inner-join)                           | Joins tables to get matching records from both tables.             |
| [Using a Left Join](#using-a-left-join)                               | Returns all records from the left table and matching records from the right table. |
| [Using a Right Join](#using-a-right-join)                             | Returns all records from the right table and matching records from the left table. |
| [Using a Full Outer Join](#using-a-full-outer-join)                   | Returns all records when there is a match in either left or right table. |
| [Using a Cross Join](#using-a-cross-join)                             | Produces Cartesian product of both tables, i.e., all possible combinations of rows. |
| [Joins with GROUP BY and Aggregate Functions](#joins-with-group-by-and-aggregate-functions) | Aggregates data based on groupings and applies functions like COUNT, SUM, AVG. |

## Creating Tables and Inserting Values

Pehle, tables create karte hain aur data insert karte hain.

**Create Tables:**

```sql
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);
```

**Insert Values:**

```sql
INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID) VALUES
(1, 'Amit', 'Sharma', 101),
(2, 'Sita', 'Rani', 102),
(3, 'Ravi', 'Kumar', 101),
(4, 'Geeta', 'Verma', 103);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(101, 'HR'),
(102, 'Finance'),
(103, 'IT');
```

**Employees Table:**

| EmployeeID | FirstName | LastName | DepartmentID |
|------------|-----------|----------|--------------|
| 1          | Amit      | Sharma   | 101          |
| 2          | Sita      | Rani     | 102          |
| 3          | Ravi      | Kumar    | 101          |
| 4          | Geeta     | Verma    | 103          |

**Departments Table:**

| DepartmentID | DepartmentName |
|--------------|----------------|
| 101          | HR             |
| 102          | Finance        |
| 103          | IT             |

---

## Using an Inner Join

**Inner Join** tab use hota hai jab humein dono tables se matching records chahiye.

**Example Query:**

```sql
SELECT 
    Employees.FirstName,
    Employees.LastName,
    Departments.DepartmentName
FROM Employees
INNER JOIN Departments
ON Employees.DepartmentID = Departments.DepartmentID;
```

**Explanation:**
- `INNER JOIN` se dono tables ko join kiya jata hai jahan `DepartmentID` matching hoti hai.
- `ON Employees.DepartmentID = Departments.DepartmentID` condition specify karta hai ki join kis column ke basis pe kiya jana chahiye.

**Output Table:**

| FirstName | LastName | DepartmentName |
|-----------|----------|----------------|
| Amit      | Sharma   | HR             |
| Ravi      | Kumar    | HR             |
| Sita      | Rani     | Finance        |
| Geeta     | Verma    | IT             |

---

## Using a Left Join

**Left Join** tab use hota hai jab left table ke saare records chahiye aur right table se matching records.

**Example Query:**

```sql
SELECT 
    Employees.FirstName,
    Employees.LastName,
    Departments.DepartmentName
FROM Employees
LEFT JOIN Departments
ON Employees.DepartmentID = Departments.DepartmentID;
```

**Explanation:**
- `LEFT JOIN` se Employees table ke saare records milenge aur Departments table ke matching records milenge.
- Agar right table mein record nahi milega, to `NULL` value show hogi.

**Output Table:**

| FirstName | LastName | DepartmentName |
|-----------|----------|----------------|
| Amit      | Sharma   | HR             |
| Ravi      | Kumar    | HR             |
| Sita      | Rani     | Finance        |
| Geeta     | Verma    | IT             |

---

## Using a Right Join

**Right Join** tab use hota hai jab right table ke saare records chahiye aur left table se matching records.

**Example Query:**

```sql
SELECT 
    Employees.FirstName,
    Employees.LastName,
    Departments.DepartmentName
FROM Employees
RIGHT JOIN Departments
ON Employees.DepartmentID = Departments.DepartmentID;
```

**Explanation:**
- `RIGHT JOIN` se Departments table ke saare records milenge aur Employees table se matching records milenge.
- Agar left table mein record nahi milega, to `NULL` value show hogi.

**Output Table:**

| FirstName | LastName | DepartmentName |
|-----------|----------|----------------|
| Amit      | Sharma   | HR             |
| Ravi      | Kumar    | HR             |
| Sita      | Rani     | Finance        |
| Geeta     | Verma    | IT             |

---

## Using a Full Outer Join

**Full Outer Join** tab use hota hai jab dono tables ke saare records chahiye, matching records ke saath aur jo match nahi karte unko bhi include karta hai.

**Example Query:**

```sql
SELECT 
    Employees.FirstName,
    Employees.LastName,
    Departments.DepartmentName
FROM Employees
FULL OUTER JOIN Departments
ON Employees.DepartmentID = Departments.DepartmentID;
```

**Explanation:**
- `FULL OUTER JOIN` se dono tables ke saare records milte hain. Agar matching record nahi hota, to `NULL` value show hoti hai.

**Output Table:**

| FirstName | LastName | DepartmentName |
|-----------|----------|----------------|
| Amit      | Sharma   | HR             |
| Ravi      | Kumar    | HR             |
| Sita      | Rani     | Finance        |
| Geeta     | Verma    | IT             |

---

## Using a Cross Join

**Cross Join** tab use hota hai jab aap dono tables ka Cartesian product chahte hain, yani sab combinations of rows.

**Example Query:**

```sql
SELECT 
    Employees.FirstName,
    Departments.DepartmentName
FROM Employees
CROSS JOIN Departments;
```

**Explanation:**
- `CROSS JOIN` se sab rows ka combination milta hai dono tables se. 

**Output Table:**

| FirstName | DepartmentName |
|-----------|----------------|
| Amit      | HR             |
| Amit      | Finance        |
| Amit      | IT             |
| Ravi      | HR             |
| Ravi      | Finance        |
| Ravi      | IT             |
| Sita      | HR             |
| Sita      | Finance        |
| Sita      | IT             |
| Geeta     | HR             |
| Geeta     | Finance        |
| Geeta     | IT             |

---

## Joins with GROUP BY and Aggregate Functions

**Joins with GROUP BY** use karte waqt aggregate functions ko group results pe apply karte hain.

**Example Query:**

```sql
SELECT 
    Departments.DepartmentName,
    COUNT(Employees.EmployeeID) AS NumberOfEmployees
FROM Employees
INNER JOIN Departments
ON Employees.DepartmentID = Departments.DepartmentID
GROUP BY Departments.DepartmentName;
```

**Explanation:**
- `INNER JOIN` se Employees aur Departments ko join kiya.
- `GROUP BY Departments.DepartmentName` se results ko department ke basis pe group kiya.
- `COUNT(Employees.EmployeeID)` se har department mein employees ka count milta hai.

**Output Table:**

| DepartmentName | NumberOfEmployees |
|----------------|--------------------|
| HR             | 2                  |
| Finance        | 1                  |
| IT             | 1                  |
