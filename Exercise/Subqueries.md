### **1. Products Table**

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

**Output Table:**

| **DepartmentID** | **DepartmentName** |
|------------------|--------------------|
| 1                | HR                 |
| 2                | IT                 |
| 3                | Finance            |

---

### **Subquery Exercises**

#### 1. Find products whose price is higher than the average price of all products.

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

#### 2. Retrieve customer names who have placed at least one order by using a subquery.

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

#### 3. Find the top 3 most expensive products using a subquery.

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

#### 4. List all employees whose salary is higher than the average salary of their department.

**Query:**
```sql
SELECT EmployeeName, Salary
FROM Employees e
WHERE Salary > (SELECT AVG(Salary) FROM Employees WHERE DepartmentID = e.DepartmentID);
```

**Output Table:**

| **EmployeeName** | **Salary** |
|------------------|------------|
| Jane             | 80000.00   |
| Emily            | 90000.00   |
| Frank            | 85000.00   |

#### 5. Use a correlated subquery to find employees who earn more than the average salary of all employees in their department.

**Query:**
```sql
SELECT EmployeeName, Salary
FROM Employees e1
WHERE Salary > (SELECT AVG(Salary) FROM Employees e2 WHERE e1.DepartmentID = e2.DepartmentID);
```

**Output Table:**

| **EmployeeName** | **Salary** |
|------------------|------------|
| Jane             | 80000.00   |
| Emily            | 90000.00   |
| Frank            | 85000.00   |
