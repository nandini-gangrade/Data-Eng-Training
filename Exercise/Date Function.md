# Orders Table

| **OrderID** | **CustomerName** | **OrderDate** | **Amount** |
|-------------|------------------|---------------|------------|
| 1           | Nandini           | 2024-07-15    | 2500.00    |
| 2           | Rahul             | 2024-08-01    | 1500.00    |
| 3           | Priya             | 2024-07-25    | 3500.00    |
| 4           | Aman              | 2024-08-15    | 2000.00    |
| 5           | Simran            | 2024-06-30    | 4000.00    |

---

### 1. Calculate the number of months between your birthday and the current date.

#### Query:
```sql
SELECT TIMESTAMPDIFF(MONTH, '1998-04-23', CURDATE()) AS Months_Between_Birthday_And_Now;
```

#### Output:
| **Months_Between_Birthday_And_Now** |
|-------------------------------------|
| 316                                 |

---

### 2. Retrieve all orders that were placed in the last 30 days.

#### Query:
```sql
SELECT * 
FROM Orders 
WHERE OrderDate >= CURDATE() - INTERVAL 30 DAY;
```

#### Output:
| **OrderID** | **CustomerName** | **OrderDate** | **Amount** |
|-------------|------------------|---------------|------------|
| 2           | Rahul             | 2024-08-01    | 1500.00    |
| 4           | Aman              | 2024-08-15    | 2000.00    |

---

### 3. Extract the year, month, and day from the current date.

#### Query:
```sql
SELECT 
    YEAR(CURDATE()) AS Current_Year, 
    MONTH(CURDATE()) AS Current_Month, 
    DAY(CURDATE()) AS Current_Day;
```

#### Output:
| **Current_Year** | **Current_Month** | **Current_Day** |
|------------------|-------------------|-----------------|
| 2024             | 08                | 22              |

---

### 4. Calculate the difference in years between two given dates.

#### Query:
```sql
SELECT TIMESTAMPDIFF(YEAR, '2000-01-01', '2024-01-01') AS Year_Difference;
```

#### Output:
| **Year_Difference** |
|---------------------|
| 24                  |

---

### 5. Retrieve the last day of the month for a given date.

#### Query:
```sql
SELECT LAST_DAY('2024-07-15') AS Last_Day_Of_Month;
```

#### Output:
| **Last_Day_Of_Month** |
|-----------------------|
| 2024-07-31            |
