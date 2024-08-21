| Topic | Details |
|-------|---------|
| [Fact and Dimension Table Types](#fact-and-dimension-table-types) | Explanation of Fact and Dimension tables, their definitions, and examples. |
| [Star Schema](#star-schema) | Introduction to the Star Schema model with an example and explanation. |
| [Snowflake Schema](#snowflake-schema) | Detailed explanation of the Snowflake Schema with normalization examples. |

---

## Fact and Dimension Table Types

**Definition:**
Fact aur Dimension tables data warehousing ke fundamental components hain. Fact table transactions ya events ko store karta hai, jabki Dimension tables descriptive information ya context provide karte hain.

**Explanation:**

1. **Fact Table:**
   - Fact tables mein quantitative data ya measures store hoti hain, jo analysis ke liye important hoti hain.
   - Yeh tables bahut badi hoti hain aur transactional data jaise sales, revenue, quantity, etc. ko store karti hain.
   - Example fields: `SalesAmount`, `Quantity`, `Revenue`.

2. **Dimension Table:**
   - Dimension tables mein descriptive attributes hoti hain jo fact data ko context provide karti hain.
   - Yeh tables chhoti hoti hain aur descriptive information jaise customer details, product details, time, etc. ko store karti hain.
   - Example fields: `CustomerName`, `ProductName`, `Date`.

**Example:**

Let's create a simple Fact and Dimension table scenario:

**Dimension Tables:**

```sql
CREATE TABLE ProductDimension (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50)
);

CREATE TABLE CustomerDimension (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Location VARCHAR(50)
);

CREATE TABLE DateDimension (
    DateID INT PRIMARY KEY,
    Date DATE,
    Month VARCHAR(20),
    Year INT
);
```

**Fact Table:**

```sql
CREATE TABLE SalesFact (
    SalesID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    DateID INT,
    SalesAmount DECIMAL(10, 2),
    Quantity INT,
    FOREIGN KEY (ProductID) REFERENCES ProductDimension(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES CustomerDimension(CustomerID),
    FOREIGN KEY (DateID) REFERENCES DateDimension(DateID)
);
```

**Insert Data:**

```sql
INSERT INTO ProductDimension VALUES (1, 'Laptop', 'Electronics');
INSERT INTO CustomerDimension VALUES (1, 'John Doe', 'New York');
INSERT INTO DateDimension VALUES (1, '2024-08-21', 'August', 2024);

INSERT INTO SalesFact VALUES (1, 1, 1, 1, 1500.00, 2);
```

**Output Table Explanation:**

- **SalesFact** table transactional data store karti hai jaise sales amount aur quantity.
- **ProductDimension**, **CustomerDimension**, aur **DateDimension** tables context provide karti hain jaise product kaun sa tha, customer kaun tha, aur transaction kis date ko hui.

**SalesFact Table after Insert:**

| SalesID | ProductID | CustomerID | DateID | SalesAmount | Quantity |
|---------|-----------|------------|--------|-------------|----------|
| 1       | 1         | 1          | 1      | 1500.00     | 2        |

---

## Star Schema

**Definition:**
Star schema ek data warehousing model hai jisme ek central fact table hoti hai jo multiple dimension tables se directly linked hoti hai. Yeh ek star ke shape ka structure banata hai.

![image](https://github.com/user-attachments/assets/67b6ca40-ff14-44ef-9cf2-e48470931b91)

**Explanation:**

- **Central Fact Table:** Jo transactions ya events ko store karti hai.
- **Dimension Tables:** Jo context ya descriptive information provide karti hain.

**Example:**

Fact aur Dimension tables jo humne upar create ki thi, woh star schema ka ek example hain:

- **Fact Table:** `SalesFact`
- **Dimension Tables:** `ProductDimension`, `CustomerDimension`, `DateDimension`

**Diagrammatic Explanation:**

- `SalesFact` table center mein hogi aur `ProductDimension`, `CustomerDimension`, `DateDimension` tables uske aas-paas star shape mein hogi.

**Output Table:**
Star schema mein data retrieval fast hota hai kyunki tables mein fewer joins hoti hain.

---

## Snowflake Schema

**Definition:**
Snowflake schema star schema ka extended version hai jisme dimension tables further normalized hoti hain, matlab unhe chhoti tables mein split kiya jaata hai.

**Explanation:**

- Snowflake schema mein dimension tables mein normalization hoti hai, jo redundancy kam karti hai.
- Iska structure complex hota hai kyunki dimension tables multiple sub-tables mein divide hoti hain.

**Example:**

Hum `ProductDimension` table ko normalize kar sakte hain:

```sql
CREATE TABLE CategoryDimension (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50)
);

CREATE TABLE ProductDimension (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    CategoryID INT,
    FOREIGN KEY (CategoryID) REFERENCES CategoryDimension(CategoryID)
);
```

**Normalized Structure:**

- `ProductDimension` table ab `CategoryDimension` table se linked hogi.

**Output Table:**

- Data retrieval thoda slower ho sakta hai kyunki multiple joins lagti hain, lekin storage aur data redundancy kam hoti hai.

**Output Explanation:**

- Star schema straightforward hota hai, lekin snowflake schema mein better data integrity hoti hai due to normalization.

### Summary

1. **Fact Table:** Quantitative data ko store karta hai, jaise sales ya revenue.
2. **Dimension Table:** Descriptive data ko store karta hai, jaise product, customer, aur date.
3. **Star Schema:** Simple aur fast retrieval ke liye.
4. **Snowflake Schema:** Complex structure with normalized dimension tables for better data integrity.

Har schema ka use case depend karta hai data complexity aur query performance requirements par.


----------

Here’s how we can break down the explanation with tables and diagrams for Fact and Dimension Table Types, Star Schema, and Snowflake Schema. 

### Fact and Dimension Table Types

#### Definition:

- **Fact Tables:** Store numerical data (measures) related to business processes.
- **Dimension Tables:** Store descriptive attributes that provide context to the fact table data.

#### Example Setup:

##### 1. Fact Table: `FactSales`

```sql
CREATE TABLE FactSales (
    SalesID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    DateID INT,
    SalesAmount DECIMAL(10, 2),
    QuantitySold INT,
    FOREIGN KEY (ProductID) REFERENCES DimProduct(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES DimCustomer(CustomerID),
    FOREIGN KEY (DateID) REFERENCES DimDate(DateID)
);
```

##### 2. Dimension Tables: `DimProduct`, `DimCustomer`, `DimDate`

```sql
CREATE TABLE DimProduct (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    ProductCategory VARCHAR(50)
);

CREATE TABLE DimCustomer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    CustomerRegion VARCHAR(50)
);

CREATE TABLE DimDate (
    DateID INT PRIMARY KEY,
    Date DATE,
    Month VARCHAR(10),
    Year INT
);
```

#### Example Data:

##### Fact Table (`FactSales`):

| SalesID | ProductID | CustomerID | DateID | SalesAmount | QuantitySold |
|---------|-----------|------------|--------|-------------|--------------|
| 1       | 101       | 201        | 301    | 1000.00     | 10           |
| 2       | 102       | 202        | 302    | 2000.00     | 20           |

##### Dimension Table (`DimProduct`):

| ProductID | ProductName | ProductCategory |
|-----------|-------------|-----------------|
| 101       | Laptop      | Electronics     |
| 102       | Phone       | Electronics     |

##### Dimension Table (`DimCustomer`):

| CustomerID | CustomerName | CustomerRegion |
|------------|--------------|----------------|
| 201        | John Doe     | North America  |
| 202        | Jane Smith   | Europe         |

##### Dimension Table (`DimDate`):

| DateID | Date       | Month  | Year |
|--------|------------|--------|------|
| 301    | 2024-08-01 | August | 2024 |
| 302    | 2024-08-02 | August | 2024 |

### Star Schema

#### Definition:
A star schema has a central fact table surrounded by dimension tables, forming a star-like pattern.

#### Diagram:

![Star Schema](https://example.com/star-schema-diagram.png)

#### Example Setup:
```sql
CREATE TABLE FactSales (
    SalesID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    DateID INT,
    SalesAmount DECIMAL(10, 2),
    QuantitySold INT,
    FOREIGN KEY (ProductID) REFERENCES DimProduct(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES DimCustomer(CustomerID),
    FOREIGN KEY (DateID) REFERENCES DimDate(DateID)
);

CREATE TABLE DimProduct (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    ProductCategory VARCHAR(50)
);

CREATE TABLE DimCustomer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    CustomerRegion VARCHAR(50)
);

CREATE TABLE DimDate (
    DateID INT PRIMARY KEY,
    Date DATE,
    Month VARCHAR(10),
    Year INT
);
```

#### Example Data:

##### Fact Table (`FactSales`):
| SalesID | ProductID | CustomerID | DateID | SalesAmount | QuantitySold |
|---------|-----------|------------|--------|-------------|--------------|
| 1       | 101       | 201        | 301    | 1000.00     | 10           |
| 2       | 102       | 202        | 302    | 2000.00     | 20           |

##### Dimension Tables:

- **`DimProduct`, `DimCustomer`, `DimDate`** tables as described above.

### Snowflake Schema

#### Definition:
A snowflake schema is a normalized version of the star schema where dimension tables are normalized into multiple related tables.

#### Diagram:

![Snowflake Schema](https://example.com/snowflake-schema-diagram.png)

#### Example Setup:

##### 1. Dimension Table: `DimProductCategory`, `DimProduct`
```sql
CREATE TABLE DimProductCategory (
    ProductCategoryID INT PRIMARY KEY,
    ProductCategoryName VARCHAR(50)
);

CREATE TABLE DimProduct (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    ProductCategoryID INT,
    FOREIGN KEY (ProductCategoryID) REFERENCES DimProductCategory(ProductCategoryID)
);
```

##### 2. Dimension Table: `DimCustomerRegion`, `DimCustomer`
```sql
CREATE TABLE DimCustomerRegion (
    CustomerRegionID INT PRIMARY KEY,
    RegionName VARCHAR(50)
);

CREATE TABLE DimCustomer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    CustomerRegionID INT,
    FOREIGN KEY (CustomerRegionID) REFERENCES DimCustomerRegion(CustomerRegionID)
);
```

#### Example Data:

##### Normalized Dimension Tables:

- **`DimProductCategory`**

| ProductCategoryID | ProductCategoryName |
|-------------------|---------------------|
| 1                 | Electronics         |

- **`DimProduct`**

| ProductID | ProductName | ProductCategoryID |
|-----------|-------------|-------------------|
| 101       | Laptop      | 1                 |
| 102       | Phone       | 1                 |

- **`DimCustomerRegion`**

| CustomerRegionID | RegionName    |
|------------------|--------------|
| 1                | North America|
| 2                | Europe       |

- **`DimCustomer`**

| CustomerID | CustomerName | CustomerRegionID |
|------------|--------------|------------------|
| 201        | John Doe     | 1                |
| 202        | Jane Smith   | 2                |

### Summary Table

| Topic                      | Summary |
|----------------------------|---------|
| **Fact and Dimension Table Types** | Explains the difference between Fact and Dimension tables with examples. |
| **Star Schema**            | Simple data warehouse design with a central fact table surrounded by dimension tables. |
| **Snowflake Schema**       | Normalized version of the Star Schema with dimension tables split into multiple related tables. |

These explanations should give you a clear understanding of the concepts, along with examples, output tables, and diagrams for better visualization.
