## SQL Tables and Sample Data

#### 1. Create Customers Table
```sql
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15)
);
```
**Sample Data for Customers Table**
```sql
INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber)
VALUES 
('Amit', 'Sharma', 'amit.sharma@example.com', '9876543210'),
('Priya', 'Mehta', 'priya.mehta@example.com', '8765432109'),
('Rohit', 'Kumar', 'rohit.kumar@example.com', '7654321098'),
('Neha', 'Verma', 'neha.verma@example.com', '6543210987'),
('Siddharth', 'Singh', 'siddharth.singh@example.com', '5432109876'),
('Asha', 'Rao', 'asha.rao@example.com', '4321098765'),
('Raj', 'Patel', 'raj.patel@example.com', '3210987654'),
('Meera', 'Gupta', 'meera.gupta@example.com', '2109876543'),
('Vikram', 'Yadav', 'vikram.yadav@example.com', '1098765432');
```

**Generated Table: Customers**
| CustomerID | FirstName | LastName | Email                   | PhoneNumber |
|------------|-----------|----------|-------------------------|-------------|
| 1          | Amit      | Sharma   | amit.sharma@example.com | 9876543210  |
| 2          | Priya     | Mehta    | priya.mehta@example.com | 8765432109  |
| 3          | Rohit     | Kumar    | rohit.kumar@example.com | 7654321098  |
| 4          | Neha      | Verma    | neha.verma@example.com  | 6543210987  |
| 5          | Siddharth | Singh    | siddharth.singh@example.com | 5432109876 |
| 6          | Asha      | Rao      | asha.rao@example.com    | 4321098765  |
| 7          | Raj       | Patel    | raj.patel@example.com   | 3210987654  |
| 8          | Meera     | Gupta    | meera.gupta@example.com | 2109876543  |
| 9          | Vikram    | Yadav    | vikram.yadav@example.com| 1098765432  |

#### 2. Create Products Table
```sql
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    StockQuantity INT
);
```
**Sample Data for Products Table**
```sql
INSERT INTO Products (ProductName, Category, Price, StockQuantity)
VALUES 
('Laptop', 'Electronics', 75000.00, 15),
('Smartphone', 'Electronics', 25000.00, 30),
('Desk Chair', 'Furniture', 5000.00, 10),
('Monitor', 'Electronics', 12000.00, 20),
('Bookshelf', 'Furniture', 8000.00, 8),
('Tablet', 'Electronics', 20000.00, 12),
('Headphones', 'Electronics', 3000.00, 25);
```

**Generated Table: Products**
| ProductID | ProductName | Category    | Price   | StockQuantity |
|-----------|-------------|-------------|---------|---------------|
| 1         | Laptop      | Electronics | 75000.00| 15            |
| 2         | Smartphone  | Electronics | 25000.00| 30            |
| 3         | Desk Chair  | Furniture   | 5000.00 | 10            |
| 4         | Monitor     | Electronics | 12000.00| 20            |
| 5         | Bookshelf   | Furniture   | 8000.00 | 8             |
| 6         | Tablet      | Electronics | 20000.00| 12            |
| 7         | Headphones  | Electronics | 3000.00 | 25            |

#### 3. Create Orders Table
```sql
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    ProductID INT,
    Quantity INT,
    TotalAmount DECIMAL(10, 2),
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
```
**Sample Data for Orders Table**
```sql
INSERT INTO Orders (CustomerID, ProductID, Quantity, TotalAmount, OrderDate)
VALUES 
(1, 1, 2, 150000.00, '2024-08-01'),
(2, 2, 1, 25000.00, '2024-08-02'),
(3, 3, 1, 5000.00, '2024-08-03'),
(4, 4, 2, 24000.00, '2024-08-04'),
(5, 5, 1, 8000.00, '2024-08-05'),
(6, 6, 2, 12000.00, '2024-08-06'),
(7, 7, 1, 20000.00, '2024-08-07');
```

**Generated Table: Orders**
| OrderID | CustomerID | ProductID | Quantity | TotalAmount | OrderDate  |
|---------|------------|-----------|----------|-------------|------------|
| 1       | 1          | 1         | 2        | 150000.00   | 2024-08-01 |
| 2       | 2          | 2         | 1        | 25000.00    | 2024-08-02 |
| 3       | 3          | 3         | 1        | 5000.00     | 2024-08-03 |
| 4       | 4          | 4         | 2        | 24000.00    | 2024-08-04 |
| 5       | 5          | 5         | 1        | 8000.00     | 2024-08-05 |
| 6       | 6          | 6         | 2        | 12000.00    | 2024-08-06 |
| 7       | 7          | 7         | 1        | 20000.00    | 2024-08-07 |

---

## Exercises and Explanations

### 1. Retrieve all products from the Products table that belong to the category 'Electronics' and have a price greater than 500.

