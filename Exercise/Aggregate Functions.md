## **Table Overview**

| **OrderID** | **ProductName** | **Category**  | **Quantity** | **Price** | **OrderDate** | **StockQuantity** |
|-------------|-----------------|---------------|--------------|-----------|---------------|-------------------|
| 1           | Smartphone       | Electronics   | 2            | 20000.00  | 2023-07-15    | 100               |
| 2           | Laptop           | Computers     | 1            | 50000.00  | 2023-07-17    | 50                |
| 3           | Headphones       | Accessories   | 5            | 2000.00   | 2023-08-01    | 200               |
| 4           | Television       | Electronics   | 1            | 30000.00  | 2023-08-02    | 30                |
| 5           | Tablet           | Computers     | 3            | 15000.00  | 2023-08-05    | 70                |

---

### **1. Calculate the total sales amount for all orders**

#### **Query:**
```sql
SELECT SUM(Quantity * Price) AS Total_Sales_Amount FROM Orders;
```

#### **Output Table:**

| **Total_Sales_Amount** |
|------------------------|
| 145000.00              |

---

### **2. Find the average price of products in each category**

#### **Query:**
```sql
SELECT Category, AVG(Price) AS Average_Price FROM Orders GROUP BY Category;
```

#### **Output Table:**

| **Category**  | **Average_Price** |
|---------------|-------------------|
| Accessories   | 2000.00           |
| Computers     | 32500.00          |
| Electronics   | 25000.00          |

---

### **3. Count the number of orders placed in each month of the year**

#### **Query:**
```sql
SELECT MONTH(OrderDate) AS Order_Month, COUNT(OrderID) AS Number_Of_Orders
FROM Orders
GROUP BY MONTH(OrderDate);
```

#### **Output Table:**

| **Order_Month** | **Number_Of_Orders** |
|-----------------|----------------------|
| 7               | 2                    |
| 8               | 3                    |

---

### **4. Find the maximum and minimum order quantities**

#### **Query:**
```sql
SELECT MAX(Quantity) AS Max_Quantity, MIN(Quantity) AS Min_Quantity FROM Orders;
```

#### **Output Table:**

| **Max_Quantity** | **Min_Quantity** |
|------------------|------------------|
| 5                | 1                |

---

### **5. Calculate the sum of stock quantities grouped by product category**

#### **Query:**
```sql
SELECT Category, SUM(StockQuantity) AS Total_Stock FROM Orders GROUP BY Category;
```

#### **Output Table:**

| **Category**  | **Total_Stock** |
|---------------|-----------------|
| Accessories   | 200             |
| Computers     | 120             |
| Electronics   | 130             |
