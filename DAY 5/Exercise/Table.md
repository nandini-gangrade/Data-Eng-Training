-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    City NVARCHAR(50)
);

-- Create Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    OrderAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert Data into Customers Table
INSERT INTO Customers (CustomerID, FirstName, LastName, City) VALUES
(1, 'John', 'Doe', 'Mumbai'),
(2, 'Jane', 'Smith', 'Delhi'),
(3, 'Emily', 'Jones', 'Bangalore'),
(4, 'Michael', 'Brown', 'Mumbai'),
(5, 'Sarah', 'Davis', 'Chennai');

-- Insert Data into Orders Table
INSERT INTO Orders (OrderID, CustomerID, OrderDate, OrderAmount) VALUES
(101, 1, '2023-01-15', 500.00),
(102, 1, '2023-03-10', 700.00),
(103, 2, '2023-02-20', 1200.00),
(104, 3, '2023-04-05', 300.00),
(105, 4, '2023-06-12', 1500.00),
(106, 5, '2023-07-19', 2000.00),
(107, 1, '2023-09-25', 800.00),
(108, 3, '2023-10-01', 900.00);