**Explanation:**
- **Topic:** Filtering data with specific conditions.
- **Query Explanation:** We need to fetch records from the `Products` table where the `Category` is 'Electronics' and `Price` is more than 500. We use the `WHERE` clause to specify these conditions.

**Query:**
```sql
SELECT * 
FROM Products
WHERE Category = 'Electronics' AND Price > 500;
```

**Execution Steps:**
1. **FROM Products:** Selects the data from the `Products` table.
2. **WHERE Category = 'Electronics':** Filters the rows where the category is 'Electronics'.
3. **AND Price > 500:** Further filters these rows to include only those with a price greater than 500.

**Generated Table:**
| ProductID | ProductName | Category    | Price   | StockQuantity |
|-----------|-------------|-------------|---------|---------------|
| 1         | Laptop      | Electronics | 75000.00| 15            |
| 2         | Smartphone  | Electronics | 25000.00| 30            |
| 4         | Monitor     | Electronics | 12000.00| 20            |
| 6         | Tablet      | Electronics | 20000.00| 12            |
| 7         | Headphones  | Electronics | 3000.00 | 25            |

### 2. Calculate the total quantity of products sold from the Orders table.

**Explanation:**
- **Topic:** Aggregating data to find totals.
- **Query Explanation:** We need to sum up the `Quantity` column in the `Orders` table to get the total quantity of products sold. 

**Query:**
```sql
SELECT SUM(Quantity) AS TotalQuantity
FROM Orders;
```

**Execution Steps:**
1. **FROM Orders:** Selects data from the `Orders` table.
2. **SUM(Quantity):** Computes the sum of the `Quantity` column.
3. **AS TotalQuantity:** Renames the result column to `TotalQuantity`.

**Generated Table:**
| TotalQuantity |
|---------------|
| 8             |

### 3. Calculate the total revenue generated for each product in the Orders table.

**Explanation:**
- **Topic:** Calculating aggregated values using joins.
- **Query Explanation:** We need to calculate the revenue for each product by multiplying the `Quantity` sold by the `Price` of each product. We use a `JOIN` to combine `Orders` and `

Products` tables.

**Query:**
```sql
SELECT 
    p.ProductName,
    SUM(o.Quantity * p.Price) AS TotalRevenue
FROM Orders o
JOIN Products p ON o.ProductID = p.ProductID
GROUP BY p.ProductName;
```

**Execution Steps:**
1. **JOIN Products p ON o.ProductID = p.ProductID:** Joins the `Orders` table with the `Products` table based on `ProductID`.
2. **SUM(o.Quantity * p.Price):** Calculates the total revenue for each product.
3. **GROUP BY p.ProductName:** Groups results by `ProductName` to aggregate the revenue.

**Generated Table:**
| ProductName | TotalRevenue |
|-------------|--------------|
| Laptop      | 150000.00    |
| Smartphone  | 25000.00     |
| Desk Chair  | 5000.00      |
| Monitor     | 24000.00     |
| Bookshelf   | 8000.00      |
| Tablet      | 24000.00     |
| Headphones  | 75000.00     |

### 4. Find the average price of products in each category with a condition and order the results.

**Explanation:**
- **Topic:** Using `GROUP BY`, `HAVING`, and `ORDER BY` clauses.
- **Query Explanation:** Calculate the average price of products in each category where the average price is greater than 15000, and order the results by average price.

**Query:**
```sql
SELECT 
    p.Category,
    AVG(p.Price) AS AveragePrice
FROM Products p
WHERE p.StockQuantity > 0
GROUP BY p.Category
HAVING AVG(p.Price) > 15000
ORDER BY AveragePrice ASC;
```

**Execution Steps:**
1. **FROM Products p:** Selects data from `Products` table.
2. **WHERE p.StockQuantity > 0:** Filters out products with zero stock.
3. **GROUP BY p.Category:** Groups results by `Category`.
4. **HAVING AVG(p.Price) > 15000:** Filters groups where the average price is greater than 15000.
5. **ORDER BY AveragePrice ASC:** Orders the results by average price in ascending order.

**Generated Table:**
| Category    | AveragePrice |
|-------------|--------------|
| Electronics | 20000.00     |

### 5. Correct a violation of using non-aggregated columns without grouping.

**Explanation:**
- **Topic:** Correcting SQL aggregation issues.
- **Query Explanation:** Aggregate functions must be used for columns that are not part of the `GROUP BY` clause.

**Query:**
```sql
SELECT 
    MAX(Category) AS Category,  -- Aggregate function for non-aggregated column
    AVG(Price) AS AveragePrice
FROM Products;
```

**Execution Steps:**
1. **FROM Products:** Selects data from `Products`.
2. **MAX(Category):** Finds the maximum category value.
3. **AVG(Price):** Computes the average price.

