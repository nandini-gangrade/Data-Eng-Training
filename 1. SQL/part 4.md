# Contents

| Topic | Details |
|-------|---------|
| [Creating Tables and Inserting Values](#creating-tables-and-inserting-values) | How to create SQL tables and insert data into them. |
| [Using an Equi Join](#using-an-equi-join) | Joins two tables based on matching values in specified columns. |
| [Using a Self Join](#using-a-self-join) | Joins a table to itself, useful for hierarchical data. |
| [Joins with GROUP BY, HAVING, GROUPING SETS](#joins-with-group-by-having-grouping-sets) | Grouping rows and applying aggregate functions, filtering with HAVING. |
| [Querying Data by Using Subqueries](#querying-data-by-using-subqueries) | Using nested queries to retrieve data based on complex conditions. |
| [Using the EXISTS, ANY, ALL Keywords](#using-the-exists-any-all-keywords) | Conditional queries that check for existence, any match, or all match. |
| [Using Nested Subqueries](#using-nested-subqueries) | Subqueries within subqueries for multi-level data filtering. |
| [Using Correlated Subqueries](#using-correlated-subqueries) | Subqueries that depend on the outer query's row values. |
| [Using UNION, INTERSECT, EXCEPT, MERGE](#using-union-intersect-except-merge) | Combining, intersecting, or excluding results from multiple queries. |

---

## Creating Tables and Inserting Values

Pehle, hum tables create karenge aur data insert karenge taaki hum aage ke queries easily samajh sakein.

**Create Tables:**

```sql
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    ManagerID INT
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);
```

**Insert Values:**

```sql
INSERT INTO Employees (EmployeeID, FirstName, LastName, ManagerID) VALUES
(1, 'Amit', 'Sharma', NULL),
(2, 'Sita', 'Rani', 1),
(3, 'Ravi', 'Kumar', 1),
(4, 'Geeta', 'Verma', 2);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(101, 'HR'),
(102, 'Finance'),
(103, 'IT');
```

**Employees Table:**

| EmployeeID | FirstName | LastName | ManagerID |
|------------|-----------|----------|-----------|
| 1          | Amit      | Sharma   | NULL      |
| 2          | Sita      | Rani     | 1         |
| 3          | Ravi      | Kumar    | 1         |
| 4          | Geeta     | Verma    | 2         |

**Departments Table:**

| DepartmentID | DepartmentName |
|--------------|----------------|
| 101          | HR             |
| 102          | Finance        |
| 103          | IT             |

---

## Using an Equi Join

### Definition:
**Equi Join** ek type ka join hota hai jo tables ko unke common columns ke values ke basis pe join karta hai. Yani, rows ko tab match karta hai jab dono tables mein same values hoti hain.

### Example Query:

```sql
SELECT 
    Employees.FirstName,
    Employees.LastName,
    Departments.DepartmentName
FROM Employees
JOIN Departments
ON Employees.EmployeeID = Departments.DepartmentID;
```

**Explanation:**
- `JOIN` keyword se tables ko join kiya.
- `ON Employees.EmployeeID = Departments.DepartmentID` condition batata hai ki join kis column ke basis pe hoga.
- Ye example galat hai kyunki `EmployeeID` aur `DepartmentID` columns match nahi karte. Actual query mein correct column use karna chahiye.

### Correct Example:

Assume there is a `DepartmentID` in the Employees table to correctly use Equi Join.

```sql
ALTER TABLE Employees ADD DepartmentID INT;

UPDATE Employees SET DepartmentID = 101 WHERE EmployeeID = 1;
UPDATE Employees SET DepartmentID = 102 WHERE EmployeeID = 2;
UPDATE Employees SET DepartmentID = 101 WHERE EmployeeID = 3;
UPDATE Employees SET DepartmentID = 103 WHERE EmployeeID = 4;

SELECT 
    Employees.FirstName,
    Employees.LastName,
    Departments.DepartmentName
FROM Employees
JOIN Departments
ON Employees.DepartmentID = Departments.DepartmentID;
```

**Output Table:**

| FirstName | LastName | DepartmentName |
|-----------|----------|----------------|
| Amit      | Sharma   | HR             |
| Ravi      | Kumar    | HR             |
| Sita      | Rani     | Finance        |
| Geeta     | Verma    | IT             |

**Explanation:**
- `Equi Join` ka correct example. Isme Employees aur Departments table ke matching `DepartmentID` ke basis pe join hua hai.

---

## Using a Self Join

### Definition:
**Self Join** ek join hota hai jisme ek hi table ko khud se join kiya jata hai. Ye tab use hota hai jab humein kisi table ke rows ko khud ke saath compare karna hota hai, jaise kisi employee ka manager kaun hai ye check karna.

### Example Query:

```sql
SELECT 
    E1.FirstName AS Employee,
    E2.FirstName AS Manager
FROM Employees E1
JOIN Employees E2
ON E1.ManagerID = E2.EmployeeID;
```

**Output Table:**

| Employee | Manager |
|----------|---------|
| Sita     | Amit    |
| Ravi     | Amit    |
| Geeta    | Sita    |

**Explanation:**
- `Self Join` se Employees table ko khud se join kiya.
- `E1.ManagerID = E2.EmployeeID` se ye condition match hoti hai ki kiska manager kaun hai.
- Result mein humein employee aur unka manager ka naam milta hai.

---

## Joins with GROUP BY, HAVING, GROUPING SETS

### Definition:
- **GROUP BY:** Ye clause rows ko group karne ke liye use hota hai jab humein aggregate functions apply karni hoti hain jaise `COUNT`, `SUM`, `AVG`, etc.
- **HAVING:** Ye clause filter karne ke liye use hota hai aggregate functions ke baad.
- **GROUPING SETS:** Ye clause different combinations mein grouping karne ke liye use hota hai.

### Example Query with GROUP BY:

```sql
SELECT 
    DepartmentID,
    COUNT(EmployeeID) AS NumberOfEmployees
FROM Employees
GROUP BY DepartmentID;
```

**Output Table:**

| DepartmentID | NumberOfEmployees |
|--------------|-------------------|
| 101          | 2                 |
| 102          | 1                 |
| 103          | 1                 |

**Example with HAVING:**

```sql
SELECT 
    DepartmentID,
    COUNT(EmployeeID) AS NumberOfEmployees
FROM Employees
GROUP BY DepartmentID
HAVING COUNT(EmployeeID) > 1;
```

**Output Table:**

| DepartmentID | NumberOfEmployees |
|--------------|-------------------|
| 101          | 2                 |

**Example with GROUPING SETS:**

```sql
SELECT 
    DepartmentID,
    COUNT(EmployeeID) AS NumberOfEmployees
FROM Employees
GROUP BY GROUPING SETS ((DepartmentID), ());
```

**Output Table:**

| DepartmentID | NumberOfEmployees |
|--------------|-------------------|
| 101          | 2                 |
| 102          | 1                 |
| 103          | 1                 |
| NULL         | 4                 |

**Explanation:**
- `GROUPING SETS` se aap different groupings define kar sakte ho. Jaise upar ke example mein department-wise count aur total count dono mila.

---

## Querying Data by Using Subqueries

### Definition:
**Subqueries** SQL queries hoti hain jo kisi dusri query ke andar likhi jati hain. Ye nested queries hoti hain aur complex queries ko simplify karne mein madad karti hain.

### Example Query:

```sql
SELECT FirstName, LastName
FROM Employees
WHERE DepartmentID = (SELECT DepartmentID FROM Departments WHERE DepartmentName = 'HR');
```

**Output Table:**

| FirstName | LastName |
|-----------|----------|
| Amit      | Sharma   |
| Ravi      | Kumar    |

**Explanation:**
- Subquery `(SELECT DepartmentID FROM Departments WHERE DepartmentName = 'HR')` pehle execute hoti hai aur `DepartmentID` return karti hai.
- Outer query fir is value ko use karke Employees ko filter karti hai.

---

## Using the EXISTS, ANY, ALL Keywords

### Definition:
- **EXISTS:** Check karta hai ki subquery ka result exist karta hai ya nahi.
- **ANY:** Check karta hai ki subquery ka result kisi bhi ek value ke saath match karta hai ya nahi.
- **ALL:** Check karta hai ki subquery ka result har value ke saath match karta hai ya nahi.

### Example with EXISTS:

```sql
SELECT FirstName, LastName
FROM Employees E
WHERE EXISTS (SELECT 1 FROM Departments D WHERE D.DepartmentID = E.DepartmentID AND D.DepartmentName = 'HR');
```

**Output Table:**

| FirstName | LastName |
|-----------|----------|
| Amit      | Sharma   |
| Ravi      | Kumar    |

### Example with ANY:

```sql
SELECT FirstName, LastName
FROM Employees
WHERE DepartmentID = ANY (SELECT DepartmentID FROM Departments WHERE DepartmentID > 101);
```

**Output Table:**

| FirstName | LastName |
|-----------|----------|
| Sita      | Rani     |
| Geeta     | Verma    |

### Example with ALL:

```sql
SELECT FirstName, LastName
FROM Employees
WHERE DepartmentID = ALL (SELECT DepartmentID FROM Departments WHERE DepartmentID >= 101);
```

**Output Table:**

| FirstName | LastName |
|-----------|----------|
| Amit      | Sharma   |
| Ravi      | Kumar    |
| Sita      | Rani     |
| Geeta     | Verma    |

**Explanation:**
- `EXISTS` sirf check karta hai ki subquery ka result exist karta hai ya nahi.
- `ANY` check karta hai ki kisi bhi value ke saath match hota hai ya nahi.
- `ALL` check karta hai ki sabhi values ke saath match hota hai ya nahi.

---

## Using Nested Subqueries

### Definition:
**Nested Subqueries** tab use hoti hain jab ek query ke andar aur subqueries lagayi jati hain. Ye tab helpful hoti hain jab multiple levels of filtering karna ho.

### Example Query:

```sql
SELECT FirstName, LastName
FROM Employees
WHERE DepartmentID = (SELECT DepartmentID FROM Departments WHERE DepartmentName = (SELECT DepartmentName FROM Departments WHERE Department

ID = 101));
```

**Output Table:**

| FirstName | LastName |
|-----------|----------|
| Amit      | Sharma   |
| Ravi      | Kumar    |

**Explanation:**
- Is example mein, innermost subquery pehle execute hoti hai aur `DepartmentName` return karti hai. Uske baad outer queries execute hoti hain.

---

## Using Correlated Subqueries

### Definition:
**Correlated Subquery** tab use hoti hai jab subquery outer query se dependent hoti hai. Matlab, subquery ka result outer query ke row pe depend karta hai.

### Example Query:

```sql
SELECT FirstName, LastName
FROM Employees E
WHERE EXISTS (SELECT 1 FROM Departments D WHERE D.DepartmentID = E.DepartmentID AND D.DepartmentName = 'HR');
```

**Output Table:**

| FirstName | LastName |
|-----------|----------|
| Amit      | Sharma   |
| Ravi      | Kumar    |

**Explanation:**
- Is query mein, subquery har row ke liye execute hoti hai kyunki ye correlated hai. Isliye, ye check karta hai ki current row ke `DepartmentID` ke liye HR department exist karta hai ya nahi.

---

## Using UNION, INTERSECT, EXCEPT, MERGE

### Definitions:
- **UNION:** Dono queries ka result combine karta hai aur duplicate rows remove karta hai.
- **INTERSECT:** Dono queries ka common result return karta hai.
- **EXCEPT:** Pehli query ka result return karta hai, jo dusri query mein nahi hota.
- **MERGE:** Do tables ko join karta hai update ya insert karne ke liye.

### Example with UNION:

```sql
SELECT FirstName FROM Employees
UNION
SELECT DepartmentName FROM Departments;
```

**Output Table:**

| FirstName |
|-----------|
| Amit      |
| Sita      |
| Ravi      |
| Geeta     |
| HR        |
| Finance   |
| IT        |

### Example with INTERSECT:

```sql
SELECT FirstName FROM Employees
INTERSECT
SELECT DepartmentName FROM Departments;
```

**Output Table:**

| FirstName |
|-----------|
| NULL      |

### Example with EXCEPT:

```sql
SELECT FirstName FROM Employees
EXCEPT
SELECT DepartmentName FROM Departments;
```

**Output Table:**

| FirstName |
|-----------|
| Amit      |
| Sita      |
| Ravi      |
| Geeta     |

**Explanation:**
- `UNION` dono queries ka combined result return karta hai aur duplicates ko hata deta hai.
- `INTERSECT` common rows ko return karta hai, but yahaan kuch match nahi kar raha.
- `EXCEPT` pehli query ka unique result return karta hai jo dusri query mein nahi hota.
