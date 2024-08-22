# String Function Exercises

Before diving into the exercises, it's essential to understand the basic SQL string functions that will be used in this exercise:

### **Basic SQL String Functions:**
- **`UPPER()`**: Converts a string to uppercase.
- **`SUBSTRING()` or `SUBSTR()`**: Extracts a substring from a string.
- **`CONCAT()`**: Concatenates two or more strings together.
- **`REPLACE()`**: Replaces occurrences of a specified string with another string.
- **`POSITION()` or `INSTR()`**: Finds the position of a substring within a string.

### **Explanation of Commands:**

1. **`UPPER(column_name)`**: Converts all characters in the specified column to uppercase.
   - *Example*: If `CustomerName` is "John", `UPPER(CustomerName)` will return "JOHN".
  
2. **`SUBSTRING(column_name, start_position, length)`**: Extracts a substring from the specified column starting at `start_position` and continuing for `length` characters.
   - *Example*: If `ProductName` is "Laptop", `SUBSTRING(ProductName, 1, 3)` will return "Lap".
  
3. **`CONCAT(string1, string2, ...)`**: Combines multiple strings into one.
   - *Example*: `CONCAT('Product-', 'Category')` will return "Product-Category".
  
4. **`REPLACE(column_name, 'old_string', 'new_string')`**: Replaces all occurrences of `old_string` in the specified column with `new_string`.
   - *Example*: If `ProductName` is "Smartphone", `REPLACE(ProductName, 'Phone', 'Device')` will return "SmartDevice".
  
5. **`POSITION('substring' IN column_name)`**: Returns the position of the first occurrence of `substring` within the specified column.
   - *Example*: If `CustomerName` is "Anjali", `POSITION('a' IN CustomerName)` will return 2 (the position of the first 'a').

---

## **Creating the Table:**

```sql
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    CustomerName VARCHAR(100)
);

INSERT INTO Products (ProductID, ProductName, Category, CustomerName) VALUES
(1, 'Smartphone', 'Electronics', 'Nandini'),
(2, 'Laptop', 'Computers', 'Rahul'),
(3, 'Headphones', 'Accessories', 'Priya'),
(4, 'Television', 'Electronics', 'Aman'),
(5, 'Tablet', 'Computers', 'Simran');
```

### **Products Table:**

| **ProductID** | **ProductName** | **Category** | **CustomerName** |
|---------------|-----------------|--------------|------------------|
| 1             | Smartphone       | Electronics  | Nandini          |
| 2             | Laptop           | Computers    | Rahul            |
| 3             | Headphones       | Accessories  | Priya            |
| 4             | Television       | Electronics  | Aman             |
| 5             | Tablet           | Computers    | Simran           |

---

## String Function Exercises

### 1. Convert all customer names to uppercase.

#### Query:
```sql
SELECT UPPER(CustomerName) AS Uppercase_CustomerName FROM Products;
```

#### Explanation:
- *Humne `UPPER()` function use kiya hai taaki saare customer names ko uppercase mein convert kiya ja sake.*
- *Isse humein ye pata chalta hai ki SQL kaise strings ke saath case manipulation kar sakta hai.*

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

#### Explanation:
- *`SUBSTRING()` function ka use karke humne product name ke first 5 characters extract kiye hain.*
- *Yeh useful hota hai jab humein sirf kisi string ka ek specific part chahiye hota hai.*

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

#### Explanation:
- *Humne `CONCAT()` function use kiya hai taaki product name aur category ko combine karke ek nayi string ban sake.*
- *Yeh kaafi helpful hota hai jab humein multiple columns ko combine karna ho.*

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

#### Explanation:
- *`REPLACE()` function ka use karke humne `ProductName` mein se "Phone" ko replace karke "Device" banaya hai.*
- *Yeh useful hai jab humein ek specific substring ko replace karna hota hai.*

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

#### Explanation:
- *Humne `POSITION()` function ka use kiya taaki hum pata kar sakein ki customer name mein "a" kis position par hai.*
- *Isse humein string mein specific characters ki position ka pata lagta hai.*

#### Output:

| **CustomerName** | **Position_Of_A** |
|------------------|-------------------|
| Nandini          | 2                 |
| Rahul            | 2                 |
| Priya            | 4                 |
| Aman             | 1                 |
| Simran           | 5                 |
