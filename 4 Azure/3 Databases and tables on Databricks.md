### **Databases and Tables on Databricks**

Azure Databricks par databases aur tables ka management important hai, kyunki yeh data organization aur retrieval ko asaan banate hain. Is section mein, hum managed aur unmanaged tables ke concepts ko detail mein dekhenge.

---

### **1. Databases in Databricks**

Databricks mein, aap databases ka istemal karke tables ko organize kar sakte hain. Database ek logical namespace hai jo tables aur views ko group karta hai.

**Database Create Karne ka Syntax:**

```sql
CREATE DATABASE database_name;
```

**Database List Karne ka Syntax:**

```sql
SHOW DATABASES;
```

**Database Drop Karne ka Syntax:**

```sql
DROP DATABASE database_name;
```

---

### **2. Managed Tables**

**Managed Tables** (ya Internal Tables) wo tables hain jinka data Databricks ke dwara manage kiya jata hai. Jab aap managed table create karte hain, to Databricks data aur metadata dono ko handle karta hai. Agar aap table ko drop karte hain, to associated data bhi delete ho jata hai.

**Managed Table Create Karne ka Syntax:**

```sql
CREATE TABLE managed_table_name (
    column1_name DATA_TYPE,
    column2_name DATA_TYPE
) USING DELTA;
```

**Example:**

```sql
CREATE TABLE employees (
    id INT,
    name STRING,
    salary FLOAT
) USING DELTA;
```

**Data Insert Karne ka Example:**

```sql
INSERT INTO employees VALUES (1, 'John Doe', 50000);
```

**Managed Table Drop Karne ka Syntax:**

```sql
DROP TABLE managed_table_name;
```

---

### **3. Unmanaged Tables**

**Unmanaged Tables** (ya External Tables) wo tables hain jinka data external storage systems mein stored hota hai, jaise Azure Data Lake Storage (ADLS) ya Amazon S3. Unmanaged tables ka metadata Databricks ke dwara manage hota hai, par data ko Databricks ke dwara nahi control kiya jata. Agar aap unmanaged table ko drop karte hain, to sirf metadata delete hota hai, lekin data storage par waise hi rahta hai.

**Unmanaged Table Create Karne ka Syntax:**

```sql
CREATE TABLE unmanaged_table_name (
    column1_name DATA_TYPE,
    column2_name DATA_TYPE
) USING DELTA LOCATION 'path_to_data';
```

**Example:**

```sql
CREATE TABLE sales (
    order_id INT,
    amount FLOAT
) USING DELTA LOCATION 'abfss://<container>@<account>.dfs.core.windows.net/sales_data/';
```

**Unmanaged Table Drop Karne ka Syntax:**

```sql
DROP TABLE unmanaged_table_name;
```

---

### **4. Key Differences Between Managed and Unmanaged Tables**

| Feature                 | Managed Tables                         | Unmanaged Tables                         |
|-------------------------|---------------------------------------|------------------------------------------|
| Data Management         | Databricks ke dwara manage hota hai   | External storage mein stored hota hai    |
| Data Deletion           | Drop karne par data bhi delete hota hai | Drop karne par sirf metadata delete hota hai |
| Use Case                | Simpler use cases, data ko Databricks ke control mein rakhna | Large datasets ya existing external data ko access karne ke liye |
| Location                | Managed by Databricks                 | Explicitly specify karna hota hai        |

---

### **Conclusion**

Is section mein, humne Databricks par databases aur tables ko manage karne ke tareeqe dekhe, including the differences between managed and unmanaged tables. In concepts ko samajhna aapko data organization aur retrieval mein madad karega, aur aapke data engineering tasks ko streamline karega.
