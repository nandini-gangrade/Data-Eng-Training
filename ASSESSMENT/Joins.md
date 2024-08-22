# **Basics of Joins**

Joins in SQL are used to combine rows from two or more tables based on a related column between them. Understanding joins is crucial for querying data that is spread across multiple tables. Here are the basic types of joins:

1. **INNER JOIN**
   - **Definition:** Returns rows when there is a match in both tables.
   - **Usage:** Use this join when you want to fetch records that have matching values in both tables.

2. **LEFT JOIN (or LEFT OUTER JOIN)**
   - **Definition:** Returns all rows from the left table and the matched rows from the right table. If there is no match, NULL values are returned for columns from the right table.
   - **Usage:** Use this join to get all records from the left table, even if there are no matches in the right table.

3. **RIGHT JOIN (or RIGHT OUTER JOIN)**
   - **Definition:** Returns all rows from the right table and the matched rows from the left table. If there is no match, NULL values are returned for columns from the left table.
   - **Usage:** Use this join to get all records from the right table, even if there are no matches in the left table.

4. **FULL JOIN (or FULL OUTER JOIN)**
   - **Definition:** Returns rows when there is a match in one of the tables. Returns all rows from both tables, with NULLs in places where the other table does not have a match.
   - **Usage:** Use this join to get all records from both tables, with NULLs where there is no match.

5. **SELF JOIN**
   - **Definition:** A regular join, but the table is joined with itself.
   - **Usage:** Use this join to find relationships within the same table, such as employees who work in the same department.

## Table
We need to create the following tables: `Customers`, `Orders`, `Products`, `Employees`, and `Departments`. Then, we will insert sample data into these tables.

### **1. Create Tables**

```sql
-- Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2)
);

-- Employees Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Departments Table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);
```

### **2. Insert Sample Data**

```sql
-- Insert data into Customers
INSERT INTO Customers (CustomerID, CustomerName)
VALUES (1, 'Alice'), (2, 'Bob'), (3, 'Charlie'), (4, 'Diana'), (5, 'Eve');

-- Insert data into Products
INSERT INTO Products (ProductID, ProductName, Category, Price)
VALUES (1, 'Laptop', 'Electronics', 50000.00),
       (2, 'Phone', 'Electronics', 20000.00),
       (3, 'Tablet', 'Electronics', 15000.00),
       (4, 'Monitor', 'Accessories', 10000.00),
       (5, 'Keyboard', 'Accessories', 2000.00);

-- Insert data into Orders
INSERT INTO Orders (OrderID, CustomerID, ProductID, Quantity)
VALUES (1, 1, 1, 1),
       (2, 2, 2, 2),
       (3, 3, 3, 1),
       (4, 4, 4, 1),
       (5, 5, 5, 3);

-- Insert data into Employees
INSERT INTO Employees (EmployeeID, EmployeeName, DepartmentID)
VALUES (1, 'John', 1), (2, 'Jane', 2), (3, 'Doe', 1), (4, 'Emily', 3), (5, 'Frank', 2);

-- Insert data into Departments
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES (1, 'HR'), (2, 'IT'), (3, 'Finance');
```

### **1. Customers Table**

**Output Table:**

| **CustomerID** | **CustomerName** |
|----------------|-------------------|
| 1              | Alice             |
| 2              | Bob               |
| 3              | Charlie           |
| 4              | Diana             |
| 5              | Eve               |

### **2. Products Table**

**Output Table:**

| **ProductID** | **ProductName** | **Category**  | **Price** |
|---------------|-----------------|---------------|-----------|
| 1             | Laptop          | Electronics   | 50000.00  |
| 2             | Phone           | Electronics   | 20000.00  |
| 3             | Tablet          | Electronics   | 15000.00  |
| 4             | Monitor         | Accessories   | 10000.00  |
| 5             | Keyboard        | Accessories   | 2000.00   |

### **3. Orders Table**

**Output Table:**

| **OrderID** | **CustomerID** | **ProductID** | **Quantity** |
|-------------|----------------|---------------|--------------|
| 1           | 1              | 1             | 1            |
| 2           | 2              | 2             | 2            |
| 3           | 3              | 3             | 1            |
| 4           | 4              | 4             | 1            |
| 5           | 5              | 5             | 3            |

