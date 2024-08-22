## Tables

#### 1. `Customers` Table

| **CustomerID** | **CustomerName** |
|----------------|------------------|
| 1              | Alice            |
| 2              | Bob              |
| 3              | Charlie          |
| 4              | David            |
| 5              | Eve              |
| 6              | Frank            |

#### 2. `Orders` Table

| **OrderID** | **CustomerID** | **OrderDate** |
|-------------|----------------|---------------|
| 1           | 1              | 2024-08-01    |
| 2           | 2              | 2024-08-05    |
| 3           | 1              | 2024-08-10    |
| 4           | 3              | 2024-08-15    |
| 5           | 2              | 2024-08-20    |
| 6           | 4              | 2024-08-25    |
| 7           | 5              | 2024-08-30    |
| 8           | 6              | 2024-08-28    |

#### 3. `Products` Table

Ensure some products belong to different categories and overlap with orders.

| **ProductID** | **ProductName** | **CategoryID** |
|---------------|-----------------|----------------|
| 1             | Smartphone      | 1              |
| 2             | Laptop          | 1              |
| 3             | Headphones      | 2              |
| 4             | Charger         | 2              |
| 5             | Tablet          | 1              |
| 6             | Camera          | 1              |
| 7             | USB Drive       | 2              |

#### 4. `Categories` Table

| **CategoryID** | **CategoryName** |
|----------------|------------------|
| 1              | Electronics      |
| 2              | Accessories      |

---

## Set Operations Exercise

#### 1. Combine the results of two queries that return the names of customers from different tables using `UNION`.

**Query:**

```sql
SELECT CustomerName FROM Customers
UNION
SELECT DISTINCT CustomerName FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;
```

**Output Table:**

| **CustomerName** |
|------------------|
| Alice            |
| Bob              |
| Charlie          |
| David            |
| Eve              |
| Frank            |

#### 2. Find products that are in both the Electronics and Accessories categories using `INTERSECT`.

**Query:**

```sql
SELECT ProductName FROM Products
WHERE CategoryID = 1
INTERSECT
SELECT ProductName FROM Products
WHERE CategoryID = 2;
```

**Output Table:**

| **ProductName** |
|-----------------|
| (Empty Result)  |

*No products belong to both categories.*

#### 3. Find products that are in the Electronics category but not in the Accessories category using `EXCEPT`.

**Query:**

```sql
SELECT ProductName FROM Products
WHERE CategoryID = 1
EXCEPT
SELECT ProductName FROM Products
WHERE CategoryID = 2;
```

**Output Table:**

| **ProductName** |
|-----------------|
| Smartphone      |
| Laptop          |
| Tablet          |
| Camera          |

This output table provides the products in the Electronics category that are not in the Accessories category.
