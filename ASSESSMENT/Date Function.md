# SQL Date Function Exercises

In this exercise, you'll learn how to use SQL date functions to manipulate and retrieve date-related information from a database. We'll first create a table, insert some rows, and then solve the given questions using SQL queries.

## Basics of SQL Date Functions

Here’s a quick reference table of some commonly used SQL date functions:

| **Command**            | **Explanation**                                                                                         |
|------------------------|---------------------------------------------------------------------------------------------------------|
| `CURDATE()`            | Returns the current date.                                                                                |
| `YEAR(date)`           | Extracts the year part from a date.                                                                      |
| `MONTH(date)`          | Extracts the month part from a date.                                                                     |
| `DAY(date)`            | Extracts the day part from a date.                                                                       |
| `TIMESTAMPDIFF(unit, start, end)` | Returns the difference between two dates in the specified unit (e.g., YEAR, MONTH, DAY).          |
| `LAST_DAY(date)`       | Returns the last day of the month for the given date.                                                    |
| `DATE_ADD(date, INTERVAL value unit)` | Adds a specified time interval to a date.                                                    |
| `DATE_SUB(date, INTERVAL value unit)` | Subtracts a specified time interval from a date.                                             |
| `DATEDIFF(date1, date2)` | Returns the difference in days between two dates.                                                         |

These commands will be used throughout the exercises to answer the questions. Now, let's create a table to work with.

---

## Step 1: Create the Table and Insert Rows

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

### Explanation:
- **OrderID**: Unique identifier for each order.
- **CustomerName**: Name of the customer who placed the order.
- **OrderDate**: Date on which the order was placed.
- **Amount**: The total amount of the order in currency (₹).

This table is now ready for you to perform the various SQL date function exercises and retrieve the relevant data according to each exercise.

---

## Solve the Questions

### 1. **Calculate the Number of Months Between Your Birthday and the Current Date**

#### SQL Query:

```sql
SELECT '2000-08-15' AS BirthDate,
       TIMESTAMPDIFF(MONTH, '2000-08-15', CURDATE()) AS MonthsFromBirthday;
```

#### Explanation:
- **TIMESTAMPDIFF(MONTH, date1, date2)**: Yeh function `date1` aur `date2` ke beech mein months ka difference calculate karta hai.
- **CURDATE()**: Yeh function current date return karta hai.
  
Is query mein, hum apni birthday aur current date ke beech mein months ka difference nikal rahe hain.

#### Output Table:

| BirthDate  | MonthsFromBirthday |
|------------|-------------------|
| 2000-08-15 | 288               |

Yahaan pe output dikhata hai kitne months ho gaye hain birthdate se aaj tak.

In Microsoft SQL Server (MS SQL), the `TIMESTAMPDIFF` function is not directly available. However, you can achieve the same result by using the `DATEDIFF` function in combination with some other functions to calculate the number of months between two dates.

### SQL Server Query

To calculate the number of months between your birthday and the current date:

```sql
SELECT 
    '2000-08-15' AS BirthDate,
    DATEDIFF(MONTH, '2000-08-15', GETDATE()) 
    - CASE WHEN DAY('2000-08-15') > DAY(GETDATE()) THEN 1 ELSE 0 END AS MonthsFromBirthday;
```

### Explanation

- **`DATEDIFF(MONTH, '2000-08-15', GETDATE())`**: This part calculates the difference in months between your birthday ('2000-08-15') and the current date (`GETDATE()`).
  
- **`CASE WHEN DAY('2000-08-15') > DAY(GETDATE()) THEN 1 ELSE 0 END`**: This subtracts one month if the day of your birthdate is greater than the current day, which adjusts for partial months where the current date hasn't yet reached the birth day.

### Output Table

| **BirthDate** | **MonthsFromBirthday** |
|---------------|------------------------|
| 2000-08-15    | 288                      |

- **`X`** will be the total number of months between your birthdate and the current date, adjusted for partial months if necessary.

This method gives you a close approximation to `TIMESTAMPDIFF` in MS SQL Server.

---

### 2. **Retrieve All Orders That Were Placed in the Last 30 Days**

#### SQL Query:

```sql
SELECT * 
FROM Orders
WHERE OrderDate >= CURDATE() - INTERVAL 30 DAY;
```

#### Explanation:
- **INTERVAL 30 DAY**: Yeh part specify karta hai ki hum 30 din pehle ki date chahiye.
- **WHERE Clause**: Ismein hum filter karte hain sirf wo orders jo last 30 dinon mein place hue hain.

Is query mein, hum saari orders fetch kar rahe hain jo last 30 din mein place hue hain.

#### Output Table:

| OrderID | CustomerName | OrderDate  | Amount |
|---------|--------------|------------|--------|
| 2       | Rahul        | 2024-08-01 | 1500.00|
| 4       | Aman         | 2024-08-15 | 2000.00|

Output dikhata hai wo orders jo last 30 din mein place hui hain.

---

### 3. **Extract the Year, Month, and Day from the Current Date**

#### SQL Query:

```sql
SELECT 
    YEAR(CURDATE()) AS CurrentYear,
    MONTH(CURDATE()) AS CurrentMonth,
    DAY(CURDATE()) AS CurrentDay;
```

#### Explanation:
- **YEAR(), MONTH(), DAY()**: Yeh functions current date se respective year, month aur day extract karte hain.
  
Is query mein, hum current date ke year, month aur day ko alag-alag columns mein display kar rahe hain.

#### Output Table:

| CurrentYear | CurrentMonth | CurrentDay |
|-------------|--------------|------------|
| 2024        | 08           | 22         |

Yahaan pe output dikhata hai aaj ka year, month aur day.

---

### 4. **Calculate the Difference in Years Between Two Given Dates**

#### SQL Query:

```sql
SELECT 
    '2010-01-01' AS StartDate, 
    '2020-01-01' AS EndDate,
    TIMESTAMPDIFF(YEAR, '2010-01-01', '2020-01-01') AS YearsDifference;
```

#### Explanation:
- **TIMESTAMPDIFF(YEAR, date1, date2)**: Yeh function `date1` aur `date2` ke beech ka year difference calculate karta hai.

Is query mein, hum do dates ke beech mein years ka difference calculate kar rahe hain.

#### Output Table:

| StartDate  | EndDate    | YearsDifference |
|------------|------------|-----------------|
| 2010-01-01 | 2020-01-01 | 10              |

Output dikhata hai kitne saal ka difference hai do dates ke beech mein.

---

### 5. **Retrieve the Last Day of the Month for a Given Date**

#### SQL Query:

```sql
SELECT 
    OrderDate,
    LAST_DAY(OrderDate) AS LastDayOfMonth
FROM Orders;
```

#### Explanation:
- **LAST_DAY(date)**: Yeh function given date ke month ka last day return karta hai.
  
Is query mein, hum Orders table ke har order ke OrderDate ka month ka last day fetch kar rahe hain.

#### Output Table:

| OrderDate  | LastDayOfMonth |
|------------|----------------|
| 2024-07-15 | 2024-07-31     |
| 2024-08-01 | 2024-08-31     |
| 2024-07-25 | 2024-07-31     |
| 2024-08-15 | 2024-08-31     |
| 2024-06-30 | 2024-06-30     |

Yahaan pe output dikhata hai har order ke month ka last day.
