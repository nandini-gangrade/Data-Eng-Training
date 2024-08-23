# SQL Commands 

## Creating and Inserting Data into Tables

**Create the `tblEmployee` Table:**

```sql
CREATE TABLE tblEmployee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT
);
```

**Insert Data into `tblEmployee`:**

```sql
INSERT INTO tblEmployee (EmployeeID, FirstName, LastName, DepartmentID)
VALUES
(1, 'John', 'Doe', 1),
(2, 'Jane', 'Smith', 2),
(3, 'Emily', 'Jones', 3),
(4, 'Michael', 'Brown', 1),
(5, 'Chris', 'Davis', 2);
```

**Create the `tblDepartment` Table:**

```sql
CREATE TABLE tblDepartment (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);
```

**Insert Data into `tblDepartment`:**

```sql
INSERT INTO tblDepartment (DepartmentID, DepartmentName)
VALUES
(1, 'Finance'),
(2, 'HR'),
(3, 'Engineering');
```

**Generated Tables:**

1. **`tblEmployee` Table:**

| EmployeeID | FirstName | LastName | DepartmentID |
|------------|-----------|----------|--------------|
| 1          | John      | Doe      | 1            |
| 2          | Jane      | Smith    | 2            |
| 3          | Emily     | Jones    | 3            |
| 4          | Michael   | Brown    | 1            |
| 5          | Chris     | Davis    | 2            |

2. **`tblDepartment` Table:**

| DepartmentID | DepartmentName |
|--------------|----------------|
| 1            | Finance        |
| 2            | HR             |
| 3            | Engineering    |

<br>

## Topic 1: Equi Join

**Explanation:**

An **Equi Join** is a type of join that combines rows from two or more tables based on a related column between them. It uses the equality operator (`=`) in the `ON` clause to match rows.

**Syntax:**

```sql
SELECT column1, column2, ...
FROM table1
JOIN table2
ON table1.common_column = table2.common_column;
```

**Usage:**

- **When to use:** When you need to combine data from two or more tables based on a common column.
- **How to use:** Specify the tables to join and use the `ON` clause to define the matching condition.

### Question 1: Write a query to join the `tblEmployee` and `tblDepartment` tables using an Equi Join.

**Procedure to Solve:**

1. **Identify Common Columns:** Both tables share `DepartmentID`.
2. **Write the Join Query:** Use `JOIN` with the `ON` clause to specify the matching columns.

**Step-by-Step Query Building:**

```sql
SELECT e.EmployeeID, e.FirstName, e.LastName, d.DepartmentName
FROM tblEmployee e
JOIN tblDepartment d
ON e.DepartmentID = d.DepartmentID;
```

**Generated Table:**

| EmployeeID | FirstName | LastName | DepartmentName |
|------------|-----------|----------|----------------|
| 1          | John      | Doe      | Finance        |
| 2          | Jane      | Smith    | HR             |
| 3          | Emily     | Jones    | Engineering    |
| 4          | Michael   | Brown    | Finance        |
| 5          | Chris     | Davis    | HR             |

<br>

## Topic 2: Inner Join

**Explanation:**

An **Inner Join** returns only the rows from both tables where there is a match on the specified column(s).

**Syntax:**

```sql
SELECT column1, column2, ...
FROM table1
INNER JOIN table2
ON table1.common_column = table2.common_column;
```

**Usage:**

- **When to use:** Use an Inner Join when you want to retrieve only the rows that have matching data in both tables.
- **How to use:** The syntax is similar to the Equi Join.

### Question 2: Write a query to find all employees and their corresponding departments using an Inner Join.

**Procedure to Solve:**

1. **Determine the Matching Columns:** `DepartmentID` is the common column.
2. **Write the Join Query:** Use `INNER JOIN` with the `ON` clause.

**Step-by-Step Query Building:**

```sql
SELECT e.EmployeeID, e.FirstName, e.LastName, d.DepartmentName
FROM tblEmployee e
INNER JOIN tblDepartment d
ON e.DepartmentID = d.DepartmentID;
```

**Generated Table:**

| EmployeeID | FirstName | LastName | DepartmentName |
|------------|-----------|----------|----------------|
| 1          | John      | Doe      | Finance        |
| 2          | Jane      | Smith    | HR             |
| 3          | Emily     | Jones    | Engineering    |
| 4          | Michael   | Brown    | Finance        |
| 5          | Chris     | Davis    | HR             |

