# SQL Date Function Exercises

In this exercise, you'll learn how to use SQL date functions to manipulate and retrieve date-related information from a database. We'll first create a table, insert some rows, and then solve the given questions using SQL queries in Microsoft SQL Server (MS SQL).

## Basics of SQL Date Functions

Here’s a quick reference table of some commonly used SQL date functions across different SQL databases:

| **Function**             | **SQL Server (MS SQL)**             | **MySQL**                     | **PostgreSQL**               | **Explanation**                                                                 |
|--------------------------|-------------------------------------|-------------------------------|------------------------------|---------------------------------------------------------------------------------|
| Current Date             | `GETDATE()`                         | `CURDATE()`                   | `CURRENT_DATE`               | Returns the current date (and time for MS SQL).                                 |
| Year Extraction          | `YEAR(GETDATE())`                   | `YEAR(CURDATE())`             | `EXTRACT(YEAR FROM NOW())`   | Extracts the year part from the current date.                                   |
| Month Extraction         | `MONTH(GETDATE())`                  | `MONTH(CURDATE())`            | `EXTRACT(MONTH FROM NOW())`  | Extracts the month part from the current date.                                  |
| Day Extraction           | `DAY(GETDATE())`                    | `DAY(CURDATE())`              | `EXTRACT(DAY FROM NOW())`    | Extracts the day part from the current date.                                    |
| Date Difference (in days)| `DATEDIFF(DAY, date1, date2)`       | `DATEDIFF(date1, date2)`      | `AGE(date1, date2)`          | Returns the difference in days between two dates.                               |
| Add Interval to Date     | `DATEADD(DAY, value, date)`         | `DATE_ADD(date, INTERVAL ...)`| `date + interval 'value unit'`| Adds a specified time interval to a date.                                      |
| Subtract Interval from Date| `DATEADD(DAY, -value, date)`      | `DATE_SUB(date, INTERVAL ...)`| `date - interval 'value unit'`| Subtracts a specified time interval from a date.                                |
| Last Day of Month        | `EOMONTH(date)`                     | `LAST_DAY(date)`              | `date_trunc('month', date)`  | Returns the last day of the month for the given date.                           |

These commands will be used throughout the exercises to answer the questions. Now, let's create a table to work with.

---

## Table

We'll create an `Orders` table to store some order data. This table will be used to answer all the date function exercises.

```sql
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    OrderDate DATE,
    Amount DECIMAL(10,2)
);

INSERT INTO Orders (OrderID, CustomerName, OrderDate, Amount) VALUES
(1, 'Nandini', '2024-07-15', 2500.00),
(2, 'Rahul', '2024-08-01', 1500.00),
(3, 'Priya', '2024-07-25', 3500.00),
(4, 'Aman', '2024-08-15', 2000.00),
(5, 'Simran', '2024-06-30', 4000.00);
```

### Explanation:
- **Table Structure**: `Orders` table stores the order ID, customer name, order date, and amount of the order.
- **Date Column**: `OrderDate` column stores the date when the order was placed.
- **Sample Data**: We have inserted 5 rows into the table, each representing an order placed by a customer.

### Orders Table after Inserting Values

| **OrderID** | **CustomerName** | **OrderDate** | **Amount** |
|-------------|------------------|---------------|------------|
| 1           | Nandini           | 2024-07-15    | 2500.00    |
| 2           | Rahul             | 2024-08-01    | 1500.00    |
| 3           | Priya             | 2024-07-25    | 3500.00    |
| 4           | Aman              | 2024-08-15    | 2000.00    |
| 5           | Simran            | 2024-06-30    | 4000.00    |

---

## Solve the Questions

### 1. **Calculate the Number of Months Between Your Birthday and the Current Date**

#### SQL Server Query:

```sql
SELECT 
    '2000-08-15' AS BirthDate,
    DATEDIFF(MONTH, '2000-08-15', GETDATE()) 
    - CASE WHEN DAY('2000-08-15') > DAY(GETDATE()) THEN 1 ELSE 0 END AS MonthsFromBirthday;
```