### **4. Employees Table**

**Output Table:**

| **EmployeeID** | **EmployeeName** | **DepartmentID** |
|----------------|-------------------|------------------|
| 1              | John              | 1                |
| 2              | Jane              | 2                |
| 3              | Doe               | 1                |
| 4              | Emily             | 3                |
| 5              | Frank             | 2                |

### **5. Departments Table**

**Output Table:**

| **DepartmentID** | **DepartmentName** |
|------------------|---------------------|
| 1                | HR                  |
| 2                | IT                  |
| 3                | Finance             |

These tables reflect the sample data that has been inserted for the exercises.

## **Join Exercises**

#### **1. Write a query to join the Customers and Orders tables to display customer names and their order details.**

```sql
SELECT Customers.CustomerName, Orders.OrderID, Orders.ProductID, Orders.Quantity
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID;
```

**Output Table:**

| **CustomerName** | **OrderID** | **ProductID** | **Quantity** |
|------------------|-------------|---------------|--------------|
| Alice            | 1           | 1             | 1            |
| Bob              | 2           | 2             | 2            |
| Charlie          | 3           | 3             | 1            |
| Diana            | 4           | 4             | 1            |
| Eve              | 5           | 5             | 3            |

**Explanation:**
Is query mein `Customers` aur `Orders` tables ko `CustomerID` ke saath join kiya gaya hai. Isse hume customer ke naam aur unke order details milte hain.

---

#### **2. Perform an inner join between Products and Orders to retrieve product names and quantities sold.**

```sql
SELECT Products.ProductName, Orders.Quantity
FROM Products
INNER JOIN Orders ON Products.ProductID = Orders.ProductID;
```

**Output Table:**

| **ProductName** | **Quantity** |
|-----------------|--------------|
| Laptop          | 1            |
| Phone           | 2            |
| Tablet          | 1            |
| Monitor         | 1            |
| Keyboard        | 3            |

**Explanation:**
Yahaan `Products` aur `Orders` tables ko `ProductID` ke saath inner join kiya gaya hai. Isse hume products ke naam aur unki sold quantities milti hain.

---

#### **3. Use a left join to display all products, including those that have not been ordered.**

```sql
SELECT Products.ProductName, Orders.Quantity
FROM Products
LEFT JOIN Orders ON Products.ProductID = Orders.ProductID;
```

**Output Table:**

| **ProductName** | **Quantity** |
|-----------------|--------------|
| Laptop          | 1            |
| Phone           | 2            |
| Tablet          | 1            |
| Monitor         | 1            |
| Keyboard        | 3            |

**Explanation:**
Is query mein `Products` table ko `Orders` table ke saath `LEFT JOIN` kiya gaya hai. Yeh join sabhi products ko dikhata hai, chahe unka order hua ho ya nahi. 

---

#### **4. Write a query to join Employees with Departments and list employee names and their respective department names.**

```sql
SELECT Employees.EmployeeName, Departments.DepartmentName
FROM Employees
JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;
```

**Output Table:**

| **EmployeeName** | **DepartmentName** |
|------------------|---------------------|
| John             | HR                  |
| Jane             | IT                  |
| Doe              | HR                  |
| Emily            | Finance             |
| Frank            | IT                  |

**Explanation:**
Is query mein `Employees` aur `Departments` tables ko `DepartmentID` ke saath join kiya gaya hai. Yeh join employee ke naam aur unke respective department names ko dikhata hai.

---

#### **5. Perform a self-join on an Employees table to show pairs of employees who work in the same department.**

```sql
SELECT A.EmployeeName AS Employee1, B.EmployeeName AS Employee2
FROM Employees A
JOIN Employees B ON A.DepartmentID = B.DepartmentID
WHERE A.EmployeeID <> B.EmployeeID;
```

**Output Table:**

| **Employee1** | **Employee2** |
|---------------|---------------|
| John          | Doe           |
| Doe           | John          |
| Jane          | Frank         |
| Frank         | Jane          |

**Explanation:**
Yahaan `Employees` table ka self-join kiya gaya hai taaki same department mein kaam kar rahe employees ke pairs ko dikhaya ja sake. `A.EmployeeID <> B.EmployeeID` condition yeh ensure karti hai ki employee apne aap se join na ho.