<br>

## Topic 3: Left Join

**Explanation:**

A **Left Join** returns all rows from the left table and the matching rows from the right table. If there is no match, the result is `NULL` on the right side.

**Syntax:**

```sql
SELECT column1, column2, ...
FROM table1
LEFT JOIN table2
ON table1.common_column = table2.common_column;
```

**Usage:**

- **When to use:** Use a Left Join when you want to keep all rows from the left table, regardless of whether they have a match in the right table.
- **How to use:** Use `LEFT JOIN` instead of `JOIN`.

### Question 3: Write a query to find all employees and their departments, including those who might not belong to any department.

**Procedure to Solve:**

1. **Determine Matching and Non-Matching Rows:** Start with all rows from `tblEmployee`.
2. **Write the Join Query:** Use `LEFT JOIN` with the `ON` clause.

**Step-by-Step Query Building:**

```sql
SELECT e.EmployeeID, e.FirstName, e.LastName, d.DepartmentName
FROM tblEmployee e
LEFT JOIN tblDepartment d
ON e.DepartmentID = d.DepartmentID;
```

**Generated Table:**

| EmployeeID | FirstName | LastName | DepartmentName |
|------------|-----------|----------|----------------|
| 1          | John      | Doe      | Finance        |
| 2          | Jane      | Smith    | HR             |
| 3          | Emily     | Jones    | Engineering    |
| 4          | Michael   | Brown    | Finance        |
| 5          | Chris     | Davis    | HR             |

<br>

## Topic 4: Right Join

**Explanation:**

A **Right Join** returns all rows from the right table and the matching rows from the left table. If there is no match, the result is `NULL` on the left side.

**Syntax:**

```sql
SELECT column1, column2, ...
FROM table1
RIGHT JOIN table2
ON table1.common_column = table2.common_column;
```

**Usage:**

- **When to use:** Use a Right Join when you want to keep all rows from the right table, regardless of whether they have a match in the left table.
- **How to use:** Use `RIGHT JOIN` instead of `JOIN`.

### Question 4: Write a query to find all departments and their employees, including departments without any employees.

**Procedure to Solve:**

1. **Determine Matching and Non-Matching Rows:** Start with all rows from `tblDepartment`.
2. **Write the Join Query:** Use `RIGHT JOIN` with the `ON` clause.

**Step-by-Step Query Building:**

```sql
SELECT e.EmployeeID, e.FirstName, e.LastName, d.DepartmentName
FROM tblEmployee e
RIGHT JOIN tblDepartment d
ON e.DepartmentID = d.DepartmentID;
```

**Generated Table:**

| EmployeeID | FirstName | LastName | DepartmentName |
|------------|-----------|----------|----------------|
| 1          | John      | Doe      | Finance        |
| 4          | Michael   | Brown    | Finance        |
| 2          | Jane      | Smith    | HR             |
| 5          | Chris     | Davis    | HR             |
| 3          | Emily     | Jones    | Engineering    |

<br>

## Topic 5: Full Outer Join

**Explanation:**

A **Full Outer Join** returns all rows when there is a match in either left or right table records. It combines the results of both left and right outer joins.

**Syntax:**

```sql
SELECT column1, column2, ...
FROM table1
FULL OUTER JOIN table2
ON table1.common_column = table2.common_column;
```

**Usage:**

- **When to use:** Use a Full Outer Join to retrieve all records when there is a match in either table or no match at all.
- **How to use:** Use `FULL OUTER JOIN` instead of `JOIN`.

### Question 5: Write a query to find all employees and departments, including those who do not match.

**Procedure to Solve:**

1. **Identify All Rows:** We want all employees and all departments.
2. **Write the Join Query:** Use `FULL OUT

ER JOIN` with the `ON` clause.

**Step-by-Step Query Building:**

```sql
SELECT e.EmployeeID, e.FirstName, e.LastName, d.DepartmentName
FROM tblEmployee e
FULL OUTER JOIN tblDepartment d
ON e.DepartmentID = d.DepartmentID;
```

**Generated Table:**

| EmployeeID | FirstName | LastName | DepartmentName |
|------------|-----------|----------|----------------|
| 1          | John      | Doe      | Finance        |
| 4          | Michael   | Brown    | Finance        |
| 2          | Jane      | Smith    | HR             |
| 5          | Chris     | Davis    | HR             |
| 3          | Emily     | Jones    | Engineering    |