### Explanation:
- **DATEDIFF(MONTH, '2000-08-15', GETDATE())**: Yeh function aapki birthday aur current date ke beech ka difference months mein nikalta hai.
- **CASE**: Agar aapki birthday ka din current day se bada hai, toh ek month kam kar deta hai, taaki exact month difference mile.

#### Output Table:

| **BirthDate** | **MonthsFromBirthday** |
|---------------|------------------------|
| 2000-08-15    | 288                    |

Yeh output dikhata hai ki aapki birthday se aaj tak kitne months guzar gaye hain.

---

### 2. **Retrieve All Orders That Were Placed in the Last 30 Days**

#### SQL Server Query:

```sql
SELECT * 
FROM Orders
WHERE OrderDate >= DATEADD(DAY, -30, GETDATE());
```

### Explanation:
- **GETDATE()**: Current date aur time ko return karta hai.
- **DATEADD(DAY, -30, GETDATE())**: Current date se 30 din piche ka date nikalta hai.

Is query se aapko woh orders milenge jo last 30 din mein place hue hain.

#### Output Table:

| **OrderID** | **CustomerName** | **OrderDate** | **Amount** |
|-------------|------------------|---------------|------------|
| 2           | Rahul             | 2024-08-01    | 1500.00    |
| 4           | Aman              | 2024-08-15    | 2000.00    |

Yeh output dikhata hai last 30 din mein place hue orders.

---

### 3. **Extract the Year, Month, and Day from the Current Date**

#### SQL Server Query:

```sql
SELECT 
    YEAR(GETDATE()) AS CurrentYear,
    MONTH(GETDATE()) AS CurrentMonth,
    DAY(GETDATE()) AS CurrentDay;
```

### Explanation:
- **GETDATE()**: Current date aur time ko return karta hai.
- **YEAR(GETDATE())**: Current year nikalta hai.
- **MONTH(GETDATE())**: Current month nikalta hai.
- **DAY(GETDATE())**: Current day nikalta hai.

Is query se aapko aaj ka year, month aur day alag-alag columns mein milega.

#### Output Table:

| **CurrentYear** | **CurrentMonth** | **CurrentDay** |
|-----------------|------------------|----------------|
| 2024            | 08               | 22             |

Yeh output dikhata hai aaj ka year, month, aur day.

---

### 4. **Calculate the Difference in Years Between Two Given Dates**

#### SQL Server Query:

```sql
SELECT 
    '2010-01-01' AS StartDate, 
    '2020-01-01' AS EndDate,
    DATEDIFF(YEAR, '2010-01-01', '2020-01-01') AS YearsDifference;
```

### Explanation:
- **DATEDIFF(YEAR, '2010-01-01', '2020-01-01')**: Yeh function do dates ke beech ka difference years mein calculate karta hai.

Is query se aapko pata chalega ki do dates ke beech kitne saal ka difference hai.

#### Output Table:

| **StartDate** | **EndDate**  | **YearsDifference** |
|---------------|--------------|---------------------|
| 2010-01-01    | 2020-01-01   | 10                  |

Yeh output dikhata hai kitne saal ka difference hai do dates ke beech.

---

### 5. **Retrieve the Last Day of the Month for a Given Date**

#### SQL Server Query:

```sql
SELECT 
    OrderDate,
    EOMONTH(OrderDate) AS LastDayOfMonth
FROM Orders;
```

### Explanation:
- **EOMONTH(OrderDate)**: Yeh function given date ke month ka last day return karta hai.

Is query se aapko har order ke OrderDate ka month ka last day milega.

#### Output Table:

| **OrderDate** | **LastDayOfMonth** |
|---------------|--------------------|
| 2024-07-15    | 2024-07-31         |
| 2024-08-01    | 2024-08-31         |
| 2024-07-25    | 2024-07-31         |
| 2024-08-15    | 2024-08-31         |
| 2024-06-30    | 2024-06-30         |

Yeh output dikhata hai har OrderDate ka month ka last day.
