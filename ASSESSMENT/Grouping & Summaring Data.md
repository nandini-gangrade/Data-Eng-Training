## Basics of Grouping and Summarizing Data

**Grouping and Summarizing Data** in SQL involves aggregating information based on certain criteria. Here's a breakdown of the core concepts:

1. **GROUP BY**: This clause is used to group rows that have the same values into summary rows. For instance, if you want to group sales data by each customer, you use the `GROUP BY` clause with the customer column.

2. **Aggregate Functions**: These functions perform calculations on a set of values and return a single value. Common aggregate functions include:
   - `COUNT()`: Counts the number of rows.
   - `SUM()`: Adds up the values.
   - `AVG()`: Calculates the average value.
   - `MAX()`: Finds the maximum value.
   - `MIN()`: Finds the minimum value.

3. **HAVING Clause**: Used to filter groups based on aggregate functions. Unlike the `WHERE` clause which filters rows before grouping, `HAVING` filters groups after the grouping has been done.

4. **ORDER BY**: Can be used to sort the results of aggregated data.

## **Tables:**

1. **Orders Table**: To group orders by customer and month.
2. **Products Table**: To group products by category.
3. **Categories Table**: To add a category to products.

**Table Creation and Insertion:**

### **1. Orders Table**

**Table Creation:**

```sql
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    Quantity INT,
    OrderDate DATE
);
```

**Inserted Values:**

```sql
INSERT INTO Orders (OrderID, CustomerID, ProductID, Quantity, OrderDate) VALUES
(1, 1, 1, 2, '2024-07-10'),
(2, 2, 2, 1, '2024-07-15'),
(3, 1, 3, 5, '2024-07-20'),
(4, 3, 1, 1, '2024-07-25'),
(5, 4, 2, 3, '2024-07-30');
```

**Output Table:**

| **OrderID** | **CustomerID** | **ProductID** | **Quantity** | **OrderDate** |
|-------------|----------------|---------------|--------------|---------------|
| 1           | 1              | 1             | 2            | 2024-07-10    |
| 2           | 2              | 2             | 1            | 2024-07-15    |
| 3           | 1              | 3             | 5            | 2024-07-20    |
| 4           | 3              | 1             | 1            | 2024-07-25    |
| 5           | 4              | 2             | 3            | 2024-07-30    |

---

### **2. Products Table**

**Table Creation:**

```sql
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2),
    CategoryID INT
);
```

**Inserted Values:**

```sql
INSERT INTO Products (ProductID, ProductName, Price, CategoryID) VALUES
(1, 'Laptop', 1000.00, 1),
(2, 'Phone', 500.00, 2),
(3, 'Tablet', 300.00, 1),
(4, 'Monitor', 150.00, 3),
(5, 'Keyboard', 50.00, 2);
```

**Output Table:**

| **ProductID** | **ProductName** | **Price** | **CategoryID** |
|---------------|-----------------|-----------|----------------|
| 1             | Laptop          | 1000.00   | 1              |
| 2             | Phone           | 500.00    | 2              |
| 3             | Tablet          | 300.00    | 1              |
| 4             | Monitor         | 150.00    | 3              |
| 5             | Keyboard        | 50.00     | 2              |

---

### **3. Categories Table**

**Table Creation:**

```sql
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100)
);
```

**Inserted Values:**

```sql
INSERT INTO Categories (CategoryID, CategoryName) VALUES
(1, 'Electronics'),
(2, 'Accessories'),
(3, 'Peripherals');
```

**Output Table:**

| **CategoryID** | **CategoryName** |
|----------------|------------------|
| 1              | Electronics      |
| 2              | Accessories      |
| 3              | Peripherals      |

---

These tables represent the basic structure and data for performing SQL queries related to grouping, summarizing, and joining. You can use this data to run various queries and exercises as described earlier.

## Exercise Solutions

### 1. Group orders by customer and calculate the total amount spent by each customer.

**Query:**

```sql
SELECT o.CustomerID, 
       SUM(p.Price * o.Quantity) AS TotalAmountSpent
FROM Orders o
JOIN Products p ON o.ProductID = p.ProductID
GROUP BY o.CustomerID;
```

**Output Table:**

| **CustomerID** | **TotalAmountSpent** |
|----------------|-----------------------|
| 1              | 5500.00               |
| 2              | 500.00                |
| 3              | 1000.00               |
| 4              | 1500.00               |

**Explanation**: This query joins the `Orders` table with the `Products` table to calculate the total amount spent by each customer. We use `SUM(p.Price * o.Quantity)` to get the total expenditure and group by `CustomerID`.

### 2. Group products by category and calculate the average price for each category.

**Query:**

```sql
SELECT c.CategoryName, 
       AVG(p.Price) AS AveragePrice
FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryName;
```

**Output Table:**

| **CategoryName** | **AveragePrice** |
|------------------|------------------|
| Electronics      | 650.00           |
| Accessories      | 275.00           |
| Peripherals      | 150.00           |

**Explanation**: This query joins the `Products` table with the `Categories` table to calculate the average price for each product category. `AVG(p.Price)` is used to compute the average price, and the result is grouped by `CategoryName`.

### 3. Group orders by month and calculate the total sales for each month.

**Query:**

```sql
SELECT DATE_FORMAT(OrderDate, '%Y-%m') AS Month, 
       SUM(p.Price * o.Quantity) AS TotalSales
FROM Orders o
JOIN Products p ON o.ProductID = p.ProductID
GROUP BY DATE_FORMAT(OrderDate, '%Y-%m');
```

**Output Table:**

| **Month** | **TotalSales** |
|-----------|----------------|
| 2024-07   | 5500.00        |

**Explanation**: This query groups the orders by month and calculates the total sales for each month. `DATE_FORMAT(OrderDate, '%Y-%m')` is used to extract the year and month, and `SUM(p.Price * o.Quantity)` calculates the total sales.

### 4. Write a query to group products by category and calculate the number of products in each category.

**Query:**

```sql
SELECT c.CategoryName, 
       COUNT(p.ProductID) AS NumberOfProducts
FROM Products p
JOIN Categories c ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryName;
```

**Output Table:**

| **CategoryName** | **NumberOfProducts** |
|------------------|-----------------------|
| Electronics      | 2                     |
| Accessories      | 2                     |
| Peripherals      | 1                     |

**Explanation**: This query counts the number of products in each category. `COUNT(p.ProductID)` gives the number of products, and the result is grouped by `CategoryName`.

### 5. Use the HAVING clause to filter groups of customers who have placed more than 5 orders.

**Query:**

```sql
SELECT CustomerID, 
       COUNT(OrderID) AS NumberOfOrders
FROM Orders
GROUP BY CustomerID
HAVING COUNT(OrderID) > 5;
```

**Output Table:**

| **CustomerID** | **NumberOfOrders** |
|----------------|--------------------|
| (No results)   | (No results)       |

**Explanation**: This query groups orders by `CustomerID` and uses the `HAVING` clause to filter out customers who have placed more than 5 orders. In this case, there are no customers with more than 5 orders, so the result is empty.