<br>

## Topic 6: Cross Join

**Explanation:**

A **Cross Join** returns the Cartesian product of the two tables, meaning it returns all possible combinations of rows.

**Syntax:**

```sql
SELECT column1, column2, ...
FROM table1
CROSS JOIN table2;
```

**Usage:**

- **When to use:** Use a Cross Join to combine each row of the first table with every row of the second table.
- **How to use:** Simply specify the `CROSS JOIN` without any `ON` clause.

### Question 6: Write a query to find all possible combinations of employees and departments.

**Procedure to Solve:**

1. **Determine Cross Product:** Each row in `tblEmployee` will be paired with each row in `tblDepartment`.
2. **Write the Join Query:** Use `CROSS JOIN`.

**Step-by-Step Query Building:**

```sql
SELECT e.EmployeeID, e.FirstName, e.LastName, d.DepartmentName
FROM tblEmployee e
CROSS JOIN tblDepartment d;
```

**Generated Table:**

| EmployeeID | FirstName | LastName | DepartmentName |
|------------|-----------|----------|----------------|
| 1          | John      | Doe      | Finance        |
| 1          | John      | Doe      | HR             |
| 1          | John      | Doe      | Engineering    |
| 2          | Jane      | Smith    | Finance        |
| 2          | Jane      | Smith    | HR             |
| 2          | Jane      | Smith    | Engineering    |
| 3          | Emily     | Jones    | Finance        |
| 3          | Emily     | Jones    | HR             |
| 3          | Emily     | Jones    | Engineering    |
| 4          | Michael   | Brown    | Finance        |
| 4          | Michael   | Brown    | HR             |
| 4          | Michael   | Brown    | Engineering    |
| 5          | Chris     | Davis    | Finance        |
| 5          | Chris     | Davis    | HR             |
| 5          | Chris     | Davis    | Engineering    |

<br>

## Topic 7: Self Join

**Explanation:**

A **Self Join** is a join of a table with itself. It's used when you need to find relationships between rows in the same table.

**Syntax:**

```sql
SELECT a.column1, b.column2, ...
FROM table1 a, table1 b
WHERE condition;
```

**Usage:**

- **When to use:** Use a Self Join to compare rows within the same table.
- **How to use:** Join the table to itself and use aliases to differentiate.

### Question 7: Write a query to find pairs of employees in the same department.

**Procedure to Solve:**

1. **Use Aliases to Differentiate Tables:** `e1` and `e2` will represent the same table `tblEmployee`.
2. **Specify the Join Condition:** Join `e1` and `e2` where `e1.DepartmentID` equals `e2.DepartmentID`.

**Step-by-Step Query Building:**

```sql
SELECT e1.EmployeeID AS Employee1, e1.FirstName AS FirstName1,
       e2.EmployeeID AS Employee2, e2.FirstName AS FirstName2
FROM tblEmployee e1, tblEmployee e2
WHERE e1.DepartmentID = e2.DepartmentID
AND e1.EmployeeID != e2.EmployeeID;
```

**Generated Table:**

| Employee1 | FirstName1 | Employee2 | FirstName2 |
|-----------|------------|-----------|------------|
| 1         | John       | 4         | Michael    |
| 4         | Michael    | 1         | John       |
| 2         | Jane       | 5         | Chris      |
| 5         | Chris      | 2         | Jane       |

<br>

## Topic 8: Natural Join

**Explanation:**

A **Natural Join** automatically joins tables based on columns with the same name and data type in both tables.

**Syntax:**

```sql
SELECT column1, column2, ...
FROM table1
NATURAL JOIN table2;
```

**Usage:**

- **When to use:** Use a Natural Join when you want to join two tables on all columns with the same name.
- **How to use:** Use `NATURAL JOIN` instead of specifying an `ON` clause.

### Question 8: Write a query to find all employees and their departments using a Natural Join.

**Procedure to Solve:**

1. **Ensure Common Column Exists:** `DepartmentID` must be in both tables.
2. **Write the Join Query:** Use `NATURAL JOIN` directly.

**Step-by-Step Query Building:**

```sql
SELECT EmployeeID, FirstName, LastName, DepartmentName
FROM tblEmployee
NATURAL JOIN tblDepartment;
```

