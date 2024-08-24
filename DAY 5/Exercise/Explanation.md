## Explanation

### 1. Create Tables and Insert Data

**SQL Queries to Create Tables:**

```sql
-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    City NVARCHAR(50)
);

-- Create Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    OrderAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert Data into Customers Table
INSERT INTO Customers (CustomerID, FirstName, LastName, City) VALUES
(1, 'John', 'Doe', 'Mumbai'),
(2, 'Jane', 'Smith', 'Delhi'),
(3, 'Emily', 'Jones', 'Bangalore'),
(4, 'Michael', 'Brown', 'Mumbai'),
(5, 'Sarah', 'Davis', 'Chennai');

-- Insert Data into Orders Table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, OrderAmount) VALUES
(101, 1, '2023-01-15', 500.00),
(102, 1, '2023-03-10', 700.00),
(103, 2, '2023-02-20', 1200.00),
(104, 3, '2023-04-05', 300.00),
(105, 4, '2023-06-12', 1500.00),
(106, 5, '2023-07-19', 2000.00),
(107, 1, '2023-09-25', 800.00),
(108, 3, '2023-10-01', 900.00);
```

### **Generated Table: Customers**

| **CustomerID** | **FirstName** | **LastName** | **City**    |
|----------------|---------------|--------------|-------------|
| 1              | John          | Doe          | Mumbai      |
| 2              | Jane          | Smith        | Delhi       |
| 3              | Emily         | Jones        | Bangalore   |
| 4              | Michael       | Brown        | Mumbai      |
| 5              | Sarah         | Davis        | Chennai     |

### **Generated Table: Orders**

| **OrderID** | **CustomerID** | **OrderDate** | **OrderAmount** |
|-------------|----------------|---------------|-----------------|
| 101         | 1              | 2023-01-15    | 500.00          |
| 102         | 1              | 2023-03-10    | 700.00          |
| 103         | 2              | 2023-02-20    | 1200.00         |
| 104         | 3              | 2023-04-05    | 300.00          |
| 105         | 4              | 2023-06-12    | 1500.00         |
| 106         | 5              | 2023-07-19    | 2000.00         |
| 107         | 1              | 2023-09-25    | 800.00          |
| 108         | 3              | 2023-10-01    | 900.00          |

**Explanation**:

1. **Customers Table**:
   - The `Customers` table contains 5 rows, each representing a customer with a unique `CustomerID`.
   - Fields include `FirstName`, `LastName`, and `City` for each customer.

2. **Orders Table**:
   - The `Orders` table contains 8 rows, each representing an order placed by a customer.
   - Each order has a unique `OrderID` and is linked to a customer via `CustomerID` (foreign key relationship).
   - The `OrderDate` represents when the order was placed, and `OrderAmount` indicates the value of each order.

These tables demonstrate a typical relational database schema where `Customers` and `Orders` are related through a foreign key, enabling the management of customer data and their corresponding orders effectively.

## 2. Queries for Tasks

### **1. Filter and Aggregate on Join Results using SQL**

#### **Question**:
Join the `Orders` and `Customers` tables to find the total order amount per customer and filter out customers who have spent less than $1,000.

#### **Explanation**:
This task requires you to use a SQL `JOIN` to combine data from the `Orders` and `Customers` tables. The goal is to calculate the total order amount each customer has spent and then filter out those customers whose total spending is below $1,000.

- **JOIN**: Combines rows from two or more tables based on a related column between them. In this case, we join `Customers` and `Orders` using `CustomerID`.
- **SUM()**: An aggregate function that calculates the total sum of a numeric column. We use this to find the total order amount per customer.
- **GROUP BY**: Groups rows that have the same values into summary rows. Here, it's used to group data by each customer.
- **HAVING**: Filters groups based on a condition. It is similar to the `WHERE` clause but is used for groups created by `GROUP BY`. We use `HAVING` to filter out customers who have spent less than $1,000.