**Generated Table:**
| Category    | AveragePrice |
|-------------|--------------|
| Furniture   | 7750.00      |

### 6. Retrieve all customers who have placed more than 5 orders using GROUP BY and HAVING clauses.

**Explanation:**
- **Topic:** Using `GROUP BY` and `HAVING` for aggregation.
- **Query Explanation:** Find customers who have placed more than 5 orders.

**Query:**

```sql
SELECT 
    c.CustomerID,
    c.FirstName,
    c.LastName,
    COUNT(o.OrderID) AS OrderCount
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
HAVING COUNT(o.OrderID) > 0;
```

**Explanation:**

1. **`JOIN Customers c ON o.CustomerID = c.CustomerID`**: This joins the `Orders` table with the `Customers` table on the `CustomerID` field, ensuring that we are considering only those orders that have corresponding customer records.

2. **`GROUP BY c.CustomerID, c.FirstName, c.LastName`**: This groups the results by `CustomerID`, `FirstName`, and `LastName`. This means that the results will be aggregated for each customer based on these fields.

3. **`COUNT(o.OrderID) AS OrderCount`**: This counts the number of orders (`OrderID`) for each customer. The result is labeled as `OrderCount`.

4. **`HAVING COUNT(o.OrderID) > 0`**: This filters the grouped results to include only those customers who have placed more than 0 orders.

**Generated Table:**

| CustomerID | FirstName | LastName | OrderCount |
|------------|-----------|----------|------------|
| 1          | Amit      | Sharma   | 1          |
| 2          | Priya     | Mehta    | 1          |
| 3          | Rohit     | Kumar    | 1          |
| 4          | Neha      | Verma    | 1          |
| 5          | Siddharth | Singh    | 1          |
| 6          | Asha      | Rao      | 1          |
| 7          | Raj       | Patel    | 1          |

<br>

## Stored Procedures

### 7. Create a stored procedure to retrieve all customer details.
**Procedure:**
```sql
CREATE PROCEDURE GetAllCustomers
AS
BEGIN
    SELECT * FROM Customers;
END;
```

**Generated Table:**
Same as `Customers` table.

### 8. Create a stored procedure to get order details by OrderID.
**Procedure:**
```sql
CREATE PROCEDURE GetOrderDetailsByOrderID
    @OrderID INT
AS
BEGIN
    SELECT * FROM Orders WHERE OrderID = @OrderID;
END;
```

**Generated Table:**
**For OrderID = 1**
| OrderID | CustomerID | ProductID | Quantity | TotalAmount | OrderDate  |
|---------|------------|-----------|----------|-------------|------------|
| 1       | 1          | 1         | 2        | 150000.00   | 2024-08-01 |

### 9. Create a stored procedure to get products by category and price.
**Procedure:**
```sql
CREATE PROCEDURE GetProductsByCategoryAndPrice
    @Category VARCHAR(50),
    @MinPrice DECIMAL(10, 2)
AS
BEGIN
    SELECT * FROM Products 
    WHERE Category = @Category AND Price >= @MinPrice;
END;
```

**Generated Table:**
**For Category = 'Electronics' and MinPrice = 5000**
| ProductID | ProductName | Category    | Price   | StockQuantity |
|-----------|-------------|-------------|---------|---------------|
| 1         | Laptop      | Electronics | 75000.00| 15            |
| 2         | Smartphone  | Electronics | 25000.00| 30            |
| 4         | Monitor     | Electronics | 12000.00| 20            |
| 6         | Tablet      | Electronics | 20000.00| 12            |
| 7         | Headphones  | Electronics | 3000.00 | 25            |

### 10. Create a stored procedure to insert a new product.
**Procedure:**
```sql
CREATE PROCEDURE InsertNewProduct
    @ProductName VARCHAR(100),
    @Category VARCHAR(50),
    @Price DECIMAL(10, 2),
    @StockQuantity INT
AS
BEGIN
    INSERT INTO Products (ProductName, Category, Price, StockQuantity)
    VALUES (@ProductName, @Category, @Price, @StockQuantity);
END;
```

**Generated Table:**
**After Inserting: 'Keyboard', 'Electronics', 1500.00, 30**
| ProductID | ProductName | Category    | Price   | StockQuantity |
|-----------|-------------|-------------|---------|---------------|
| 8         | Keyboard    | Electronics | 1500.00 | 30            |

### 11. Create a stored procedure to update a customer's email.
**Procedure:**
```sql
CREATE PROCEDURE UpdateCustomerEmail
    @CustomerID INT,
    @NewEmail VARCHAR(100)
AS
BEGIN
    UPDATE Customers
    SET Email = @NewEmail
    WHERE CustomerID = @CustomerID;
END;
```

