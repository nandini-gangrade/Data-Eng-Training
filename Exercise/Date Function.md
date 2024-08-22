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
SELECT 
    '2000-08-15' AS BirthDate,
    DATEDIFF(MONTH, '2000-08-15', GETDATE()) 
    - CASE WHEN DAY('2000-08-15') > DAY(GETDATE()) THEN 1 ELSE 0 END AS MonthsFromBirthday;
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
WHERE OrderDate >= DATEADD(DAY, -30, GETDATE());
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
    YEAR(GETDATE()) AS CurrentYear,
    MONTH(GETDATE()) AS CurrentMonth,
    DAY(GETDATE()) AS CurrentDay;
```

#### Output:
| **Current_Year** | **Current_Month** | **Current_Day** |
|------------------|-------------------|-----------------|
| 2024             | 08                | 22              |

---

### 4. Calculate the difference in years between two given dates.

#### Query:
```sql
SELECT 
    '2010-01-01' AS StartDate, 
    '2020-01-01' AS EndDate,
    DATEDIFF(YEAR, '2010-01-01', '2020-01-01') AS YearsDifference;
```

#### Output:
| **Year_Difference** |
|---------------------|
| 24                  |

---

### 5. Retrieve the last day of the month for a given date.

#### Query:
```sql
SELECT 
    OrderDate,
    EOMONTH(OrderDate) AS LastDayOfMonth
FROM Orders;
```

#### Output:
| **Last_Day_Of_Month** |
|-----------------------|
| 2024-07-31            |
