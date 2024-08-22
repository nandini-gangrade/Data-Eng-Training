# Joins Exercise

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

---
 
### **1. Write a query to join the Customers and Orders tables to display customer names and their order details.**

**Query:**
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

---

### **2. Perform an inner join between Products and Orders to retrieve product names and quantities sold.**

**Query:**
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

---

### **3. Use a left join to display all products, including those that have not been ordered.**

**Query:**
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

---

### **4. Write a query to join Employees with Departments and list employee names and their respective department names.**

**Query:**
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

---

### **5. Perform a self-join on an Employees table to show pairs of employees who work in the same department.**

**Query:**
```sql
SELECT E1.EmployeeName AS Employee1, E2.EmployeeName AS Employee2
FROM Employees E1
JOIN Employees E2 ON E1.DepartmentID = E2.DepartmentID AND E1.EmployeeID <> E2.EmployeeID;
```

**Output Table:**

| **Employee1** | **Employee2** |
|---------------|---------------|
| John          | Doe           |
| Doe           | John          |
| Jane          | Frank         |
| Frank         | Jane          |