**Generated Table:**
**For CustomerID = 1**
**Updated Email to 'amit.new@example.com'**
| CustomerID | FirstName | LastName | Email                   | PhoneNumber |
|------------|-----------|----------|-------------------------|-------------|
| 1          | Amit      | Sharma   | amit.new@example.com    | 9876543210  |

### 12. Create a stored procedure to delete an order by OrderID.
**Procedure:**
```sql
CREATE PROCEDURE DeleteOrderByID
    @OrderID INT
AS
BEGIN
    DELETE FROM Orders
    WHERE OrderID = @OrderID;
END;
```

**Generated Table:**
**After Deleting OrderID = 1**
**Orders Table after deletion**
| OrderID | CustomerID | ProductID | Quantity | TotalAmount | OrderDate  |
|---------|------------|-----------|----------|-------------|------------|
| 2       | 2          | 2         | 1        | 25000.00    | 2024-08-02 |
| 3       | 3          | 3         | 1        | 5000.00     | 2024-08-03 |
| 4       | 4          | 2         | 2        | 24000.00    | 2024-08-04 |
| 5       | 5          | 5         | 1        | 8000.00     | 2024-08-05 |
| 6       | 6          | 2         | 2        | 12000.00    | 2024-08-06 |
| 7       | 7          | 7         | 1        | 20000.00    | 2024-08-07 |

### 13. Create a stored procedure to get total products in a category using an output parameter.
**Procedure:**
```sql
CREATE PROCEDURE GetTotalProductsInCategory
    @Category VARCHAR(50),
    @TotalProducts INT OUTPUT
AS
BEGIN
    SELECT @TotalProducts = COUNT(*)
    FROM Products
    WHERE Category = @Category;


END;
```

**Generated Table:**
**For Category = 'Electronics'**
| TotalProducts |
|---------------|
| 5             |

**Explanation:**
- **Procedure:** This retrieves the count of products in the given category and stores it in the `@TotalProducts` output parameter.


---

In SQL Server, stored procedures do not directly generate tables. Instead, they can return data through result sets or manipulate data in tables. Here's a detailed explanation of how stored procedures work and how you can view or use the results they produce.

### How Stored Procedures Work

1. **Definition:** A stored procedure is a precompiled collection of one or more SQL statements that can be executed as a single unit. It can perform various operations, such as querying data, updating tables, or managing other database tasks.

2. **Execution:** When a stored procedure is executed, it performs the operations defined within it and can return results or perform data manipulation.

3. **Returning Data:** Stored procedures can return data in the form of result sets. This means they can include `SELECT` statements to query and display data. The result of these `SELECT` statements is what you see when you execute the procedure.

4. **Output Parameters:** Stored procedures can also use output parameters to return values. These parameters allow the procedure to provide a single value back to the caller, such as a count or a status.

### Examples of Stored Procedure Output

Here’s how stored procedures are used to generate results and interact with tables:

#### Example 1: Retrieving Data

**Procedure to Get All Customers:**
```sql
CREATE PROCEDURE GetAllCustomers
AS
BEGIN
    SELECT * FROM Customers;
END;
```

**Execution and Result:**
When you execute this procedure, it retrieves all rows from the `Customers` table and returns them as a result set.

**Executing the Procedure:**
```sql
EXEC GetAllCustomers;
```

**Result Set (Generated Table):**
| CustomerID | FirstName | LastName | Email                   | PhoneNumber |
|------------|-----------|----------|-------------------------|-------------|
| 1          | Amit      | Sharma   | amit.sharma@example.com | 9876543210  |
| 2          | Priya     | Mehta    | priya.mehta@example.com | 8765432109  |
| ...        | ...       | ...      | ...                     | ...         |

#### Example 2: Using Output Parameters

**Procedure to Get Total Products in a Category:**
```sql
CREATE PROCEDURE GetTotalProductsInCategory
    @Category VARCHAR(50),
    @TotalProducts INT OUTPUT
AS
BEGIN
    SELECT @TotalProducts = COUNT(*)
    FROM Products
    WHERE Category = @Category;
END;
```

**Execution and Result:**
To use this procedure, you need to declare a variable to receive the output and then execute the procedure.

**Executing the Procedure:**
```sql
DECLARE @TotalProducts INT;
EXEC GetTotalProductsInCategory @Category = 'Electronics', @TotalProducts = @TotalProducts OUTPUT;
SELECT @TotalProducts AS TotalProducts;
```

**Result:**
The value of `@TotalProducts` will be the count of products in the 'Electronics' category. The result is a single value, not a table.

### Key Points:

- **Result Sets:** Stored procedures can return tables of data, which are displayed as result sets when the procedure is executed.
- **Output Parameters:** These allow procedures to return scalar values or aggregate results, which can be used in the calling environment.

Stored procedures themselves don't create tables but operate on existing tables and can return data or results based on the operations defined in them.