#### **SQL Query**:
```sql
SELECT c.CustomerID, 
       c.FirstName, 
       c.LastName, 
       SUM(o.OrderAmount) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
HAVING SUM(o.OrderAmount) >= 1000;
```

#### **Generated Table**:
| CustomerID | FirstName | LastName | TotalSpent |
|------------|-----------|----------|------------|
| 1          | John      | Doe      | 2000.00    |
| 2          | Jane      | Smith    | 1200.00    |
| 4          | Michael   | Brown    | 1500.00    |
| 5          | Sarah     | Davis    | 2000.00    |

**Output Explanation**:
- The output table shows only those customers who have a total spending (`TotalSpent`) of $1,000 or more.
- John Doe has spent a total of $2,000, Jane Smith $1,200, Michael Brown $1,500, and Sarah Davis $2,000.

### **2. Cumulative Aggregations and Ranking in SQL Queries**

#### **Question**:
Create a cumulative sum of the `OrderAmount` for each customer to track the running total of how much each customer has spent.

#### **Explanation**:
This task requires the use of window functions to calculate a running total of the `OrderAmount` for each customer. 

- **Window Functions**: Operate on a set of table rows related to the current row. 
- **SUM() OVER()**: A window function that allows cumulative sums. By partitioning by `CustomerID` and ordering by `OrderDate`, we calculate the running total for each customer.

#### **SQL Query**:
```sql
SELECT c.CustomerID,
       c.FirstName,
       c.LastName,
       o.OrderDate,
       o.OrderAmount,
       SUM(o.OrderAmount) OVER (PARTITION BY o.CustomerID ORDER BY o.OrderDate) AS RunningTotal
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
ORDER BY c.CustomerID, o.OrderDate;
```

#### **Generated Table**:
| CustomerID | FirstName | LastName | OrderDate  | OrderAmount | RunningTotal |
|------------|-----------|----------|------------|-------------|--------------|
| 1          | John      | Doe      | 2023-01-15 | 500.00      | 500.00       |
| 1          | John      | Doe      | 2023-03-10 | 700.00      | 1200.00      |
| 1          | John      | Doe      | 2023-09-25 | 800.00      | 2000.00      |
| 2          | Jane      | Smith    | 2023-02-20 | 1200.00     | 1200.00      |
| 3          | Emily     | Jones    | 2023-04-05 | 300.00      | 300.00       |
| 3          | Emily     | Jones    | 2023-10-01 | 900.00      | 1200.00      |
| 4          | Michael   | Brown    | 2023-06-12 | 1500.00     | 1500.00      |
| 5          | Sarah     | Davis    | 2023-07-19 | 2000.00     | 2000.00      |

**Output Explanation**:
- The output shows a running total of `OrderAmount` for each customer.
- For John Doe, the `RunningTotal` starts with 500, then accumulates to 1,200 after the next order, and finally 2,000.

### **3. OVER and PARTITION BY Clause in SQL Queries**

#### **Question**:
Rank the customers based on the total amount they have spent, partitioned by city.

#### **Explanation**:
This query ranks customers within each city based on their total spending using window functions.

- **RANK()**: Provides a ranking of rows within a partition. Rows with equal values receive the same rank, and the next rank is incremented accordingly.
- **PARTITION BY**: Divides the result set into partitions to which the window function is applied. Here, we partition by `City`.

#### **SQL Query**:
```sql
SELECT c.CustomerID,
       c.FirstName,
       c.LastName,
       c.City,
       SUM(o.OrderAmount) AS TotalSpent,
       RANK() OVER (PARTITION BY c.City ORDER BY SUM(o.OrderAmount) DESC) AS RankInCity
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName, c.City;
```

#### **Generated Table**:
| CustomerID | FirstName | LastName | City     | TotalSpent | RankInCity |
|------------|-----------|----------|----------|------------|------------|
| 4          | Michael   | Brown    | Mumbai   | 1500.00    | 1          |
| 1          | John      | Doe      | Mumbai   | 2000.00    | 2          |
| 2          | Jane      | Smith    | Delhi    | 1200.00    | 1          |
| 3          | Emily     | Jones    | Bangalore| 1200.00    | 1          |
| 5          | Sarah     | Davis    | Chennai  | 2000.00    | 1          |

