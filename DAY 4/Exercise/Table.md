# Tables

## **1. Table: `Customers`**

```sql
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15)
);
```

```sql
INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber)
VALUES 
('Amit', 'Sharma', 'amit.sharma@example.com', '9876543210'),
('Priya', 'Mehta', 'priya.mehta@example.com', '8765432109'),
('Rohit', 'Kumar', 'rohit.kumar@example.com', '7654321098'),
('Neha', 'Verma', 'neha.verma@example.com', '6543210987'),
('Siddharth', 'Singh', 'siddharth.singh@example.com', '5432109876'),
('Asha', 'Rao', 'asha.rao@example.com', '4321098765'),
('Raj', 'Patel', 'raj.patel@example.com', '3210987654'),
('Meera', 'Gupta', 'meera.gupta@example.com', '2109876543'),
('Vikram', 'Yadav', 'vikram.yadav@example.com', '1098765432');
```

| CustomerID | FirstName | LastName | Email                      | PhoneNumber |
|------------|-----------|----------|----------------------------|-------------|
| 1          | Amit      | Sharma   | amit.sharma@example.com    | 9876543210  |
| 2          | Priya     | Mehta    | priya.mehta@example.com    | 8765432109  |
| 3          | Rohit     | Kumar    | rohit.kumar@example.com    | 7654321098  |
| 4          | Neha      | Verma    | neha.verma@example.com     | 6543210987  |
| 5          | Siddharth | Singh    | siddharth.singh@example.com| 5432109876  |
| 6          | Asha      | Rao      | asha.rao@example.com       | 4321098765  |
| 7          | Raj       | Patel    | raj.patel@example.com      | 3210987654  |
| 8          | Meera     | Gupta    | meera.gupta@example.com    | 2109876543  |
| 9          | Vikram    | Yadav    | vikram.yadav@example.com   | 1098765432  |

<br>

## **2. Table: `Products`**

```sql
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    StockQuantity INT
);
```

```sql
INSERT INTO Products (ProductName, Category, Price, StockQuantity)
VALUES 
('Laptop', 'Electronics', 75000.00, 15),
('Smartphone', 'Electronics', 25000.00, 30),
('Desk Chair', 'Furniture', 5000.00, 10),
('Monitor', 'Electronics', 12000.00, 20),
('Bookshelf', 'Furniture', 8000.00, 8),
('Tablet', 'Electronics', 20000.00, 12),
('Headphones', 'Electronics', 3000.00, 25);
```

| ProductID | ProductName | Category     | Price   | StockQuantity |
|-----------|-------------|--------------|---------|---------------|
| 1         | Laptop      | Electronics  | 75000.00| 15            |
| 2         | Smartphone  | Electronics  | 25000.00| 30            |
| 3         | Desk Chair  | Furniture    | 5000.00 | 10            |
| 4         | Monitor     | Electronics  | 12000.00| 20            |
| 5         | Bookshelf   | Furniture    | 8000.00 | 8             |
| 6         | Tablet      | Electronics  | 20000.00| 12            |
| 7         | Headphones  | Electronics  | 3000.00 | 25            |

<br>

## **3. Table: `Orders`**

```sql
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    ProductID INT,
    Quantity INT,
    TotalAmount DECIMAL(10, 2),
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
```

```sql
INSERT INTO Orders (CustomerID, ProductID, Quantity, TotalAmount, OrderDate)
VALUES 
(1, 1, 2, 150000.00, '2024-08-01'),
(2, 2, 1, 25000.00, '2024-08-02'),
(3, 3, 4, 20000.00, '2024-08-03'),
(4, 4, 2, 24000.00, '2024-08-04'),
(5, 5, 1, 75000.00, '2024-08-05'),
(6, 6, 1, 20000.00, '2024-08-06'),
(7, 7, 2, 6000.00, '2024-08-07');
```

| OrderID | CustomerID | ProductID | Quantity | TotalAmount | OrderDate  |
|---------|------------|-----------|----------|-------------|------------|
| 1       | 1          | 1         | 2        | 150000.00   | 2024-08-01 |
| 2       | 2          | 2         | 1        | 25000.00    | 2024-08-02 |
| 3       | 3          | 3         | 4        | 20000.00    | 2024-08-03 |
| 4       | 4          | 4         | 2        | 24000.00    | 2024-08-04 |
| 5       | 5          | 5         | 1        | 75000.00    | 2024-08-05 |
| 6       | 6          | 6         | 1        | 20000.00    | 2024-08-06 |
| 7       | 7          | 7         | 2        | 6000.00     | 2024-08-07 |
| 8       | 8          | 3         | 3        | 15000.00    | 2024-08-08 |
| 9       | 9          | 1         | 1        | 75000.00    | 2024-08-09 |
| 10      | 10         | 2         | 2        | 50000.00    | 2024-08-10 |
