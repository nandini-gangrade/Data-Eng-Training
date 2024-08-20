| **Topic**                                                                 | **Details**                                                                                                     |
|---------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------|
| [Data Cleansing and Manipulation](#data-cleansing-and-manipulation)       | Removing errors, duplicates, and inconsistencies from data, and transforming data for accuracy.                 |
| [RegEx](#regex)                                                            | Pattern-matching technique for complex string searches and validations.                                         |
| [Aggregate Function](#aggregate-function)                                 | Functions that perform calculations on multiple rows and return a single result (e.g., SUM, AVG).               |
| [Analytical Functions](#analytical-functions)                             | Functions that perform calculations across a set of rows related to the current row (e.g., RANK, ROW_NUMBER).   |
| [Ranking, CTE](#ranking-cte)                                              | Ranking functions and Common Table Expressions for temporary result sets and hierarchical data.                  |
| [Group By Extensions](#group-by-extensions)                               | Advanced grouping capabilities like GROUPING SETS, ROLLUP, and CUBE.                                           |
| [Hierarchical Queries](#hierarchical-queries)                             | Queries for hierarchical or tree-like data structures using techniques like CONNECT BY.                         |
| [Correlation Subqueries](#correlation-subqueries)                         | Subqueries that depend on the outer query's values for filtering and results.                                    |
| [Materialized Views](#materialized-views)                                 | Precomputed and stored query results for faster access and performance.                                         |
| [Hands on Exercise: Filter and Aggregate on Join Results using SQL](#hands-on-exercise-filter-and-aggregate-on-join-results-using-sql) | Filtering and aggregating results after joining tables.                                                        |
| [Hands on Exercise: Cumulative Aggregations and Ranking in SQL Queries](#hands-on-exercise-cumulative-aggregations-and-ranking-in-sql-queries) | Performing cumulative calculations and ranking within SQL queries.                                               |
| [Hands on Exercise: OVER and PARTITION BY Clause in SQL Queries](#hands-on-exercise-over-and-partition-by-clause-in-sql-queries) | Using OVER and PARTITION BY for analytical calculations and window functions.                                      |
| [Hands on Exercise: Total Aggregation using OVER and PARTITION BY in SQL Queries](#hands-on-exercise-total-aggregation-using-over-and-partition-by-in-sql-queries) | Total aggregations with OVER and PARTITION BY clauses for complete datasets.                                      |
| [Hands on Exercise: Ranking in SQL](#hands-on-exercise-ranking-in-sql)     | Applying ranking functions to data based on specific criteria.                                                  |


## Data Cleansing and Manipulation

### Definition:
**Data Cleansing** aur **Manipulation** ka matlab hai data ko errors se bachana aur data ko transform karna jisse wo accurate aur useful ban sake.

### Explanation:
- **Data Cleansing**: Data ko clean karne ke liye aap errors, duplicates, aur inconsistencies ko remove karte hain.
- **Data Manipulation**: Data ko transform ya modify karte hain, jaise data ko sort karna, filter karna, ya aggregate karna.

### Example:
```sql
-- Removing duplicates
DELETE FROM Employees
WHERE EmployeeID NOT IN (
    SELECT MIN(EmployeeID)
    FROM Employees
    GROUP BY FirstName, LastName
);

-- Updating incorrect data
UPDATE Employees
SET Salary = 50000
WHERE Salary < 10000;
```

**Output Explanation:**
- Pehle query mein duplicate rows ko remove kiya gaya, aur dusre query mein low salary values ko correct kiya gaya.

---

## RegEx

### Definition:
**RegEx** (Regular Expressions) ek pattern-matching technique hai jo complex string patterns ko search aur match karne ke liye use hoti hai.

### Explanation:
- **RegEx** SQL mein data ko validate karne ya specific patterns ko match karne ke liye use hota hai.

### Example:
```sql
SELECT FirstName, Email
FROM Employees
WHERE Email LIKE '%@company.com';
```

**Output Table:**

| FirstName | Email                |
|-----------|----------------------|
| Amit      | amit@company.com     |
| Sita      | sita@company.com     |

**Output Explanation:**
- Is query mein, emails filter kiye gaye jo `@company.com` domain se match karte hain.

---

## Aggregate Function

### Definition:
**Aggregate Functions** data ke multiple rows ka summary result return karti hain, jaise sum, average, count, etc.

### Explanation:
- **SUM()**, **AVG()**, **COUNT()**, **MIN()**, **MAX()** jaise functions aggregate calculations perform karte hain.

### Example:
```sql
SELECT DepartmentID, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY DepartmentID;
```

**Output Table:**

| DepartmentID | EmployeeCount |
|--------------|---------------|
| 1            | 5             |
| 2            | 3             |

**Output Explanation:**
- Har department ke liye employees ki count calculate ki gayi hai using `COUNT()` function.

---

## Analytical Functions

### Definition:
**Analytical Functions** SQL mein data ke windows ya partitions ke upar calculations perform karte hain, jaise running totals aur moving averages.

### Explanation:
- Analytical functions jaise **ROW_NUMBER()**, **RANK()**, **DENSE_RANK()** data ko analyze karne aur compare karne ke liye use hote hain.

### Example:
```sql
SELECT EmployeeID, Salary,
       RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
FROM Employees;
```

**Output Table:**

| EmployeeID | Salary | SalaryRank |
|------------|--------|------------|
| 101        | 90000  | 1          |
| 102        | 75000  | 2          |
| 103        | 50000  | 3          |

**Output Explanation:**
- `RANK()` function se salary ke basis par employees ko rank kiya gaya hai.

---

## Ranking, CTE

### Definition:
**Ranking** functions data ko order karte hain aur rank assign karte hain. **CTE** (Common Table Expressions) temporary result sets create karte hain.

### Explanation:
- **Ranking**: `RANK()`, `DENSE_RANK()` functions rank assign karte hain.
- **CTE**: Temporary table banata hai jo complex queries ko simplify karne mein madad karta hai.

### Example:
```sql
WITH RankedEmployees AS (
    SELECT EmployeeID, Salary,
           RANK() OVER (ORDER BY Salary DESC) AS Rank
    FROM Employees
)
SELECT * FROM RankedEmployees
WHERE Rank <= 3;
```

**Output Table:**

| EmployeeID | Salary | Rank |
|------------|--------|------|
| 101        | 90000  | 1    |
| 102        | 75000  | 2    |
| 103        | 50000  | 3    |

**Output Explanation:**
- `WITH` clause se temporary table `RankedEmployees` create kiya gaya hai, aur usme se top 3 ranked employees ko select kiya gaya hai.

---

## Group By Extensions

### Definition:
**Group By Extensions** SQL mein grouping capabilities ko enhance karte hain, jaise **GROUPING SETS**, **ROLLUP**, **CUBE**.

### Explanation:
- **GROUPING SETS**: Multiple groupings ko ek query mein define karne ki capability.
- **ROLLUP**: Hierarchical grouping (summary at different levels).
- **CUBE**: All possible combinations of grouping.

### Example:
```sql
SELECT DepartmentID, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY ROLLUP(DepartmentID);
```

**Output Table:**

| DepartmentID | EmployeeCount |
|--------------|---------------|
| 1            | 5             |
| 2            | 3             |
| NULL         | 8             |

**Output Explanation:**
- `ROLLUP` function se department-wise count ke saath overall total count bhi milta hai.

---

## Hierarchical Queries

### Definition:
**Hierarchical Queries** tree-like data structures ko handle karte hain, jaise organizational structures.

### Explanation:
- SQL mein **Hierarchical Queries** **CONNECT BY** clause se ki jati hain, jo parent-child relationships ko traverse karta hai.

### Example:
```sql
SELECT EmployeeID, ManagerID, Level
FROM Employees
START WITH ManagerID IS NULL
CONNECT BY PRIOR EmployeeID = ManagerID;
```

**Output Table:**

| EmployeeID | ManagerID | Level |
|------------|-----------|-------|
| 1          | NULL      | 1     |
| 2          | 1         | 2     |
| 3          | 1         | 2     |

**Output Explanation:**
- `START WITH` aur `CONNECT BY` clause se hierarchical structure traverse kiya gaya hai.

---

## Correlation Subqueries

### Definition:
**Correlation Subqueries** woh subqueries hain jo outer query ke row values par depend karti hain.

### Explanation:
- Outer query ka har row subquery ke execution ko influence karta hai.

### Example:
```sql
SELECT EmployeeID, FirstName
FROM Employees E
WHERE EXISTS (
    SELECT 1
    FROM Departments D
    WHERE D.DepartmentID = E.DepartmentID AND D.DepartmentName = 'HR'
);
```

**Output Table:**

| EmployeeID | FirstName |
|------------|-----------|
| 101        | Amit      |
| 102        | Ravi      |

**Output Explanation:**
- `EXISTS` clause se check kiya gaya ki employee ka department HR hai ya nahi.

---

## Materialized Views

### Definition:
**Materialized Views** precomputed results ko store karte hain jo queries ko speed up karte hain.

### Explanation:
- Materialized views regularly refresh kiye jaate hain to keep the data up-to-date.

### Example:
```sql
CREATE MATERIALIZED VIEW DepartmentSummary AS
SELECT DepartmentID, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY DepartmentID;
```

**Output Table:**

| DepartmentID | EmployeeCount |
|--------------|---------------|
| 1            | 5             |
| 2            | 3             |

**Output Explanation:**
- `DepartmentSummary` materialized view se department-wise employee count store kiya gaya hai for faster access.

---

## Hands on Exercise: Filter and Aggregate on Join Results using SQL

### Definition:
**Filter and Aggregate** on join results ka matlab hai join results ko filter karna aur aggregate functions apply karna.

### Explanation:
- Join ke results par filtering aur aggregation karna.

### Example:
```sql
SELECT D.DepartmentName, COUNT(E.EmployeeID) AS EmployeeCount
FROM Employees E
JOIN Departments D ON E.DepartmentID = D.DepartmentID
GROUP BY D.DepartmentName
HAVING COUNT(E.EmployeeID) > 3;
```

**Output Table:**

| DepartmentName | EmployeeCount |
|----------------|---------------|
| IT             | 5             |

**Output Explanation:**
- Departments ko join karke count kiya gaya aur un departments ko select kiya gaya jisme employees ki count 3 se zyada hai.

---

## Hands on Exercise: Cumulative Aggregations and Ranking in SQL Queries

### Definition:
**Cumulative Aggregations** aur **Ranking** SQL mein cumulative calculations aur ranking apply karna.

### Explanation:
- Cumulative aggregations total up to the current row. Ranking gives a rank based on certain criteria.

### Example:
```sql
SELECT EmployeeID, Salary,
       SUM(Salary) OVER (ORDER BY Salary) AS CumulativeSalary,
       RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
FROM Employees;
```

**Output Table:**

| EmployeeID | Salary | CumulativeSalary | SalaryRank |
|------------|--------|------------------|------------|
| 103        | 50000  | 50000            | 3          |
| 102        | 75000  | 125000           | 2          |
| 101        | 90000  | 215000           | 1          |

**Output Explanation:**
-

 `SUM() OVER` cumulative salary calculate karta hai aur `RANK()` function se salary ke basis par rank assign kiya gaya hai.

---

## Hands on Exercise: OVER and PARTITION BY Clause in SQL Queries

### Definition:
**OVER** aur **PARTITION BY** clauses analytical functions ke calculations ko control karte hain, jaise partitions aur window frames.

### Explanation:
- **OVER** clause analytical functions ke window frame ko define karta hai.
- **PARTITION BY** clause data ko partitions mein divide karta hai.

### Example:
```sql
SELECT EmployeeID, Salary,
       AVG(Salary) OVER (PARTITION BY DepartmentID) AS AvgDepartmentSalary
FROM Employees;
```

**Output Table:**

| EmployeeID | Salary | AvgDepartmentSalary |
|------------|--------|---------------------|
| 101        | 90000  | 90000               |
| 102        | 75000  | 75000               |
| 103        | 50000  | 50000               |

**Output Explanation:**
- `AVG(Salary) OVER (PARTITION BY DepartmentID)` department-wise average salary calculate karta hai.

---

## Hands on Exercise: Total Aggregation using OVER and PARTITION BY in SQL Queries

### Definition:
**Total Aggregation** using `OVER` aur `PARTITION BY` total aggregations ko perform karne ke liye use hota hai within partitions.

### Explanation:
- **OVER** aur **PARTITION BY** ke saath total aggregations perform kiye jaate hain.

### Example:
```sql
SELECT EmployeeID, Salary,
       SUM(Salary) OVER () AS TotalSalary
FROM Employees;
```

**Output Table:**

| EmployeeID | Salary | TotalSalary |
|------------|--------|-------------|
| 101        | 90000  | 215000      |
| 102        | 75000  | 215000      |
| 103        | 50000  | 215000      |

**Output Explanation:**
- `SUM(Salary) OVER ()` se total salary of all employees calculate kiya gaya hai.

---

## Hands on Exercise: Ranking in SQL

### Definition:
**Ranking** SQL mein rows ko order aur rank assign karta hai based on specified criteria.

### Explanation:
- **RANK()**, **DENSE_RANK()**, **ROW_NUMBER()** functions ranking perform karte hain.

### Example:
```sql
SELECT EmployeeID, Salary,
       RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
FROM Employees;
```

**Output Table:**

| EmployeeID | Salary | SalaryRank |
|------------|--------|------------|
| 101        | 90000  | 1          |
| 102        | 75000  | 2          |
| 103        | 50000  | 3          |

**Output Explanation:**
- `RANK()` function se salary ke basis par employees ko rank assign kiya gaya hai.
- 
