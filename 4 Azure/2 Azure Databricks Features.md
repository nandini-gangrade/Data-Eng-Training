### **Azure Databricks Features**

Azure Databricks ek unified analytics platform hai jo Apache Spark par based hai. Yeh data engineering, data science, aur machine learning tasks ko streamline karta hai. Is section mein, hum Databricks Delta Lake aur uski features ko detail mein dekhenge.

---

### **1. Introduction to Databricks Delta Lake**

Delta Lake ek open-source storage layer hai jo data lakes ko ACID transactions, schema enforcement, aur time travel features ke sath enhance karta hai. Isse aapko data reliability aur consistency milti hai, jo data analytics aur machine learning ke liye zaroori hai.

---

### **2. Database vs Data Warehouse vs Data Lake vs Delta Lake**

- **Database**: Structured data ko store karne ke liye, jahan data retrieval aur transactions par focus hota hai.
- **Data Warehouse**: Structured data ko historical analysis ke liye store karta hai, jahan OLAP queries perform ki jati hain.
- **Data Lake**: Raw, unstructured, ya semi-structured data ko store karta hai. Yahan data ko koi specific schema nahi hota.
- **Delta Lake**: Data lake ka evolution, jo ACID transactions aur schema enforcement ko support karta hai, isse reliability aur data quality improve hoti hai.

---

### **3. Creating Delta Table Using 3 Methods**

Aap Delta Tables ko create karne ke liye kai methods use kar sakte hain:

**Method 1: Using DataFrame API**

```python
# DataFrame se Delta Table create karna
df.write.format("delta").save("/path/to/delta_table")
```

**Method 2: Using SQL Command**

```sql
-- SQL command se Delta Table create karna
CREATE TABLE delta_table_name
USING delta
LOCATION '/path/to/delta_table';
```

**Method 3: Using Spark SQL**

```python
# Spark SQL se Delta Table create karna
spark.sql("CREATE TABLE delta_table_name USING delta LOCATION '/path/to/delta_table'")
```

---

### **4. Merge and Upsert (SCD)**

Delta Lake mein merge aur upsert operations ko easily implement kiya ja sakta hai, jo Slowly Changing Dimensions (SCD) manage karne mein madad karta hai.

```python
# Merge operation
from delta.tables import *

deltaTable = DeltaTable.forPath(spark, "/path/to/delta_table")
deltaTable.alias("target").merge(
    source_df.alias("source"),
    "target.id = source.id"
).whenMatchedUpdateAll().whenNotMatchedInsertAll().execute()
```

---

### **5. Internals of Delta Table**

Delta Tables ka internal structure metadata aur transaction logs ko use karta hai. Yeh logs ACID transactions aur data versioning ko manage karte hain, jisse aapko data consistency aur reliability milti hai.

---

### **6. Optimize Delta Table**

Delta Lake tables ko optimize karna zaroori hai taaki performance enhance ho sake. Aap `OPTIMIZE` command ka use karke table ko optimize kar sakte hain.

```sql
OPTIMIZE delta_table_name
```

---

### **7. Time Travel, Z-Ordering, Vacuum**

- **Time Travel**: Yeh feature aapko previous versions of data ko access karne ki facility deta hai. Aap snapshot timestamp ya version number se data ko retrieve kar sakte hain.
  
  ```python
  df_time_travel = spark.read.format("delta").option("timestampAsOf", "2023-09-01").load("/path/to/delta_table")
  ```

- **Z-Ordering**: Yeh performance ko improve karne ke liye data ko physically sort karta hai, taaki queries fast ho sakein.

  ```sql
  OPTIMIZE delta_table_name ZORDER BY (column_name)
  ```

- **Vacuum**: Yeh command old data files ko remove karne mein madad karta hai, taaki storage space free ho sake.

  ```sql
  VACUUM delta_table_name RETAIN 168 HOURS
  ```

---

### **8. Hands-on Exercise: Using Delta Lake for Data Versioning**

Is exercise mein, aap Delta Lake ka istemal karke data versioning ko implement karenge. Steps:

1. **Create a Delta Table** using any of the methods mentioned above.
2. **Insert some data** into the Delta Table.
3. **Update some records** to see versioning in action.
4. **Query previous versions** using time travel.

---

### **9. Hands-on Exercise: Building a Reliable Data Lake with Databricks Delta Lake**

In this exercise, you will:

1. **Set up a data lake** using Delta Lake.
2. **Ingest data** from various sources (e.g., CSV, JSON).
3. **Perform transformations** using Spark.
4. **Write data to Delta Tables** and utilize features like upsert and time travel.

---

### **Conclusion**

Is section mein, humne Azure Databricks ke Delta Lake ke features ko detail mein dekha, including its architecture, data management capabilities, and practical exercises for hands-on learning. Delta Lake se aapko data integrity, reliability, aur efficiency milti hai, jo modern data solutions ke liye zaroori hai.

