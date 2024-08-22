# **Products Table:**

| **ProductID** | **ProductName** | **Category** | **CustomerName** |
|---------------|-----------------|--------------|------------------|
| 1             | Smartphone       | Electronics  | Nandini          |
| 2             | Laptop           | Computers    | Rahul            |
| 3             | Headphones       | Accessories  | Priya            |
| 4             | Television       | Electronics  | Aman             |
| 5             | Tablet           | Computers    | Simran           |

---

### 1. Convert all customer names to uppercase.

#### Query:
```sql
SELECT UPPER(CustomerName) AS Uppercase_CustomerName FROM Products;
```

#### Output:

| **Uppercase_CustomerName** |
|----------------------------|
| NANDINI                    |
| RAHUL                      |
| PRIYA                      |
| AMAN                       |
| SIMRAN                     |

---

### 2. Extract the first 5 characters of each product name.

#### Query:
```sql
SELECT SUBSTRING(ProductName, 1, 5) AS Product_Prefix FROM Products;
```

#### Output:

| **Product_Prefix** |
|--------------------|
| Smart              |
| Lapto              |
| Headp              |
| Telev              |
| Table              |

---

### 3. Concatenate the product name and category with a hyphen in between.

#### Query:
```sql
SELECT CONCAT(ProductName, '-', Category) AS Product_Category FROM Products;
```

#### Output:

| **Product_Category**     |
|--------------------------|
| Smartphone-Electronics   |
| Laptop-Computers         |
| Headphones-Accessories   |
| Television-Electronics   |
| Tablet-Computers         |

---

### 4. Replace the word 'Phone' with 'Device' in all product names.

#### Query:
```sql
SELECT REPLACE(ProductName, 'Phone', 'Device') AS Updated_ProductName FROM Products;
```

#### Output:

| **Updated_ProductName** |
|-------------------------|
| SmartDevice             |
| Laptop                  |
| HeadDevice              |
| Television              |
| Tablet                  |

---

### 5. Find the position of the letter 'a' in customer names.

#### Query:
```sql
SELECT CustomerName, POSITION('a' IN CustomerName) AS Position_Of_A FROM Products;
```

#### Output:

| **CustomerName** | **Position_Of_A** |
|------------------|-------------------|
| Nandini          | 2                 |
| Rahul            | 2                 |
| Priya            | 4                 |
| Aman             | 1                 |
| Simran           | 5                 |