**Generated Table:**

| EmployeeID | FirstName | LastName | DepartmentName |
|------------|-----------|----------|----------------|
| 1          | John      | Doe      | Finance        |
| 2          | Jane      | Smith    | HR             |
| 3          | Emily     | Jones    | Engineering    |
| 4          | Michael   | Brown    | Finance        |
| 5          | Chris     | Davis    | HR             |

<br>

## Topic 9: Anti Join

**Explanation:**

An **Anti Join** returns all rows from the left table where there is no match in the right table. SQL does not have a specific keyword for Anti Join, but it can be implemented using a `LEFT JOIN` with a `WHERE` clause checking for `NULL`.

**Syntax:**

```sql
SELECT column1, column2, ...
FROM table1
LEFT JOIN table2
ON table1.common_column = table2.common_column
WHERE table2.common_column IS NULL;
```

**Usage:**

- **When to use:** Use an Anti Join when you need rows from one table that do not have a match in the other table.
- **How to use:** Combine `LEFT JOIN` with a `WHERE` clause checking for `NULL`.

### Question 9: Write a query to find all employees who are not in any department.

**Procedure to Solve:**

1. **Use Left Join and Filter for NULLs:** Join `tblEmployee` with `tblDepartment` and filter out non-matches.
2. **Write the Join Query:** Use `LEFT JOIN` with a `WHERE` clause.

**Step-by-Step Query Building:**

```sql
SELECT e.EmployeeID, e.FirstName, e.LastName
FROM tblEmployee e
LEFT JOIN tblDepartment d
ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentID IS NULL;
```

**Generated Table:**

| EmployeeID | FirstName | LastName |
|------------|-----------|----------|
| None       | None      | None     |

<br>

## Topic 10: Semi Join

**Explanation:**

A **Semi Join** returns rows from the left table where there is at least one match in the right table. SQL also does not have a specific keyword for Semi Join, but it can be implemented using `EXISTS`.

**Syntax:**

```sql
SELECT column1, column2, ...
FROM table1
WHERE EXISTS (
    SELECT 1
    FROM table2
    WHERE table1.common_column = table2.common_column
);
```

**Usage:**

- **When to use:** Use a Semi Join when you need rows from one table that have at least one match in another table.
- **How to use:** Use `WHERE EXISTS`.

### Question 10: Write a query to find all employees who are in a department.

**Procedure to Solve:**

1. **Check for Existence:** Use `EXISTS` to find matching rows.
2. **Write the Join Query:** Use `WHERE EXISTS`.

**Step-by-Step Query Building:**

```sql
SELECT e.EmployeeID, e.FirstName, e.LastName
FROM tblEmployee e
WHERE EXISTS (
    SELECT 1
    FROM tblDepartment d
    WHERE e.DepartmentID = d.DepartmentID
);
```

**Generated Table:**

| EmployeeID | FirstName | LastName |
|------------|-----------|----------|
| 1          | John      | Doe      |
| 2          | Jane      | Smith    |
| 3          | Emily     | Jones    |
| 4          | Michael   | Brown    |
| 5          | Chris     | Davis    |

<br>

## Topic 11: Self Anti Join

**Explanation:**

A **Self Anti Join** finds rows in a table that do not have a certain relation to any other rows within the same table.

**Syntax:**

```sql
SELECT a.column1, a.column2, ...
FROM table1 a
LEFT JOIN table1 b
ON a.common_column = b.common_column
WHERE b.common_column IS NULL;
```

**Usage

:**

- **When to use:** Use a Self Anti Join to find rows that do not match a certain relationship within the same table.
- **How to use:** Perform a `LEFT JOIN` and check for `NULL`.

### Question 11: Write a query to find all employees who do not have any colleagues in the same department.

**Procedure to Solve:**

1. **Compare Table to Itself:** Use aliases `e1` and `e2` to represent the same table.
2. **Filter Out Rows with Matches:** Use `LEFT JOIN` and `WHERE` clause to find rows with no match.

**Step-by-Step Query Building:**

```sql
SELECT e1.EmployeeID, e1.FirstName, e1.LastName
FROM tblEmployee e1
LEFT JOIN tblEmployee e2
ON e1.DepartmentID = e2.DepartmentID AND e1.EmployeeID != e2.EmployeeID
WHERE e2.EmployeeID IS NULL;
```