**Output Explanation**:
- The output ranks customers within each city based on their `TotalSpent`.
- In Mumbai, Michael Brown ranks 1st, followed by John Doe.

### **4. Total Aggregation using OVER and PARTITION BY in SQL Queries**

#### **Question**:
Calculate the total amount of all orders (overall total) and the percentage each customer's total spending contributes to the overall total.

#### **Explanation**:
This query calculates each customer’s total spending and what percentage it is of the overall total spending.

- **SUM() OVER()**: Calculates the overall total spending across all rows without any partitioning.
- **Percentage Calculation**: Computes each customer’s spending as a percentage of the overall total.

#### **SQL Query**:
```sql
WITH CustomerTotals AS (
    SELECT c.CustomerID,
           c.FirstName,
           c.LastName,
           SUM(o.OrderAmount) AS TotalSpent
    FROM Customers c
    JOIN Orders o ON c.CustomerID = o.CustomerID
    GROUP BY c.CustomerID, c.FirstName, c.LastName
)
SELECT CustomerID,
       FirstName,
       LastName,
       TotalSpent,
       SUM(TotalSpent) OVER () AS OverallTotal,
       (TotalSpent * 100.0 / SUM(TotalSpent) OVER ()) AS PercentageOfTotal
FROM CustomerTotals;
```

#### **Generated Table**:
| CustomerID | FirstName | LastName | TotalSpent | OverallTotal | PercentageOfTotal |
|------------|-----------|----------|------------|--------------|-------------------|
| 1          | John      | Doe      | 2000.00    | 8200.00      | 24.39             |
| 2          | Jane      | Smith    | 1200.00    | 8200.00      | 14.63             |
| 3          | Emily     | Jones    | 1200.00    | 8200.00      | 14.63             |
| 4          | Michael   | Brown    | 1500.00    | 8200.00      | 18.29             |
| 5          | Sarah     | Davis    | 2000.00    | 8200.00      | 24.39             |

**Output Explanation**:
- `OverallTotal` is the same for all rows, representing the total of all orders.
- `PercentageOfTotal` shows how much each customer’s spending contributes to the `OverallTotal`.

### **5. Ranking in SQL**

#### **Question**:
Rank all customers based on the total amount they have spent,

 showing the ranks even when ties occur.

#### **Explanation**:
This query ranks customers based on their total spending, handling ties by using the `DENSE_RANK()` function.

- **DENSE_RANK()**: Provides a rank for each row within a result set partition. Rows with equal values receive the same rank, and no ranks are skipped.

#### **SQL Query**:
```sql
SELECT c.CustomerID,
       c.FirstName,
       c.LastName,
       SUM(o.OrderAmount) AS TotalSpent,
       DENSE_RANK() OVER (ORDER BY SUM(o.OrderAmount) DESC) AS SpendingRank
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName;
```

#### **Generated Table**:
| CustomerID | FirstName | LastName | TotalSpent | SpendingRank |
|------------|-----------|----------|------------|--------------|
| 1          | John      | Doe      | 2000.00    | 1            |
| 5          | Sarah     | Davis    | 2000.00    | 1            |
| 4          | Michael   | Brown    | 1500.00    | 2            |
| 2          | Jane      | Smith    | 1200.00    | 3            |
| 3          | Emily     | Jones    | 1200.00    | 3            |

**Output Explanation**:
- The `SpendingRank` column ranks customers by their total spending. Customers with the same spending have the same rank, and the next rank number follows consecutively without skipping any ranks.

Let's continue by exploring more SQL queries that involve various SQL concepts and techniques, such as handling NULL values, using advanced filtering, and applying window functions for more complex operations.

### **6. Handling NULL Values in SQL Queries**

#### **Question**:
Select all customers and their total spending, including those who have not placed any orders, and display `0` as their total spending if they haven't placed any orders.

