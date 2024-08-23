## Tables

### **1. Orders Table**

| **OrderID** | **CustomerID** | **ProductID** | **Quantity** | **OrderDate** |
|-------------|----------------|---------------|--------------|---------------|
| 1           | 1              | 1             | 2            | 2024-07-10    |
| 2           | 2              | 2             | 1            | 2024-07-15    |
| 3           | 1              | 3             | 5            | 2024-07-20    |
| 4           | 3              | 1             | 1            | 2024-07-25    |
| 5           | 4              | 2             | 3            | 2024-07-30    |

---

### **2. Products Table**

| **ProductID** | **ProductName** | **Price** | **CategoryID** |
|---------------|-----------------|-----------|----------------|
| 1             | Laptop          | 1000.00   | 1              |
| 2             | Phone           | 500.00    | 2              |
| 3             | Tablet          | 300.00    | 1              |
| 4             | Monitor         | 150.00    | 3              |
| 5             | Keyboard        | 50.00     | 2              |

---

### **3. Categories Table**

| **CategoryID** | **CategoryName** |
|----------------|------------------|
| 1              | Electronics      |
| 2              | Accessories      |
| 3              | Peripherals      |

---

## **Grouping and Summarizing Data Exercises**:

### **1. Group Orders by Customer and Calculate Total Amount Spent by Each Customer**

**Query:**

```sql
SELECT CustomerID, SUM(Quantity * Price) AS TotalAmountSpent
FROM Orders
JOIN Products ON Orders.ProductID = Products.ProductID
GROUP BY CustomerID;
```

**Output Table:**

| **CustomerID** | **TotalAmountSpent** |
|----------------|-----------------------|
| 1              | 3100.00               |
| 2              | 500.00                |
| 3              | 1000.00               |
| 4              | 1500.00               |

### **2. Group Products by Category and Calculate the Average Price for Each Category**

**Query:**

```sql
SELECT CategoryID, AVG(Price) AS AveragePrice
FROM Products
GROUP BY CategoryID;
```

**Output Table:**

| **CategoryID** | **AveragePrice** |
|----------------|------------------|
| 1              | 650.00           |
| 2              | 275.00           |
| 3              | 150.00           |

### **3. Group Orders by Month and Calculate the Total Sales for Each Month**

**Query:**

```sql
SELECT FORMAT(OrderDate, 'yyyy-MM') AS Month, 
       SUM(p.Price * o.Quantity) AS TotalSales
FROM Ordersss o
JOIN Productss p ON o.ProductID = p.ProductID
GROUP BY FORMAT(OrderDate, 'yyyy-MM');
```

**Output Table:**

| **OrderMonth** | **TotalSales** |
|----------------|----------------|
| 7              | 5100.00        |

### **4. Group Products by Category and Calculate the Number of Products in Each Category**

**Query:**

```sql
SELECT CategoryID, COUNT(ProductID) AS NumberOfProducts
FROM Products
GROUP BY CategoryID;
```

**Output Table:**

| **CategoryID** | **NumberOfProducts** |
|----------------|-----------------------|
| 1              | 2                     |
| 2              | 2                     |
| 3              | 1                     |

### **5. Use the HAVING Clause to Filter Groups of Customers Who Have Placed More Than 5 Orders**

**Query:**

```sql
SELECT CustomerID, COUNT(OrderID) AS NumberOfOrders
FROM Orders
GROUP BY CustomerID
HAVING COUNT(OrderID) > 5;
```

**Output Table:**

| **CustomerID** | **NumberOfOrders** |
|----------------|---------------------|
| (No results)   | (No customers with more than 5 orders) |

The output tables and queries provided will allow you to analyze and summarize data effectively using SQL.