**Generated Table:**

| EmployeeID | FirstName | LastName |
|------------|-----------|----------|
| None       | None      | None     |

<br>

## Topic 12: Inner Merge

**Explanation:**

An **Inner Merge** involves combining rows from two tables that have matching values in a specified column.

**Syntax:**

```sql
SELECT column1, column2, ...
FROM table1
INNER JOIN table2
ON table1.common_column = table2.common_column;
```

**Usage:**

- **When to use:** Use an Inner Merge when you want to retrieve only matching rows from both tables.
- **How to use:** Specify the join condition with `ON`.

### Question 12: Write a query to find all employees and their departments using an Inner Merge.

**Procedure to Solve:**

1. **Select Common Columns:** Use an `INNER JOIN` to select only rows with matches in both tables.
2. **Write the Join Query:** Use `INNER JOIN`.

**Step-by-Step Query Building:**

```sql
SELECT e.EmployeeID, e.FirstName, e.LastName, d.DepartmentName
FROM tblEmployee e
INNER JOIN tblDepartment d
ON e.DepartmentID = d.DepartmentID;
```

**Generated Table:**

| EmployeeID | FirstName | LastName | DepartmentName |
|------------|-----------|----------|----------------|
| 1          | John      | Doe      | Finance        |
| 2          | Jane      | Smith    | HR             |
| 3          | Emily     | Jones    | Engineering    |
| 4          | Michael   | Brown    | Finance        |
| 5          | Chris     | Davis    | HR             |

<br>

## Topic 13: Outer Merge

**Explanation:**

An **Outer Merge** retrieves all records when there is a match in either table records.

**Syntax:**

```sql
SELECT column1, column2, ...
FROM table1
FULL OUTER JOIN table2
ON table1.common_column = table2.common_column;
```

**Usage:**

- **When to use:** Use an Outer Merge to retrieve all records from both tables with matching and non-matching rows.
- **How to use:** Use `FULL OUTER JOIN`.

### Question 13: Write a query to find all employees and departments using an Outer Merge.

**Procedure to Solve:**

1. **Include All Matches and Non-Matches:** Use `FULL OUTER JOIN` to combine both tables.
2. **Write the Join Query:** Specify `FULL OUTER JOIN`.

**Step-by-Step Query Building:**

```sql
SELECT e.EmployeeID, e.FirstName, e.LastName, d.DepartmentName
FROM tblEmployee e
FULL OUTER JOIN tblDepartment d
ON e.DepartmentID = d.DepartmentID;
```

**Generated Table:**

| EmployeeID | FirstName | LastName | DepartmentName |
|------------|-----------|----------|----------------|
| 1          | John      | Doe      | Finance        |
| 4          | Michael   | Brown    | Finance        |
| 2          | Jane      | Smith    | HR             |
| 5          | Chris     | Davis    | HR             |
| 3          | Emily     | Jones    | Engineering    |

<br>

## Topic 14: Left Merge

**Explanation:**

A **Left Merge** returns all rows from the left table and the matched rows from the right table. The result is NULL from the right side if there is no match.

**Syntax:**

```sql
SELECT column1, column2, ...
FROM table1
LEFT JOIN table2
ON table1.common_column = table2.common_column;
```

**Usage:**

- **When to use:** Use a Left Merge to retrieve all rows from the left table and the matching rows from the right table.
- **How to use:** Use `LEFT JOIN`.

### Question 14: Write a query to find all employees and departments using a Left Merge.

**Procedure to Solve:**

1. **Include All Left Rows:** Use `LEFT JOIN` to combine both tables, retaining all rows from the left table.
2. **Write the Join Query:** Specify `LEFT JOIN`.

**Step-by-Step Query Building:**

```sql
SELECT e.EmployeeID, e.FirstName, e.LastName, d.DepartmentName
FROM tblEmployee e
LEFT JOIN tblDepartment d
ON e.DepartmentID = d.DepartmentID;
```

**Generated Table:**

| EmployeeID | FirstName | LastName | DepartmentName |
|------------|-----------|----------|----------------|
| 1          | John      | Doe      | Finance        |
| 2          | Jane      | Smith    | HR             |
| 3          | Emily     | Jones    | Engineering    |
| 4          | Michael   | Brown    | Finance        |
| 5          | Chris     | Davis    | HR             |
