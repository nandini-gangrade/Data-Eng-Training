![image](https://github.com/user-attachments/assets/8bca7d7d-5c0c-479d-a1f4-0bc4c568459a)

### 1. **CREATE TABLE**:

```sql
-- Products table create karte hain
CREATE TABLE Products (
    product_id INT PRIMARY KEY,   -- product_id ek unique identifier hai, primary key banate hain
    product_name NVARCHAR(50),    -- product ka naam, jo maximum 50 characters ka ho sakta hai
    price DECIMAL(10, 2)          -- product ka price, jisme 10 digits tak values ho sakti hain aur 2 decimal places tak precision hota hai
);

-- Orders table create karte hain
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,     -- order_id unique identifier hai, primary key banate hain
    product_id INT,               -- product_id jo Products table ka foreign key hai, yeh orders ko products se link karega
    quantity INT,                 -- order me kitni quantity order ki gayi hai, uska number
    order_date DATE,              -- order kis date ko place hua tha, uska date
    FOREIGN KEY (product_id) REFERENCES Products(product_id)  -- product_id ko Products table ke product_id se link karte hain
);
```

**Explanation**:
- **CREATE TABLE**: Yeh command naya table banane ke liye use hota hai.
- **Products Table**: Isme hum product ki details store kar rahe hain jaise `product_id`, `product_name`, aur `price`. `product_id` ko `PRIMARY KEY` isliye banaya gaya hai taaki yeh unique ho aur har product ko identify kare.
- **Orders Table**: Isme order ki details store karte hain jaise `order_id`, `product_id`, `quantity`, aur `order_date`. `product_id` ko `FOREIGN KEY` banate hain jo `Products` table se link karta hai. Yeh ensure karta hai ki sirf valid products ke liye orders place ho sakein.


#### **Products Table**

| product_id | product_name | price  |
|------------|--------------|--------|
| 1          | Laptop       | 800.00 |
| 2          | SmartPhone   | 500.00 |
| 3          | Tablet       | 300.00 |
| 4          | Headphones   | 50.00  |
| 5          | Monitor      | 150.00 |

#### **Orders Table**

| order_id | product_id | quantity | order_date  |
|----------|------------|----------|-------------|
| 1        | 1          | 2        | 2024-08-01  |
| 2        | 2          | 1        | 2024-08-02  |
| 3        | 3          | 3        | 2024-08-03  |
| 4        | 1          | 1        | 2024-08-04  |
| 5        | 4          | 4        | 2024-08-05  |
| 6        | 5          | 2        | 2024-08-06  |
| 7        | 6          | 1        | 2024-08-07  |  *(This product_id 6 does not exist in Products table)*

---

### 2. **INSERT INTO**:

```sql
-- Products table me data insert karte hain
INSERT INTO Products (product_id, product_name, price) 
VALUES 
    (1, 'Laptop', 800.00),
    (2, 'SmartPhone', 500.00),
    (3, 'Tablet', 300.00),
    (4, 'Headphones', 50.00),
    (5, 'Monitor', 150.00);

-- Orders table me data insert karte hain
INSERT INTO Orders (order_id, product_id, quantity, order_date)
VALUES
    (1, 1, 2, '2024-08-01'),
    (2, 2, 1, '2024-08-02'),
    (3, 3, 3, '2024-08-03'),
    (4, 1, 1, '2024-08-04'),
    (5, 4, 4, '2024-08-05'),
    (6, 5, 2, '2024-08-06'),
    (7, 6, 1, '2024-08-07'); -- Last row ka product_id (6) Products table me exist nahi karta
```

**Explanation**:
- **INSERT INTO**: Yeh command data ko table me add karne ke liye use hota hai.
- **Products Table**: Humne Products table me 5 products ka data insert kiya. Har product ke liye ek unique `product_id`, uska `product_name`, aur uska `price` define kiya.
- **Orders Table**: Humne Orders table me 7 orders ka data insert kiya. Har order ke liye `order_id`, `product_id`, `quantity`, aur `order_date` define kiya. Note karo ki last order ka `product_id` (6) Products table me exist nahi karta, isliye yeh future me join operations me dikhayega ki yeh match nahi karta.

---

### 3. **INNER JOIN**

```sql
SELECT 
    o.order_id, 
    p.product_name, 
    o.quantity, 
    o.order_date
FROM 
    Orders o
INNER JOIN 
    Products p ON o.product_id = p.product_id;
```

**Explanation**:
- **INNER JOIN**: Yeh join tab kaam aata hai jab humein sirf un records ko retrieve karna hota hai jahan dono tables ke columns match karte hain.
- **Syntax**: 
  - `SELECT` clause ka use karke hum un columns ko select kar rahe hain jo output me dikhna chahiye. 
  - `FROM Orders o` ka matlab hai ki hum `Orders` table se data le rahe hain aur uska alias `o` diya hai, taaki baad me hum isko short form me refer kar sakein.
  - `INNER JOIN Products p` ka matlab hai ki hum `Products` table se join kar rahe hain aur uska alias `p` diya hai.
  - `ON o.product_id = p.product_id` ka matlab hai ki hum dono tables ke `product_id` column ko match kar rahe hain.
  
**Output**:

| order_id | product_name | quantity | order_date  |
|----------|--------------|----------|-------------|
| 1        | Laptop       | 2        | 2024-08-01  |
| 2        | SmartPhone   | 1        | 2024-08-02  |
| 3        | Tablet       | 3        | 2024-08-03  |
| 4        | Laptop       | 1        | 2024-08-04  |
| 5        | Headphones   | 4        | 2024-08-05  |
| 6        | Monitor      | 2        | 2024-08-06  |

**Explanation**:
- Yeh table sirf un orders ko dikhata hai jinke `product_id` `Products` table ke saath match karte hain. `order_id = 7` ka `product_id = 6` `Products` table me exist nahi karta, isliye woh result me nahi aaya.

---

### 4. **LEFT OUTER JOIN**

```sql
SELECT 
    o.order_id, 
    p.product_name, 
    o.quantity, 
    o.order_date
FROM 
    Orders o
LEFT OUTER JOIN 
    Products p ON o.product_id = p.product_id;
```

**Explanation**:
- **LEFT OUTER JOIN**: Yeh join tab use hota hai jab humein left table (Orders) ke saare records chahiye, chahe right table (Products) me match ho ya na ho.
- **Syntax**: `LEFT OUTER JOIN` ke baad, left table se saare records select kiye jaate hain, aur agar right table me match nahi hai toh `NULL` return hota hai.

**Output**:

| order_id | product_name | quantity | order_date  |
|----------|--------------|----------|-------------|
| 1        | Laptop       | 2        | 2024-08-01  |
| 2        | SmartPhone   | 1        | 2024-08-02  |
| 3        | Tablet       | 3        | 2024-08-03  |
| 4        | Laptop       | 1        | 2024-08-04  |
| 5        | Headphones   | 4        | 2024-08-05  |
| 6        | Monitor      | 2        | 2024-08-06  |
| 7        | NULL         | 1        | 2024-08-07  |

**Explanation**:
- Yeh table sabhi orders ko dikhata hai. Agar product exist nahi karta, jaise `order_id = 7` ka product, toh uske liye `product_name` me `NULL` dikhaya gaya hai. Iska use tab hota hai jab humein saare orders ki list chahiye, even if unke corresponding products missing ho.

---

### 5. **RIGHT OUTER JOIN**
 
```sql
SELECT 
    o.order_id, 
    p.product_name, 
    o.quantity, 
    o.order_date
FROM 
    Orders o
RIGHT OUTER JOIN 
    Products p ON o.product_id = p.product_id;
```

**Explanation**:
- **RIGHT OUTER JOIN**: Iska use tab hota hai jab humein right table (Products) ke saare records chahiye, chahe left table (Orders) me match ho ya na ho.
- **Syntax**: `RIGHT OUTER JOIN` ke baad, right table ke saare records select kiye jaate hain, aur agar left table me match nahi hai toh `NULL` return hota hai.

**Output**:

| order_id | product_name | quantity | order_date  |
|----------|--------------|----------|-------------|
| 1        | Laptop       | 2        | 2024-08-01  |
| 4        | Laptop       | 1        | 2024-08-04  |
| 2        | SmartPhone   | 1        | 2024-08-02  |
| 3        | Tablet       | 3        | 2024-08-03  |
| 5        | Headphones   | 4        | 2024-08-05  |
| 6        | Monitor      | 2        | 2024-08-06  |

**Explanation**:
- Yeh table sabhi products ko dikhata hai, chahe unke liye orders ho ya na ho. Iska use tab hota hai jab humein saare products ki list chahiye, even if unke corresponding orders missing ho.

---

### 6. **FULL OUTER JOIN**

```sql
SELECT 
    o.order_id, 
    p.product_name, 
    o.quantity, 
    o.order_date
FROM 
    Orders o
FULL OUTER JOIN 
    Products p ON o.product_id = p.product_id;
```

**Explanation**:
- **FULL OUTER JOIN**: Yeh join tab use hota hai jab humein dono tables ke saare records chahiye, chahe match ho ya na ho. Agar match nahi hota, toh `NULL` dikhaya jata hai.
- **Syntax**: `FULL OUTER JOIN` ke baad dono tables ke saare records select kiye jaate hain, aur agar match nahi hai toh `NULL` values return hoti hain.

**Output**:

| order_id | product_name | quantity | order_date  |
|----------|--------------|----------|-------------|
| 1        | Laptop       | 2        | 2024-08-01  |
| 4        | Laptop       | 1        | 2024-08-04  |
| 2        | SmartPhone   | 1        | 2024-08-02  |
| 3        | Tablet       | 3        | 2024-08-03  |
| 5        | Headphones   | 4        | 2024-08-05  |
| 6        | Monitor      | 2        | 2024-08-06  |
| 7        | NULL         | 1        | 2024-08-07  |

**Explanation**:
- Yeh table dono tables ke saare records ko dikhata hai. Agar match nahi hota, jaise `order_id = 7` ka product, ya agar Products table me koi extra product hota, toh `NULL` values return hoti.

---

### **Conclusion**:

``` py
- **INNER JOIN**: Tb use karte hain jab sirf matching records chahiyein, jaise valid orders ke saath products ka data.
- **LEFT OUTER JOIN**: Tb use karte hain jab left table ke saare records chahiyein, chahe right table me match ho ya na ho, jaise saare orders ke details, even if product ka data missing ho.
- **RIGHT OUTER JOIN**: Tb use karte hain jab right table ke saare records chahiyein, chahe left table me match ho ya na ho, jaise saare products ke details, even if unke liye orders na ho.
- **FULL OUTER JOIN**: Tb use karte hain jab dono tables ke saare records chahiyein, chahe match ho ya na ho, jaise saare orders aur products ke details.
```
