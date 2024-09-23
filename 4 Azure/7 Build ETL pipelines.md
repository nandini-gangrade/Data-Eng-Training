### **Building ETL Pipelines in Databricks**

ETL (Extract, Transform, Load) pipelines ek aisi process hain jisse data ko source se extract kiya jata hai, us par transformations apply kiye jate hain, aur phir transformed data ko target database ya data lake mein load kiya jata hai. Is section mein hum ADLS se data extract karne, Databricks mein transformations perform karne, aur data ko database mein write karne ka process dekhenge.

---

### **1. Extracting Data from ADLS to Databricks**

Azure Data Lake Storage (ADLS) se data extract karna ek common step hai ETL process mein. Databricks ko ADLS se connect karne ke liye, aapko storage account ka URL aur credentials ka istemal karna hoga.

**Steps to Extract Data:**

1. **Mount ADLS Storage:**
   Pehle, aapko ADLS ko Databricks workspace mein mount karna hoga. Iske liye aapko storage account details aur authentication key chahiye.

   ```python
   dbutils.fs.mount(
       source = "abfss://<container-name>@<storage-account-name>.dfs.core.windows.net/",
       mount_point = "/mnt/adls",
       extra_configs = {"<conf-key>":dbutils.secrets.get(scope = "<scope-name>", key = "<key-name>")}
   )
   ```

2. **Read Data:**
   Mount karne ke baad, aap data ko read kar sakte hain.

   ```python
   df = spark.read.csv("/mnt/adls/path/to/data.csv", header=True, inferSchema=True)
   ```

---

### **2. Transformations in Databricks Using Python or SQL**

Data transform karna ETL pipeline ka crucial step hai, jisme aap data ko clean, filter, aur modify karte hain. Aap Python (PySpark) ya SQL ka istemal karke transformations perform kar sakte hain.

**Using Python (PySpark):**

- **Data Cleaning:**
  ```python
  cleaned_df = df.dropna()  # Missing values remove karna
  ```

- **Filtering:**
  ```python
  filtered_df = cleaned_df.filter(cleaned_df['column_name'] > threshold_value)
  ```

- **Aggregation:**
  ```python
  aggregated_df = filtered_df.groupBy("group_column").agg({"value_column": "sum"})
  ```

**Using SQL:**

Agar aap SQL istemal karna chahte hain, to aapko DataFrame ko temporary view ke roop mein register karna hoga.

```python
df.createOrReplaceTempView("data_table")

result_df = spark.sql("""
    SELECT column_name, SUM(value_column) as total_value
    FROM data_table
    WHERE condition
    GROUP BY column_name
""")
```

---

### **3. Writing Data Back to Database**

Transformed data ko database mein load karne ke liye, aap Spark ke DataFrame write method ka istemal kar sakte hain. Aapko database connection details aur write options specify karne honge.

**Steps to Write Data:**

1. **Define Database Connection:**
   Database connection ke liye JDBC URL aur credentials set karein.

   ```python
   jdbc_url = "jdbc:sqlserver://<server-name>:<port>;database=<database-name>"
   properties = {
       "user": "<username>",
       "password": "<password>",
       "driver": "com.microsoft.sqlserver.jdbc.SQLServerDriver"
   }
   ```

2. **Write Data:**
   Data ko target table mein write karna.

   ```python
   aggregated_df.write.jdbc(url=jdbc_url, table="target_table", mode="overwrite", properties=properties)
   ```

**Modes of Writing:**
- **append:** Existing records ke saath data add karega.
- **overwrite:** Existing data ko replace karega.
- **ignore:** Agar table exist karta hai, to write nahi karega.
- **error:** Default mode, agar table exist karta hai, to error throw karega.

---

### **Conclusion**

ETL pipelines ko build karna ek systematic process hai jisme data ko source se extract karke, transformations apply kiye jate hain, aur phir data ko target database ya data lake mein load kiya jata hai. Databricks ki madad se aap is process ko efficiently automate aur manage kar sakte hain, jisse aap timely insights aur data-driven decisions le sakte hain.