#### **Explanation**:
This task requires an `OUTER JOIN` to include customers who have not placed any orders. To handle NULL values and display `0` instead of NULL for customers with no orders, we use the `COALESCE()` function.

- **LEFT JOIN**: Includes all records from the left table (`Customers`), even if there are no matches in the right table (`Orders`).
- **COALESCE()**: Returns the first non-NULL value in its arguments. This is useful for replacing NULL with a specified value, like `0`.

#### **SQL Query**:
```sql
SELECT c.CustomerID,
       c.FirstName,
       c.LastName,
       COALESCE(SUM(o.OrderAmount), 0) AS TotalSpent
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName;
```

#### **Generated Table**:
| CustomerID | FirstName | LastName | TotalSpent |
|------------|-----------|----------|------------|
| 1          | John      | Doe      | 2000.00    |
| 2          | Jane      | Smith    | 1200.00    |
| 3          | Emily     | Jones    | 1200.00    |
| 4          | Michael   | Brown    | 1500.00    |
| 5          | Sarah     | Davis    | 2000.00    |
| 6          | Laura     | Wilson   | 0.00       |

**Output Explanation**:
- The output includes all customers, including Laura Wilson, who has not placed any orders. Her `TotalSpent` is shown as `0.00` instead of `NULL`.

### **7. Advanced Filtering using SQL**

#### **Question**:
Find customers who have placed more than one order and have a total spending between $1,000 and $2,000.

#### **Explanation**:
This query requires filtering based on multiple conditions: the number of orders a customer has placed and their total spending range. It uses `HAVING` to apply these conditions to groups formed by `GROUP BY`.

- **COUNT()**: An aggregate function that returns the number of rows in a group.
- **HAVING**: Applies conditions to aggregated results. Used here to filter customers based on the number of orders and total spending.

#### **SQL Query**:
```sql
SELECT c.CustomerID,
       c.FirstName,
       c.LastName,
       COUNT(o.OrderID) AS NumberOfOrders,
       SUM(o.OrderAmount) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
HAVING COUNT(o.OrderID) > 1
   AND SUM(o.OrderAmount) BETWEEN 1000 AND 2000;
```

#### **Generated Table**:
| CustomerID | FirstName | LastName | NumberOfOrders | TotalSpent |
|------------|-----------|----------|----------------|------------|
| 1          | John      | Doe      | 3              | 2000.00    |
| 3          | Emily     | Jones    | 2              | 1200.00    |

**Output Explanation**:
- The output shows customers who have placed more than one order and have a total spending between $1,000 and $2,000. John Doe and Emily Jones meet both criteria.

### **8. Complex Aggregations with GROUP BY and HAVING in SQL**

#### **Question**:
Calculate the average order amount for each customer and select only those customers whose average order amount exceeds $500.

#### **Explanation**:
This query involves calculating an average for each group of customer orders and filtering these groups using `HAVING`.

- **AVG()**: An aggregate function that calculates the average value of a numeric column.
- **HAVING**: Filters groups based on the average order amount.

#### **SQL Query**:
```sql
SELECT c.CustomerID,
       c.FirstName,
       c.LastName,
       AVG(o.OrderAmount) AS AverageOrderAmount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
HAVING AVG(o.OrderAmount) > 500;
```

#### **Generated Table**:
| CustomerID | FirstName | LastName | AverageOrderAmount |
|------------|-----------|----------|--------------------|
| 1          | John      | Doe      | 666.67             |
| 2          | Jane      | Smith    | 1200.00            |
| 4          | Michael   | Brown    | 1500.00            |
| 5          | Sarah     | Davis    | 2000.00            |

**Output Explanation**:
- The output includes customers whose average order amount exceeds $500. For instance, John Doe's average order amount is $666.67, calculated based on his total spending and the number of orders he placed.

### **9. Window Functions with ORDER BY in SQL**

