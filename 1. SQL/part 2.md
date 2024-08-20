# Easy Access
| Topic                                                                 | Details                                                                                                            |
|------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------|
| [Creating a Table and Inserting Values](#creating-a-table-and-inserting-values) | Creating a table, inserting data, and understanding output tables.                                                |
| [Implementing Data Integrity](#implementing-data-integrity)           | Ensuring data accuracy and consistency using constraints like primary key, foreign key, and unique constraints.    |
| [Using Functions to Customize the Result Set](#using-functions-to-customize-the-result-set) | Using functions to manipulate and customize query results, such as CONCAT, UPPER, LOWER, and ROUND.             |
| [Using String Functions](#using-string-functions)                     | Manipulating strings with functions like LEN, SUBSTRING, and TRIM.                                                |
| [Using Date Functions](#using-date-functions)                         | Working with dates using functions like GETDATE, DATEADD, and DATEDIFF.                                           |
| [Using Mathematical Functions](#using-mathematical-functions)          | Performing mathematical operations with functions such as ABS, CEILING, and FLOOR.                                |
| [Using System Functions](#using-system-functions)                     | Retrieving system-level information using functions like @@VERSION, DB_NAME, and USER_NAME.                      |
| [Summarizing and Grouping Data](#summarizing-and-grouping-data)        | Aggregating data with functions and grouping data using GROUP BY.                                                  |
| [Hands on Exercise: Filtering Data using SQL Queries](#hands-on-exercise-filtering-data-using-sql-queries) | Filtering data with SQL queries using various conditions.                                                          |
| [Hands on Exercise: Total Aggregations using SQL Queries](#hands-on-exercise-total-aggregations-using-sql-queries) | Using aggregate functions to summarize total data.                                                                  |
| [Hands on Exercise: Group By Aggregations using SQL Queries](#hands-on-exercise-group-by-aggregations-using-sql-queries) | Aggregating data with GROUP BY clause.                                                                            |
| [Hands on Exercise: Order of Execution of SQL Queries](#hands-on-exercise-order-of-execution-of-sql-queries) | Understanding the order of SQL query execution.                                                                    |
| [Hands on Exercise: Rules and Restrictions to Group and Filter Data in SQL Queries](#hands-on-exercise-rules-and-restrictions-to-group-and-filter-data-in-sql-queries) | Applying rules and restrictions for grouping and filtering data.                                                   |
| [Hands on Exercise: Filter Data based on Aggregated Results using Group By and Having](#hands-on-exercise-filter-data-based-on-aggregated-results-using-group-by-and-having) | Filtering data based on aggregated results using GROUP BY and HAVING clauses.                                     |

Here’s a detailed explanation in Hinglish for each topic, including SQL commands and example queries with output tables. We'll start with creating a table and inserting data into it.

---

## Creating a Table and Inserting Values

**Step 1: Creating a Table**

```sql
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10, 2),
    DepartmentID INT
);
```

**Explanation:**
- `CREATE TABLE Employees` command se ek naya table `Employees` create ho raha hai.
- `EmployeeID`, `FirstName`, `LastName`, `HireDate`, `Salary`, aur `DepartmentID` columns define kiye gaye hain.
- `EmployeeID` ko primary key bana rahe hain, jo unique aur non-null hoga.

**Step 2: Inserting Data**

```sql
INSERT INTO Employees (EmployeeID, FirstName, LastName, HireDate, Salary, DepartmentID)
VALUES
(1, 'Rajesh', 'Sharma', '2020-01-15', 50000.00, 101),
(2, 'Sita', 'Rani', '2019-03-22', 55000.00, 102),
(3, 'Amit', 'Kumar', '2021-06-30', 60000.00, 101),
(4, 'Nina', 'Singh', '2018-11-10', 52000.00, 103);
```

**Explanation:**
- `INSERT INTO Employees` command se rows insert kar rahe hain.
- `VALUES` clause mein har employee ka data specify kiya gaya hai.

**Output Table:**

| EmployeeID | FirstName | LastName | HireDate   | Salary  | DepartmentID |
|------------|-----------|----------|------------|---------|--------------|
| 1          | Rajesh    | Sharma   | 2020-01-15 | 50000.00| 101          |
| 2          | Sita      | Rani     | 2019-03-22 | 55000.00| 102          |
| 3          | Amit      | Kumar    | 2021-06-30 | 60000.00| 101          |
| 4          | Nina      | Singh    | 2018-11-10 | 52000.00| 103          |

---

## Implementing Data Integrity

**Data Integrity** ensure karta hai ki data accurate aur consistent ho. Yeh constraints use karke achieve hota hai:

1. **Primary Key Constraint**: Unique aur non-null values ensure karta hai.
2. **Foreign Key Constraint**: Referential integrity ko maintain karta hai.
3. **Unique Constraint**: Ensures that all values in a column are unique.
4. **Check Constraint**: Valid values define karta hai for a column.

**Example: Adding Constraints**

```sql
ALTER TABLE Employees
ADD CONSTRAINT FK_Department
FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID);

ALTER TABLE Employees
ADD CONSTRAINT CHK_Salary CHECK (Salary > 0);
```

**Explanation:**
- `FK_Department` constraint `DepartmentID` ko `Departments` table ke `DepartmentID` se link karta hai.
- `CHK_Salary` constraint ensure karta hai ki salary positive ho.

---

## Using Functions to Customize the Result Set

SQL mein different functions use karke hum result set ko customize kar sakte hain:

1. **`CONCAT`**: Strings ko combine karta hai.
2. **`UPPER`**: Text ko upper case mein convert karta hai.
3. **`LOWER`**: Text ko lower case mein convert karta hai.
4. **`ROUND`**: Numbers ko round karta hai.

**Example:**

```sql
SELECT 
    CONCAT(FirstName, ' ', LastName) AS FullName,
    UPPER(FirstName) AS FirstName_Upper,
    ROUND(Salary, 0) AS RoundedSalary
FROM Employees;
```

**Explanation:**
- `CONCAT(FirstName, ' ', LastName)` se full name create hota hai.
- `UPPER(FirstName)` se first name upper case mein convert hota hai.
- `ROUND(Salary, 0)` se salary ko round kiya jata hai.

**Output Table:**

| FullName       | FirstName_Upper | RoundedSalary |
|----------------|------------------|---------------|
| Rajesh Sharma  | RAJESH           | 50000         |
| Sita Rani      | SITA             | 55000         |
| Amit Kumar     | AMIT             | 60000         |
| Nina Singh     | NINA             | 52000         |

---

## Using String Functions

**String Functions** se hum strings ko manipulate kar sakte hain:

1. **`LEN`**: String ki length return karta hai.
2. **`SUBSTRING`**: String ka part extract karta hai.
3. **`TRIM`**: Extra spaces remove karta hai.

**Example:**

```sql
SELECT 
    LEN(FirstName) AS NameLength,
    SUBSTRING(LastName, 1, 3) AS ShortLastName,
    TRIM(FirstName) AS TrimmedFirstName
FROM Employees;
```

**Explanation:**
- `LEN(FirstName)` se first name ki length milti hai.
- `SUBSTRING(LastName, 1, 3)` se last name ke pehle 3 characters milte hain.
- `TRIM(FirstName)` se first name ke extra spaces remove hote hain.

**Output Table:**

| NameLength | ShortLastName | TrimmedFirstName |
|------------|---------------|------------------|
| 5          | Sha           | Rajesh           |
| 4          | Ran           | Sita             |
| 4          | Kum           | Amit             |
| 4          | Sin           | Nina             |

---

## Using Date Functions

**Date Functions** date aur time data ke saath operations perform karte hain:

1. **`GETDATE`**: Current date aur time return karta hai.
2. **`DATEADD`**: Date mein interval add karta hai.
3. **`DATEDIFF`**: Do dates ke beech difference calculate karta hai.

**Example:**

```sql
SELECT 
    GETDATE() AS CurrentDateTime,
    DATEADD(year, 1, HireDate) AS NextYearHireDate,
    DATEDIFF(day, HireDate, GETDATE()) AS DaysEmployed
FROM Employees;
```

**Explanation:**
- `GETDATE()` se current date aur time milta hai.
- `DATEADD(year, 1, HireDate)` se next year ki hire date milti hai.
- `DATEDIFF(day, HireDate, GETDATE())` se hire date se lekar aaj tak kitne din huye woh count hota hai.

**Output Table:**

| CurrentDateTime      | NextYearHireDate | DaysEmployed |
|----------------------|------------------|--------------|
| 2024-08-20 10:30:00  | 2021-06-30      | 1150         |
| 2024-08-20 10:30:00  | 2020-03-22      | 1595         |
| 2024-08-20 10:30:00  | 2022-06-30      | 795          |
| 2024-08-20 10:30:00  | 2019-11-10      | 1744         |

---

## Using Mathematical Functions

**Mathematical Functions** perform operations on numeric data:

1. **`ABS`**: Absolute value return karta hai.
2. **`CEILING`**: Number ko next highest integer pe round karta hai.
3. **`FLOOR`**: Number ko next lowest integer pe round karta hai.

**Example:**

```sql
SELECT 
    ABS(Salary - 50000) AS DifferenceFrom50000,
    CEILING(Salary / 10000) AS RoundedSalaryTenThousands,
    FLOOR(Salary / 10000) AS FloorSalaryTenThousands
FROM Employees;
```

**Explanation:**
- `ABS(Salary - 50000)` se salary ka difference 50000 se absolute value milti hai.
- `CEILING(Salary / 10000)` se salary ko next highest ten thousands pe round kiya jata hai.
- `FLOOR(Salary / 10000)` se salary ko next lowest ten thousands pe round kiya jata hai.

**Output Table:**

| DifferenceFrom50000 | RoundedSalaryTenThousands | FloorSalaryTenThousands |
|---------------------|----------------------------|--------------------------|
| 0                   | 5                          | 5                        |
| 5000                | 6                          | 5                        |
| 10000               | 6                          | 6                        |
| 2000                | 6                          | 5                        |

---

## Using System Functions

**System Functions** provide system-level information:

1. **`@@VERSION`**: SQL Server version return karta hai.
2. **`DB_NAME`**: Current database ka naam return karta hai.
3. **`USER_NAME`**: Current user ka naam return karta hai.

**Example:**

```sql
SELECT 
    @@VERSION AS SQLServerVersion,
    DB_NAME() AS CurrentDatabase,
    USER_NAME() AS CurrentUser;
```

**Explanation:**
- `@@VERSION` se SQL Server ki version information milti hai.
- `DB_NAME()` se

 current database ka naam milta hai.
- `USER_NAME()` se current user ka naam milta hai.

**Output Table:**

| SQLServerVersion                             | CurrentDatabase | CurrentUser |
|----------------------------------------------|-----------------|-------------|
| Microsoft SQL Server 2019 (RTM-CU15) (KB5004330) | YourDatabase     | YourUser    |

---

## Summarizing and Grouping Data

**Summarizing Data** se aggregate information obtain ki jati hai:

1. **`SUM`**: Total sum calculate karta hai.
2. **`AVG`**: Average calculate karta hai.
3. **`MAX`**: Maximum value return karta hai.
4. **`MIN`**: Minimum value return karta hai.

**Grouping Data** se related rows ko group karke aggregate functions apply kiye jate hain.

**Example:**

```sql
SELECT 
    DepartmentID,
    COUNT(EmployeeID) AS NumberOfEmployees,
    AVG(Salary) AS AverageSalary,
    MAX(Salary) AS HighestSalary,
    MIN(Salary) AS LowestSalary
FROM Employees
GROUP BY DepartmentID;
```

**Explanation:**
- `COUNT(EmployeeID)` se har department mein employees ka count milta hai.
- `AVG(Salary)` se har department ka average salary milta hai.
- `MAX(Salary)` aur `MIN(Salary)` se highest aur lowest salary milti hai.

**Output Table:**

| DepartmentID | NumberOfEmployees | AverageSalary | HighestSalary | LowestSalary |
|--------------|--------------------|---------------|---------------|--------------|
| 101          | 2                  | 55000.00      | 60000.00      | 50000.00     |
| 102          | 1                  | 55000.00      | 55000.00      | 55000.00     |
| 103          | 1                  | 52000.00      | 52000.00      | 52000.00     |

---

## Hands on Exercise: Filtering Data using SQL Queries

**Exercise**: Use different filters to retrieve specific data.

**Example Query:**

```sql
SELECT * 
FROM Employees
WHERE Salary > 50000 AND HireDate < '2021-01-01';
```

**Explanation:**
- `WHERE Salary > 50000` filter karta hai employees ko jin ki salary 50000 se zyada hai.
- `AND HireDate < '2021-01-01'` filter karta hai employees ko jin ki hire date 2021 se pehle ki hai.

**Output Table:**

| EmployeeID | FirstName | LastName | HireDate   | Salary  | DepartmentID |
|------------|-----------|----------|------------|---------|--------------|
| 2          | Sita      | Rani     | 2019-03-22 | 55000.00| 102          |
| 3          | Amit      | Kumar    | 2021-06-30 | 60000.00| 101          |

---

## Hands on Exercise: Total Aggregations using SQL Queries

**Exercise**: Use aggregate functions to get total results.

**Example Query:**

```sql
SELECT 
    SUM(Salary) AS TotalSalary,
    COUNT(EmployeeID) AS TotalEmployees
FROM Employees;
```

**Explanation:**
- `SUM(Salary)` total salary calculate karta hai.
- `COUNT(EmployeeID)` total employees count karta hai.

**Output Table:**

| TotalSalary | TotalEmployees |
|-------------|----------------|
| 217000.00   | 4              |

---

## Hands on Exercise: Group By Aggregations using SQL Queries

**Exercise**: Use `GROUP BY` to aggregate data by groups.

**Example Query:**

```sql
SELECT 
    DepartmentID,
    COUNT(EmployeeID) AS NumberOfEmployees,
    SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY DepartmentID;
```

**Explanation:**
- `GROUP BY DepartmentID` se employees ko department ke basis pe group kiya jata hai.
- `COUNT(EmployeeID)` aur `SUM(Salary)` se har department ka count aur total salary milti hai.

**Output Table:**

| DepartmentID | NumberOfEmployees | TotalSalary |
|--------------|--------------------|-------------|
| 101          | 2                  | 110000.00   |
| 102          | 1                  | 55000.00    |
| 103          | 1                  | 52000.00    |

---

## Hands on Exercise: Order of Execution of SQL Queries

**Exercise**: Understand the execution order of SQL clauses.

**Execution Order:**
1. **FROM**: Jo tables se data fetch karna hai.
2. **JOIN**: Jo tables ko join karna hai.
3. **WHERE**: Data ko filter karna.
4. **GROUP BY**: Data ko group karna.
5. **HAVING**: Grouped data ko filter karna.
6. **SELECT**: Required columns select karna.
7. **ORDER BY**: Result ko sort karna.

**Example Query:**

```sql
SELECT 
    DepartmentID,
    COUNT(EmployeeID) AS NumberOfEmployees
FROM Employees
WHERE Salary > 50000
GROUP BY DepartmentID
HAVING COUNT(EmployeeID) > 1
ORDER BY DepartmentID;
```

**Explanation:**
- `WHERE` se filter kiya data ko `GROUP BY` se group kiya jata hai.
- `HAVING` se filtered grouped data ko further filter kiya jata hai.
- `ORDER BY` se final result ko sort kiya jata hai.

**Output Table:**

| DepartmentID | NumberOfEmployees |
|--------------|--------------------|
| 101          | 2                  |

---

## Hands on Exercise: Rules and Restrictions to Group and Filter Data in SQL Queries

**Exercise**: Apply rules for grouping and filtering.

**Rules:**
1. **Group By Columns**: Jo columns `SELECT` list mein hain aur aggregate functions se nahi hain, unko `GROUP BY` clause mein include karna hota hai.
2. **Having Clause**: `HAVING` clause tab use hota hai jab aapko `GROUP BY` ke baad filter karna ho.

**Example Query:**

```sql
SELECT 
    DepartmentID,
    AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY DepartmentID
HAVING AVG(Salary) > 50000;
```

**Explanation:**
- `GROUP BY` se data ko department ke basis pe group kiya jata hai.
- `HAVING` clause ensure karta hai ki average salary 50000 se zyada ho.

**Output Table:**

| DepartmentID | AverageSalary |
|--------------|---------------|
| 101          | 55000.00      |

---

## Hands on Exercise: Filter Data based on Aggregated Results using Group By and Having

**Exercise**: Filter data based on aggregated results.

**Example Query:**

```sql
SELECT 
    DepartmentID,
    SUM(Salary) AS TotalSalary
FROM Employees
GROUP BY DepartmentID
HAVING SUM(Salary) > 50000;
```

**Explanation:**
- `GROUP BY` se data ko department ke basis pe group kiya jata hai.
- `HAVING` clause ensure karta hai ki total salary 50000 se zyada ho.

**Output Table:**

| DepartmentID | TotalSalary |
|--------------|-------------|
| 101          | 110000.00   |
| 102          | 55000.00    |
