## Table of Contents

| **Topic**                                      | **Details**                                                                                  |
|------------------------------------------------|----------------------------------------------------------------------------------------------|
| [Storing Data in a Table](#1-storing-data-in-a-table)       | Learn how to insert new rows into a table. Includes syntax, explanations, and examples.      |
| [Updating Data in a Table](#2-updating-data-in-a-table)     | Understand how to update existing rows in a table. Detailed syntax, explanations, and examples. |
| [Deleting Data from a Table](#3-deleting-data-from-a-table) | Instructions for removing rows from a table. Includes syntax, explanations, and examples.     |
| [Retrieving Specific Attributes](#4-retrieving-specific-attributes) | How to select specific columns from a table. Includes syntax, explanations, and examples.     |
| [Retrieving Selected Rows](#5-retrieving-selected-rows)     | Learn how to select rows based on conditions. Includes syntax, explanations, and examples.    |
| [Filtering Data: WHERE Clauses](#6-filtering-data-where-clauses) | Filtering data using the WHERE clause. Includes syntax, explanations, and examples.          |
| [Filtering Data: IN, DISTINCT, AND, OR, BETWEEN, LIKE](#7-filtering-data-in-distinct-and-or-between-like) | Advanced filtering options like IN, DISTINCT, AND, OR, BETWEEN, LIKE. Includes syntax, explanations, and examples. |
| [Column & Table Aliases](#8-column--table-aliases)          | Using aliases for columns and tables to simplify queries. Includes syntax, explanations, and examples. |

---

## 1. **Storing Data in a Table**

```sql
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);
```

**Explanation:**
- `INSERT INTO` command ka use table mein naye rows insert karne ke liye kiya jata hai.
- `table_name` wo table hai jisme aap data insert karna chahte hain.
- `column1, column2, column3, ...` wo columns hain jisme aap data insert karenge.
- `VALUES` ke baad jo values aap specify karenge wo respective columns mein insert ho jayengi.

**Example:**
1. Table Create karna aur Data Insert karna
   ```sql
   CREATE TABLE Employee (
       EmployeeID INT PRIMARY KEY,
       FirstName VARCHAR(50),
       LastName VARCHAR(50),
       Age INT,
       DepartmentID INT
   );

   INSERT INTO Employee (EmployeeID, FirstName, LastName, Age, DepartmentID)
   VALUES (1, 'John', 'Doe', 30, 101),
          (2, 'Jane', 'Smith', 25, 102),
          (3, 'Emily', 'Johnson', 28, 101);
   ```

2. **Output Table:**

   | EmployeeID | FirstName | LastName | Age | DepartmentID |
   |------------|-----------|----------|-----|--------------|
   | 1          | John      | Doe      | 30  | 101          |
   | 2          | Jane      | Smith    | 25  | 102          |
   | 3          | Emily     | Johnson  | 28  | 101          |


## 2. **Updating Data in a Table**

```sql
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;
```

**Explanation:**
- `UPDATE` command ka use table mein existing data ko update karne ke liye kiya jata hai.
- `SET` clause mein aap specify karte hain ki kaunse columns ki values ko update karna hai.
- `WHERE` clause se specify karte hain ki kis row ko update karna hai.

**Example:**
1. Age Update karna
   ```sql
   UPDATE Employee
   SET Age = 31
   WHERE EmployeeID = 1;
   ```

2. **Output Table after Update:**

   | EmployeeID | FirstName | LastName | Age | DepartmentID |
   |------------|-----------|----------|-----|--------------|
   | 1          | John      | Doe      | 31  | 101          |
   | 2          | Jane      | Smith    | 25  | 102          |
   | 3          | Emily     | Johnson  | 28  | 101          |


## 3. **Deleting Data from a Table**

```sql
DELETE FROM table_name
WHERE condition;
```

**Explanation:**
- `DELETE` command ka use table se rows ko remove karne ke liye kiya jata hai.
- `WHERE` clause se specify karte hain ki kis row ko delete karna hai. Agar `WHERE` clause nahi hai to table ke sabhi rows delete ho jayenge.

**Example:**
1. Specific Employee Delete karna
   ```sql
   DELETE FROM Employee
   WHERE EmployeeID = 2;
   ```

2. **Output Table after Delete:**

   | EmployeeID | FirstName | LastName | Age | DepartmentID |
   |------------|-----------|----------|-----|--------------|
   | 1          | John      | Doe      | 31  | 101          |
   | 3          | Emily     | Johnson  | 28  | 101          |


## 4. **Retrieving Specific Attributes**

```sql
SELECT column1, column2, ...
FROM table_name;
```

**Explanation:**
- `SELECT` command ka use specific columns ko retrieve karne ke liye kiya jata hai.
- `column1, column2, ...` wo columns hain jo aapko retrieve karne hain.
- `FROM` ke baad table ka naam specify karte hain.

**Example:**
1. Specific Columns Retrieve karna
   ```sql
   SELECT FirstName, Age
   FROM Employee;
   ```

2. **Output Table:**

   | FirstName | Age |
   |-----------|-----|
   | John      | 31  |
   | Emily     | 28  |


## 5. **Retrieving Selected Rows**

```sql
SELECT * FROM table_name
WHERE condition;
```

**Explanation:**
- `*` ka use sabhi columns ko retrieve karne ke liye kiya jata hai.
- `WHERE` clause se specify karte hain ki kis condition par rows ko retrieve karna hai.

**Example:**
1. Employees with Age > 25
   ```sql
   SELECT *
   FROM Employee
   WHERE Age > 25;
   ```

2. **Output Table:**

   | EmployeeID | FirstName | LastName | Age | DepartmentID |
   |------------|-----------|----------|-----|--------------|
   | 1          | John      | Doe      | 31  | 101          |
   | 3          | Emily     | Johnson  | 28  | 101          |


## 6. **Filtering Data: WHERE Clauses**

```sql
SELECT * FROM table_name
WHERE column_name condition;
```

**Explanation:**
- `WHERE` clause ka use specific condition ke basis par rows filter karne ke liye kiya jata hai.

**Example:**
1. Employees in Department 101
   ```sql
   SELECT *
   FROM Employee
   WHERE DepartmentID = 101;
   ```

2. **Output Table:**

   | EmployeeID | FirstName | LastName | Age | DepartmentID |
   |------------|-----------|----------|-----|--------------|
   | 1          | John      | Doe      | 31  | 101          |
   | 3          | Emily     | Johnson  | 28  | 101          |


## 7. **Filtering Data: IN, DISTINCT, AND, OR, BETWEEN, LIKE**

- **IN**: Ek list of values se match karne ke liye.
  ```sql
  SELECT * FROM table_name
  WHERE column_name IN (value1, value2, ...);
  ```

- **DISTINCT**: Unique values ko retrieve karne ke liye.
  ```sql
  SELECT DISTINCT column_name
  FROM table_name;
  ```

- **AND**: Multiple conditions ko combine karne ke liye.
  ```sql
  SELECT * FROM table_name
  WHERE condition1 AND condition2;
  ```

- **OR**: Conditions mein se kisi ek ko match karne ke liye.
  ```sql
  SELECT * FROM table_name
  WHERE condition1 OR condition2;
  ```

- **BETWEEN**: Range of values ko filter karne ke liye.
  ```sql
  SELECT * FROM table_name
  WHERE column_name BETWEEN value1 AND value2;
  ```

- **LIKE**: Pattern matching ke liye.
  ```sql
  SELECT * FROM table_name
  WHERE column_name LIKE 'pattern';
  ```

**Examples:**

1. Employees in Departments 101 or 102
   ```sql
   SELECT *
   FROM Employee
   WHERE DepartmentID IN (101, 102);
   ```

2. Distinct Ages of Employees
   ```sql
   SELECT DISTINCT Age
   FROM Employee;
   ```

3. Employees with Age between 25 and 30
   ```sql
   SELECT *
   FROM Employee
   WHERE Age BETWEEN 25 AND 30;
   ```

4. Employees whose FirstName starts with 'J'
   ```sql
   SELECT *
   FROM Employee
   WHERE FirstName LIKE 'J%';
   ```

5. **Output Tables:**

   - **Departments 101 or 102:**

     | EmployeeID | FirstName | LastName | Age | DepartmentID |
     |------------|-----------|----------|-----|--------------|
     | 1          | John      | Doe      | 31  | 101          |
     | 2          | Jane      | Smith    | 25  | 102          |
     | 3          | Emily     | Johnson  | 28  | 101          |

   - **Distinct Ages:**

     | Age |
     |-----|
     | 31  |
     | 25  |
     | 28  |

   - **Age between 25 and 30:**

     | EmployeeID | FirstName | LastName | Age | DepartmentID |
     |------------|-----------|----------|-----|--------------|
     | 2          | Jane      | Smith    | 25  | 102          |
     | 3          | Emily     | Johnson  | 28  | 101          |

   - **FirstName starts with 'J':**

     | EmployeeID | FirstName | LastName | Age | DepartmentID |
     |------------|-----------|----------|-----|--------------|
     | 1          | John      | Doe      | 31  | 101          |
     | 2          | Jane      | Smith    | 25  | 102          |


## 8. **Column & Table Aliases**

```sql
SELECT column_name AS alias_name
FROM table_name AS table_alias;
```

**Explanation:**
- `AS` ka use columns aur tables ke aliases specify karne ke liye kiya jata hai, jo queries ko readable aur manageable banata hai.

**Example:**

1. Employees with Aliases
   ```sql
   SELECT FirstName AS First, LastName AS Last
   FROM Employee AS E;
   ```

2. **Output Table:**

   | First  | Last    |
   |--------|---------|
   | John   | Doe     |
   | Jane   | Smith   |
   | Emily  | Johnson |
