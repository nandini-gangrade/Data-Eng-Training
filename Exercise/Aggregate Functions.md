## **Basics of Aggregate Functions**

Aggregate functions in SQL are used to perform calculations on multiple rows of a table's column and return a single value. The most commonly used aggregate functions are:
- `SUM()`: Calculates the sum of a numeric column.
- `AVG()`: Calculates the average value of a numeric column.
- `COUNT()`: Counts the number of rows or non-null values.
- `MAX()`: Returns the maximum value in a column.
- `MIN()`: Returns the minimum value in a column.

These functions are crucial for summarizing data, which is commonly needed in data analysis.

---

### **Creating the Table**

Let's create a table named `Orders` that will store order details.

```sql
CREATE TABLE Orders (
    OrderID INT,
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    Quantity INT,
    Price DECIMAL(10, 2),
    OrderDate DATE,
    StockQuantity INT
);
```

#### **Inserting Values**

Now, let's insert some rows into the `Orders` table.

```sql
INSERT INTO Orders (OrderID, ProductName, Category, Quantity, Price, OrderDate, StockQuantity)
VALUES
(1, 'Smartphone', 'Electronics', 2, 20000.00, '2023-07-15', 100),
(2, 'Laptop', 'Computers', 1, 50000.00, '2023-07-17', 50),
(3, 'Headphones', 'Accessories', 5, 2000.00, '2023-08-01', 200),
(4, 'Television', 'Electronics', 1, 30000.00, '2023-08-02', 30),
(5, 'Tablet', 'Computers', 3, 15000.00, '2023-08-05', 70);
```

#### **Table Overview**

| **OrderID** | **ProductName** | **Category**  | **Quantity** | **Price** | **OrderDate** | **StockQuantity** |
|-------------|-----------------|---------------|--------------|-----------|---------------|-------------------|
| 1           | Smartphone       | Electronics   | 2            | 20000.00  | 2023-07-15    | 100               |
| 2           | Laptop           | Computers     | 1            | 50000.00  | 2023-07-17    | 50                |
| 3           | Headphones       | Accessories   | 5            | 2000.00   | 2023-08-01    | 200               |
| 4           | Television       | Electronics   | 1            | 30000.00  | 2023-08-02    | 30                |
| 5           | Tablet           | Computers     | 3            | 15000.00  | 2023-08-05    | 70                |

---

## **Aggregate Function Exercises**

#### 1. **Calculate the total sales amount for all orders**

##### **Query:**
```sql
SELECT SUM(Quantity * Price) AS Total_Sales_Amount FROM Orders;
```

##### **Explanation:**
Is query mein humne `SUM()` function use kiya hai total sales amount nikalne ke liye. Humne `Quantity` aur `Price` ko multiply karke sum liya hai sab orders ka. Ye hume total revenue ya sales amount batata hai.

##### **Output Table:**

| **Total_Sales_Amount** |
|------------------------|
| 145000.00              |

---

#### 2. **Find the average price of products in each category**

##### **Query:**
```sql
SELECT Category, AVG(Price) AS Average_Price FROM Orders GROUP BY Category;
```

##### **Explanation:**
Yahaan `AVG()` function use kiya gaya hai har category ka average price nikalne ke liye. `GROUP BY` clause se humne data ko category-wise group kiya, taaki har category ka alag average price nikal sake.

##### **Output Table:**

| **Category**  | **Average_Price** |
|---------------|-------------------|
| Accessories   | 2000.00           |
| Computers     | 32500.00          |
| Electronics   | 25000.00          |

---

#### 3. **Count the number of orders placed in each month of the year**

##### **Query:**
```sql
SELECT MONTH(OrderDate) AS Order_Month, COUNT(OrderID) AS Number_Of_Orders
FROM Orders
GROUP BY MONTH(OrderDate);
```

##### **Explanation:**
Is query mein humne `COUNT()` function use kiya hai orders ki total count nikalne ke liye, month-wise. `MONTH()` function use karke humne month extract kiya aur `GROUP BY` se data ko month-wise group kiya.

##### **Output Table:**

| **Order_Month** | **Number_Of_Orders** |
|-----------------|----------------------|
| 7               | 2                    |
| 8               | 3                    |

---

#### 4. **Find the maximum and minimum order quantities**

##### **Query:**
```sql
SELECT MAX(Quantity) AS Max_Quantity, MIN(Quantity) AS Min_Quantity FROM Orders;
```

##### **Explanation:**
Yahaan `MAX()` aur `MIN()` functions use kiye gaye hain maximum aur minimum order quantities nikalne ke liye. Ye query hume bataati hai ki kisi bhi product ke liye maximum aur minimum orders kitne place hue hain.

##### **Output Table:**

| **Max_Quantity** | **Min_Quantity** |
|------------------|------------------|
| 5                | 1                |

---

#### 5. **Calculate the sum of stock quantities grouped by product category**

##### **Query:**
```sql
SELECT Category, SUM(StockQuantity) AS Total_Stock FROM Orders GROUP BY Category;
```

##### **Explanation:**
Is query mein humne `SUM()` function use kiya hai total stock nikalne ke liye, category-wise. `GROUP BY` clause se humne data ko category-wise group kiya taaki har category ka total stock nikal sake.

##### **Output Table:**

| **Category**  | **Total_Stock** |
|---------------|-----------------|
| Accessories   | 200             |
| Computers     | 120             |
| Electronics   | 130             |
