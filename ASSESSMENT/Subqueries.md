### **Basics and Understanding of Subqueries**

**Subqueries** are queries nested inside another query. They are used to retrieve data that will be used in the outer query. Subqueries can be used in various SQL statements such as `SELECT`, `INSERT`, `UPDATE`, and `DELETE`. 

Here are the key concepts:

1. **Subquery Types:**
   - **Scalar Subquery:** Returns a single value.
   - **Row Subquery:** Returns a single row with multiple columns.
   - **Column Subquery:** Returns a single column with multiple rows.
   - **Table Subquery:** Returns multiple rows and columns.

2. **Types of Subqueries:**
   - **Non-Correlated Subquery:** Can be executed independently of the outer query.
   - **Correlated Subquery:** Depends on the outer query and is executed repeatedly for each row of the outer query.

3. **Common Uses:**
   - **Filtering Data:** To filter records based on conditions from another table.
   - **Aggregating Data:** To perform aggregations like finding averages or totals.
   - **Comparing Values:** To compare values within the same table or between different tables.

### Tables

### **1. Products Table**

**Table Structure:**
```sql
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10, 2)
);
```

**Inserted Data:**
```sql
INSERT INTO Products (ProductID, ProductName, Price) VALUES
(1, 'Laptop', 1000.00),
(2, 'Phone', 500.00),
(3, 'Tablet', 300.00),
(4, 'Monitor', 150.00),
(5, 'Keyboard', 50.00);
```

**Output Table:**

| **ProductID** | **ProductName** | **Price** |
|---------------|-----------------|-----------|
| 1             | Laptop          | 1000.00   |
| 2             | Phone           | 500.00    |
| 3             | Tablet          | 300.00    |
| 4             | Monitor         | 150.00    |
| 5             | Keyboard        | 50.00     |

---

### **2. Customers Table**

**Table Structure:**
```sql
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);
```

**Inserted Data:**
```sql
INSERT INTO Customers (CustomerID, CustomerName) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'Diana'),
(5, 'Eve');
```

**Output Table:**

| **CustomerID** | **CustomerName** |
|----------------|------------------|
| 1              | Alice            |
| 2              | Bob              |
| 3              | Charlie          |
| 4              | Diana            |
| 5              | Eve              |

---

### **3. Orders Table**

**Table Structure:**
```sql
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
```

**Inserted Data:**
```sql
INSERT INTO Orders (OrderID, CustomerID, ProductID, Quantity) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 1),
(4, 4, 4, 1),
(5, 5, 5, 3);
```

**Output Table:**

| **OrderID** | **CustomerID** | **ProductID** | **Quantity** |
|-------------|----------------|---------------|--------------|
| 1           | 1              | 1             | 1            |
| 2           | 2              | 2             | 2            |
| 3           | 3              | 3             | 1            |
| 4           | 4              | 4             | 1            |
| 5           | 5              | 5             | 3            |

---

### **4. Employees Table**

**Table Structure:**
```sql
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Salary DECIMAL(10, 2),
    DepartmentID INT
);
```

**Inserted Data:**
```sql
INSERT INTO Employees (EmployeeID, EmployeeName, Salary, DepartmentID) VALUES
(1, 'John', 70000, 1),
(2, 'Jane', 80000, 2),
(3, 'Doe', 75000, 1),
(4, 'Emily', 90000, 3),
(5, 'Frank', 85000, 2);
```

**Output Table:**

| **EmployeeID** | **EmployeeName** | **Salary** | **DepartmentID** |
|----------------|------------------|------------|------------------|
| 1              | John             | 70000.00   | 1                |
| 2              | Jane             | 80000.00   | 2                |
| 3              | Doe              | 75000.00   | 1                |
| 4              | Emily            | 90000.00   | 3                |
| 5              | Frank            | 85000.00   | 2                |

---

### **5. Departments Table**

**Table Structure:**
```sql
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);
```

**Inserted Data:**
```sql
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');
```

**Output Table:**

| **DepartmentID** | **DepartmentName** |
|------------------|--------------------|
| 1                | HR                 |
| 2                | IT                 |
| 3                | Finance            |

These tables will be used for the subquery exercises.

### **Subquery Exercises**

#### **1. Write a query to find products whose price is higher than the average price of all products.**

**Query:**
```sql
SELECT ProductName, Price
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);
```

**Output Table:**

| **ProductName** | **Price** |
|-----------------|-----------|
| Laptop          | 1000.00   |
| Phone           | 500.00    |

*Explanation:* Here, we use a scalar subquery `(SELECT AVG(Price) FROM Products)` to get the average price of all products and then filter products with prices above this average.

#### **2. Retrieve customer names who have placed at least one order by using a subquery.**

**Query:**
```sql
SELECT CustomerName
FROM Customers
WHERE CustomerID IN (SELECT DISTINCT CustomerID FROM Orders);
```

**Output Table:**

| **CustomerName** |
|------------------|
| Alice            |
| Bob              |
| Charlie          |
| Diana            |
| Eve              |

*Explanation:* This query uses a subquery to find `CustomerID`s that have at least one order and retrieves corresponding customer names.

#### **3. Find the top 3 most expensive products using a subquery.**

**Query:**
```sql
SELECT ProductName, Price
FROM Products
WHERE Price IN (SELECT DISTINCT Price FROM Products ORDER BY Price DESC LIMIT 3);
```

**Output Table:**

| **ProductName** | **Price** |
|-----------------|-----------|
| Laptop          | 1000.00   |
| Phone           | 500.00    |
| Tablet          | 300.00    |

*Explanation:* The subquery retrieves the top 3 distinct prices from the `Products` table, and the main query selects products with these prices.

#### **4. Write a query to list all employees whose salary is higher than the average salary of their department.**

**Query:**
```sql
SELECT EmployeeName, Salary
FROM Employees E1
WHERE Salary > (SELECT AVG(Salary) FROM Employees E2 WHERE E1.DepartmentID = E2.DepartmentID);
```

**Output Table:**

| **EmployeeName** | **Salary** |
|------------------|------------|
| Jane             | 80000.00   |
| Emily            | 90000.00   |
| Frank            | 85000.00   |

*Explanation:* The subquery computes the average salary for each department, and the main query selects employees with salaries above the average for their department.

#### **5. Use a correlated subquery to find employees who earn more than the average salary of all employees in their department.**

**Query:**
```sql
SELECT EmployeeName, Salary
FROM Employees E1
WHERE Salary > (SELECT AVG(Salary) FROM Employees E2 WHERE E1.DepartmentID = E2.DepartmentID);
```

**Output Table:**

| **EmployeeName** | **Salary** |
|------------------|------------|
| Jane             | 80000.00   |
| Emily            | 90000.00   |
| Frank            | 85000.00   |

*Explanation:* This correlated subquery compares each employee’s salary to the average salary of their own department.