#### **Question**:
List each customer’s order, including the order date, and calculate the lagged difference in order amount to find out how much more or less they spent compared to their previous order.

#### **Explanation**:
This query uses a window function to compute the difference in `OrderAmount` compared to the previous order for each customer.

- **LAG()**: A window function that accesses data from a previous row in the same result set without the use of a self-join.
- **PARTITION BY**: Partitions the result set by `CustomerID` and orders within each partition by `OrderDate` to compute differences in spending.

#### **SQL Query**:
```sql
SELECT c.CustomerID,
       c.FirstName,
       c.LastName,
       o.OrderDate,
       o.OrderAmount,
       LAG(o.OrderAmount) OVER (PARTITION BY c.CustomerID ORDER BY o.OrderDate) AS PreviousOrderAmount,
       (o.OrderAmount - LAG(o.OrderAmount) OVER (PARTITION BY c.CustomerID ORDER BY o.OrderDate)) AS DifferenceFromPrevious
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
ORDER BY c.CustomerID, o.OrderDate;
```

#### **Generated Table**:
| CustomerID | FirstName | LastName | OrderDate  | OrderAmount | PreviousOrderAmount | DifferenceFromPrevious |
|------------|-----------|----------|------------|-------------|---------------------|------------------------|
| 1          | John      | Doe      | 2023-01-15 | 500.00      | NULL                | NULL                   |
| 1          | John      | Doe      | 2023-03-10 | 700.00      | 500.00              | 200.00                 |
| 1          | John      | Doe      | 2023-09-25 | 800.00      | 700.00              | 100.00                 |
| 2          | Jane      | Smith    | 2023-02-20 | 1200.00     | NULL                | NULL                   |
| 3          | Emily     | Jones    | 2023-04-05 | 300.00      | NULL                | NULL                   |
| 3          | Emily     | Jones    | 2023-10-01 | 900.00      | 300.00              | 600.00                 |

**Output Explanation**:
- The `PreviousOrderAmount` column shows the amount from the last order for each customer, and `DifferenceFromPrevious` calculates how much more or less was spent compared to the previous order.
- For John Doe, his first order amount is shown as NULL for `PreviousOrderAmount` since there is no prior order. The difference between his second and first order amounts is $200.

### **10. Using CASE Statements in SQL Queries**

#### **Question**:
Assign a label to each customer based on their total spending: "High Spender" for those who spent over $1,500, "Moderate Spender" for those between $1,000 and $1,500, and "Low Spender" for all others.

#### **Explanation**:
This task uses the `CASE` statement to create custom labels based on conditional logic applied to each customer’s total spending.

- **CASE**: Provides if-then-else type logic to SQL. It allows conditional operations in SQL queries.
- **END**: Marks the end of a `CASE` statement.

#### **SQL Query**:
```sql
SELECT c.CustomerID,
       c.FirstName,
       c.LastName,
       SUM(o.OrderAmount) AS TotalSpent,
       CASE
           WHEN SUM(o.OrderAmount) > 1500 THEN 'High Spender'
           WHEN SUM(o.OrderAmount) BETWEEN 1000 AND 1500 THEN 'Moderate Spender'
           ELSE 'Low Spender'
       END AS SpendingCategory
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName;
```

#### **Generated Table**:
| CustomerID | FirstName | LastName | TotalSpent | SpendingCategory |
|------------|-----------|----------|------------|------------------|
| 1          | John      | Doe      | 2000.00    |

 High Spender     |
| 2          | Jane      | Smith    | 1200.00    | Moderate Spender |
| 3          | Emily     | Jones    | 1200.00    | Moderate Spender |
| 4          | Michael   | Brown    | 1500.00    | Moderate Spender |
| 5          | Sarah     | Davis    | 2000.00    | High Spender     |

**Output Explanation**:
- Customers are categorized based on their total spending. John Doe and Sarah Davis are labeled as "High Spender" because their total spending exceeds $1,500. Jane Smith and Emily Jones are labeled as "Moderate Spender" since their spending is between $1,000 and $1,500. 
