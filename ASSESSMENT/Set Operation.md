# Set Operations in SQL

Set operations in SQL are used to combine the results of two or more queries. The primary set operations include:

1. **UNION**: Combines the results of two queries and removes duplicate rows. Each query must have the same number of columns, and corresponding columns must have compatible data types.

2. **INTERSECT**: Returns only the rows that are common to both queries. Like `UNION`, the queries must have the same number of columns with compatible data types.

3. **EXCEPT**: Returns rows from the first query that are not in the second query. It is the opposite of `INTERSECT`.

---

### **Creating and Inserting Values into Tables**

**1. Create and Insert Values into `Customers` and `Orders` Tables**

```sql
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Customers (CustomerID, CustomerName) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David');

INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES
(1, 1, '2024-08-01'),
(2, 2, '2024-08-05'),
(3, 1, '2024-08-10'),
(4, 3, '2024-08-15'),
(5, 2, '2024-08-20');
```

**2. Create and Insert Values into `Products` Table**

```sql
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    CategoryID INT
);

INSERT INTO Products (ProductID, ProductName, CategoryID) VALUES
(1, 'Smartphone', 1),
(2, 'Laptop', 1),
(3, 'Headphones', 2),
(4, 'Charger', 2),
(5, 'Tablet', 1);
```

**3. Create and Insert Values into `Categories` Table**

```sql
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50)
);

INSERT INTO Categories (CategoryID, CategoryName) VALUES
(1, 'Electronics'),
(2, 'Accessories');
```

Here are the output tables for the data inserted into the `Customers`, `Orders`, `Products`, and `Categories` tables.

### 1. `Customers` Table

| **CustomerID** | **CustomerName** |
|----------------|------------------|
| 1              | Alice            |
| 2              | Bob              |
| 3              | Charlie          |
| 4              | David            |

### 2. `Orders` Table

| **OrderID** | **CustomerID** | **OrderDate** |
|-------------|----------------|---------------|
| 1           | 1              | 2024-08-01    |
| 2           | 2              | 2024-08-05    |
| 3           | 1              | 2024-08-10    |
| 4           | 3              | 2024-08-15    |
| 5           | 2              | 2024-08-20    |

### 3. `Products` Table

| **ProductID** | **ProductName** | **CategoryID** |
|---------------|-----------------|----------------|
| 1             | Smartphone      | 1              |
| 2             | Laptop          | 1              |
| 3             | Headphones      | 2              |
| 4             | Charger         | 2              |
| 5             | Tablet          | 1              |

### 4. `Categories` Table

| **CategoryID** | **CategoryName** |
|----------------|------------------|
| 1              | Electronics      |
| 2              | Accessories      |

These tables provide the data necessary to perform SQL queries and operations, demonstrating basic data setup in relational databases.

### **Set Operations Exercise**

**1. UNION: Combine Customer Names from `Customers` and `Orders` Tables**

**Query:**

```sql
SELECT CustomerName FROM Customers
UNION
SELECT C.CustomerName
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID;
```

**Output Table:**

| **CustomerName** |
|------------------|
| Alice            |
| Bob              |
| Charlie          |
| David            |

**Explanation**: The `UNION` operator combines the unique names of customers from both the `Customers` table and those who have placed orders in the `Orders` table.

**2. INTERSECT: Find Products in Both Electronics and Accessories Categories**

**Query:**

```sql
SELECT ProductName
FROM Products
WHERE CategoryID = (SELECT CategoryID FROM Categories WHERE CategoryName = 'Electronics')
INTERSECT
SELECT ProductName
FROM Products
WHERE CategoryID = (SELECT CategoryID FROM Categories WHERE CategoryName = 'Accessories');
```

**Output Table:**

| **ProductName** |
|-----------------|
| (No results)    |

**Explanation**: The `INTERSECT` operator returns products that are present in both the 'Electronics' and 'Accessories' categories. As there are no products listed under both categories, the result is empty.

**3. EXCEPT: Find Products in Electronics but Not in Accessories**

**Query:**

```sql
SELECT ProductName
FROM Products
WHERE CategoryID = (SELECT CategoryID FROM Categories WHERE CategoryName = 'Electronics')
EXCEPT
SELECT ProductName
FROM Products
WHERE CategoryID = (SELECT CategoryID FROM Categories WHERE CategoryName = 'Accessories');
```

**Output Table:**

| **ProductName** |
|-----------------|
| Smartphone      |
| Laptop          |
| Tablet          |

**Explanation**: The `EXCEPT` operator returns products that are in the 'Electronics' category but not in the 'Accessories' category. This query identifies products exclusive to 'Electronics'.

The provided queries and output tables should give you a solid understanding of how to apply set operations in SQL to manipulate and analyze data.
