### **PySpark Programming**

**PySpark** Apache Spark ka Python API hai, jo Python programmers ko Spark ki power ko use karke big data processing aur analysis karne ki facility deta hai. Is section mein, hum PySpark ke introduction, environment setup, aur basic programming exercises cover karenge.

---

### **1. Introduction to PySpark and Setting Up the Environment**

**PySpark** ko use karne ke liye pehle aapko kuch dependencies install karne padenge. Yeh installation process typically Apache Spark, Hadoop, aur Python ko include karta hai.

#### Environment Setup Steps:

1. **Java Installation**:
   - Spark ko chalane ke liye Java Development Kit (JDK) install karna zaroori hai. Ensure karein ke aapke system mein Java 8 ya 11 installed ho.

   ```bash
   sudo apt install openjdk-8-jdk
   ```

2. **Apache Spark Download**:
   - Apache Spark ko [official website](https://spark.apache.org/downloads.html) se download karein. Aap pre-built version for Hadoop ka selection kar sakte hain.

3. **Set Up Environment Variables**:
   - Downloaded Spark folder ka path set karein. Aapko `SPARK_HOME` aur `PATH` variables set karne honge.

   ```bash
   export SPARK_HOME=/<path-to-spark-directory>
   export PATH=$PATH:$SPARK_HOME/bin
   ```

4. **Install PySpark**:
   - Aap PySpark ko pip ke through install kar sakte hain:

   ```bash
   pip install pyspark
   ```

5. **Verify Installation**:
   - Installation ke baad, aap PySpark shell ko launch karke verify kar sakte hain:

   ```bash
   pyspark
   ```

---

### **2. Hands-on Exercise: Writing Basic PySpark Programs**

Ab hum basic PySpark program likhenge jo RDDs aur DataFrames ke saath kaam karega.

#### Example 1: Creating an RDD

```python
from pyspark import SparkContext

# SparkContext create karna
sc = SparkContext("local", "Basic RDD Example")

# RDD create karna
data = [1, 2, 3, 4, 5]
rdd = sc.parallelize(data)

# RDD par operations karna
squared_rdd = rdd.map(lambda x: x ** 2)
print(squared_rdd.collect())  # Output: [1, 4, 9, 16, 25]

# SparkContext stop karna
sc.stop()
```

#### Example 2: Creating a DataFrame

```python
from pyspark.sql import SparkSession

# SparkSession create karna
spark = SparkSession.builder.appName("DataFrame Example").getOrCreate()

# DataFrame create karna
data = [("Alice", 1), ("Bob", 2), ("Cathy", 3)]
columns = ["Name", "Id"]
df = spark.createDataFrame(data, columns)

# DataFrame ka display
df.show()

# SparkSession stop karna
spark.stop()
```

---

### **3. Hands-on Exercise: Analyzing a Sample Dataset Using PySpark**

Ab hum ek sample dataset ka analysis karte hain. Hum ek CSV file ko load karke kuch basic operations perform karenge.

#### Example: Analyzing a CSV Dataset

```python
from pyspark.sql import SparkSession

# SparkSession create karna
spark = SparkSession.builder.appName("CSV Analysis").getOrCreate()

# CSV file ko load karna
df = spark.read.csv("sample_data.csv", header=True, inferSchema=True)

# DataFrame ka summary dekhna
df.printSchema()
df.show()

# Data Analysis: Count records
record_count = df.count()
print(f"Total Records: {record_count}")

# Group by aur aggregation
grouped_data = df.groupBy("column_name").count()
grouped_data.show()

# SparkSession stop karna
spark.stop()
```

### **Conclusion**

Is section mein, humne PySpark ke introduction, environment setup, aur basic programming exercises dekhi. PySpark powerful tools aur APIs provide karta hai jo data processing aur analysis ko efficient banata hai. Aap RDDs aur DataFrames ke through data ko handle kar sakte hain, jo ki big data applications ke liye bahut useful hote hain. Is tarah, aap PySpark ki capabilities ko explore kar sakte hain aur large datasets par analysis kar sakte hain.

---

### **RDDs and Transformations in PySpark**

**RDDs (Resilient Distributed Datasets)** PySpark ka fundamental data structure hain. Yeh distributed collections hain jo fault-tolerant aur immutable hain. RDDs par various transformations aur actions perform kiye ja sakte hain. Transformations lazy operations hoti hain jo RDDs ko modify karne ke liye use hoti hain, lekin actual execution tab hoti hai jab aap action perform karte hain.

---

### **Key Concepts of RDDs**

1. **Immutable**: RDDs ko create karne ke baad change nahi kiya ja sakta. Aap un par transformations perform karke naye RDDs create karte hain.
  
2. **Fault Tolerance**: Agar kisi worker node par error aata hai, to Spark data ko recover kar sakta hai using lineage information.

3. **Distributed**: RDDs distributed manner mein process kiye jaate hain, jo parallel processing ko enable karta hai.

---

### **Transformations in PySpark**

Transformations ke kuch common types hain:

- **map()**: Har element par function apply karke naye RDD create karta hai.
- **filter()**: RDD se elements ko filter karta hai jo specified condition ko satisfy nahi karte.
- **flatMap()**: Elements ko flatten karke naye RDD banata hai.
- **reduceByKey()**: Key-value pairs ko combine karta hai ek key ke liye value ko aggregate karne ke liye.
- **groupByKey()**: Key-value pairs ko key ke hisaab se group karta hai.

---

### **Hands-on Exercise: Transforming Data with PySpark RDDs**

Is exercise mein, hum RDDs ka use karte hue data ko transform karne ke kuch examples dekhenge.

#### Step 1: SparkContext Setup

```python
from pyspark import SparkContext

# SparkContext create karna
sc = SparkContext("local", "RDD Transformations Example")
```

#### Step 2: Creating an RDD

```python
# Sample data
data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# RDD create karna
rdd = sc.parallelize(data)
```

#### Step 3: Applying Transformations

1. **Using map()**:
   - Har element ko square karna.

   ```python
   squared_rdd = rdd.map(lambda x: x ** 2)
   print("Squared RDD:", squared_rdd.collect())
   ```

2. **Using filter()**:
   - Even numbers ko filter karna.

   ```python
   even_rdd = rdd.filter(lambda x: x % 2 == 0)
   print("Even Numbers:", even_rdd.collect())
   ```

3. **Using flatMap()**:
   - List of lists ko flatten karna.

   ```python
   data_list = [[1, 2, 3], [4, 5], [6, 7, 8, 9]]
   flat_rdd = sc.parallelize(data_list).flatMap(lambda x: x)
   print("Flattened RDD:", flat_rdd.collect())
   ```

4. **Using reduceByKey()**:
   - Key-value pairs ko aggregate karna.

   ```python
   pairs = [("a", 1), ("b", 2), ("a", 3), ("b", 4)]
   pairs_rdd = sc.parallelize(pairs)
   reduced_rdd = pairs_rdd.reduceByKey(lambda x, y: x + y)
   print("Reduced RDD:", reduced_rdd.collect())
   ```

5. **Using groupByKey()**:
   - Key-value pairs ko group karna.

   ```python
   grouped_rdd = pairs_rdd.groupByKey()
   print("Grouped RDD:")
   for item in grouped_rdd.collect():
       print(item)
   ```

#### Step 4: Stop SparkContext

```python
# SparkContext stop karna
sc.stop()
```

### **Conclusion**

Is exercise mein, humne PySpark RDDs aur unki transformations ke baare mein seekha. RDDs powerful data structures hain jo distributed computing ko enable karte hain. Transformations jaise `map`, `filter`, `flatMap`, `reduceByKey`, aur `groupByKey` aapko data manipulation aur analysis karne ki flexibility dete hain. Aap in transformations ko apne projects mein use karke large datasets par effective data processing kar sakte hain.

---

### **DataFrames in PySpark**

**DataFrames** PySpark ka ek high-level abstraction hai jo structured data ko tabular format mein represent karta hai. DataFrames ka use karke aap data manipulation aur analysis ko bahut aasaan aur efficient tarike se kar sakte hain.

---

### **Creating DataFrames in PySpark**

DataFrames ko create karne ke liye aap multiple sources se data load kar sakte hain, jaise CSV files, JSON files, databases, etc.

#### Example: Creating a DataFrame from a CSV File

```python
from pyspark.sql import SparkSession

# SparkSession create karna
spark = SparkSession.builder.appName("DataFrame Example").getOrCreate()

# CSV file se DataFrame create karna
df = spark.read.csv("sample_data.csv", header=True, inferSchema=True)

# DataFrame ka display
df.show()
```

### **Looking at Data in DataFrames**

DataFrames ko inspect karne ke liye aap kuch methods use kar sakte hain:

- **show()**: DataFrame ke first few rows display karta hai.
- **printSchema()**: DataFrame ki schema ko print karta hai.
- **describe()**: Summary statistics provide karta hai.

```python
df.printSchema()
df.describe().show()
```

### **Selecting, Renaming, Filtering Data in a DataFrame**

1. **Selecting Columns**:

```python
selected_df = df.select("column1", "column2")
selected_df.show()
```

2. **Renaming Columns**:

```python
renamed_df = df.withColumnRenamed("old_column_name", "new_column_name")
renamed_df.show()
```

3. **Filtering Data**:

```python
filtered_df = df.filter(df["column_name"] > 10)
filtered_df.show()
```

### **Manipulating Data in DataFrames**

- **Dropping Columns**:

```python
dropped_df = df.drop("unwanted_column")
dropped_df.show()
```

- **Sorting Data**:

```python
sorted_df = df.sort("column_name", ascending=False)
sorted_df.show()
```

- **Aggregations**:

```python
from pyspark.sql import functions as F

agg_df = df.groupBy("group_column").agg(F.count("column_name").alias("count"))
agg_df.show()
```

### **Joining DataFrames**

DataFrames ko join karne ke liye aap `join()` method use kar sakte hain.

```python
joined_df = df1.join(df2, on="common_column", how="inner")
joined_df.show()
```

### **Handling Null Values**

Aap null values ko handle karne ke liye methods use kar sakte hain:

- **Drop Null Values**:

```python
cleaned_df = df.na.drop()
cleaned_df.show()
```

- **Fill Null Values**:

```python
filled_df = df.na.fill({"column_name": "default_value"})
filled_df.show()
```

### **Window Functions**

Window functions advanced analytical queries ko perform karne ke liye use hote hain.

```python
from pyspark.sql import Window

window_spec = Window.partitionBy("partition_column").orderBy("order_column")
df.withColumn("rank", F.rank().over(window_spec)).show()
```

### **Date and Time Functions**

Pandas mein date and time functions ka istemal karne ke liye aap `pyspark.sql.functions` se date functions ka use kar sakte hain.

```python
from pyspark.sql.functions import current_date, date_format

df.withColumn("current_date", current_date()).show()
df.withColumn("formatted_date", date_format("date_column", "MM-dd-yyyy")).show()
```

### **Applying Functions in a DataFrame**

Aap custom functions ko DataFrames par apply karne ke liye `udf` (User Defined Functions) ka use kar sakte hain.

```python
from pyspark.sql.functions import udf
from pyspark.sql.types import StringType

def custom_function(value):
    return value.upper()

# UDF create karna
custom_udf = udf(custom_function, StringType())

df.withColumn("new_column", custom_udf(df["column_name"])).show()
```

### **Hands-on Exercise: Working with DataFrames**

Is exercise mein, aapko apne data par transformations aur actions perform karne honge. Aapko ek sample CSV file load karni hai aur upar diye gaye operations ko apply karna hai.

1. **CSV file ko load karein.**
2. **Columns select karein aur rename karein.**
3. **Data filter karein aur null values handle karein.**
4. **Aggregation aur sorting perform karein.**
5. **Join do DataFrames.**

### **Creating Widgets**

Widgets ka use data visualization tools mein interactivity add karne ke liye hota hai. Agar aap Jupyter notebooks ya kisi data visualization tool mein kaam kar rahe hain, to aap widgets create kar sakte hain:

```python
# Example in Jupyter Notebook
from ipywidgets import interact

def f(x):
    print(x)

interact(f, x=10);
```

### **Conclusion**

Is section mein, humne PySpark DataFrames ke baare mein seekha. DataFrames structured data manipulation ke liye powerful tools hain, jo aapko data cleaning, transformation, aggregation, aur analysis karne ki flexibility dete hain. Aap in techniques ko use karke apne data projects ko efficiently manage kar sakte hain.

---

### **PySpark Overview: Data Ingestion and Transformation**

In this section, we will explore how to ingest various data formats like CSV and JSON into a data lake using PySpark, perform transformations, create views, and implement ETL processes.

---

### **1. Ingestion of CSV and JSON Files into Data Lake**

**Ingesting CSV Files:**

CSV files ko parquet format mein convert karne ke liye, aapko pehle unhe load karna hoga.

```python
from pyspark.sql import SparkSession

# Spark session create karna
spark = SparkSession.builder.appName("Data Ingestion").getOrCreate()

# CSV file se DataFrame create karna
csv_df = spark.read.csv("path/to/csv_file.csv", header=True, inferSchema=True)

# DataFrame ko parquet format mein save karna
csv_df.write.parquet("path/to/data_lake/csv_data.parquet")
```

**Ingesting JSON Files:**

Simple aur complex JSON files ko load karne ka tarika thoda similar hai.

```python
# Simple JSON file se DataFrame create karna
json_df = spark.read.json("path/to/simple_json_file.json")

# Complex JSON ko flatten karna aur save karna
complex_json_df = spark.read.json("path/to/complex_json_file.json")
complex_json_df.write.parquet("path/to/data_lake/complex_json_data.parquet")
```

---

### **2. Transformations in PySpark**

**Common Transformations:**

1. **Filter**:

```python
filtered_df = csv_df.filter(csv_df["column_name"] > 100)
```

2. **Join**:

```python
joined_df = csv_df.join(json_df, on="common_column", how="inner")
```

3. **Simple Aggregations**:

```python
agg_df = csv_df.groupBy("group_column").agg({"value_column": "sum"})
```

4. **GroupBy**:

```python
grouped_df = csv_df.groupBy("group_column").count()
```

5. **Window Functions**:

```python
from pyspark.sql import Window
from pyspark.sql import functions as F

window_spec = Window.partitionBy("category").orderBy("value")
ranked_df = csv_df.withColumn("rank", F.rank().over(window_spec))
```

---

### **3. Creating Local and Temporary Views**

Local aur temporary views create karne se aap SQL queries run kar sakte hain.

```python
# Local view create karna
csv_df.createOrReplaceTempView("csv_view")

# SQL query run karna
result_df = spark.sql("SELECT * FROM csv_view WHERE column_name > 100")
result_df.show()
```

---

### **4. Spark SQL: Creating Databases, Tables, and Views**

**Creating a Database:**

```python
spark.sql("CREATE DATABASE IF NOT EXISTS my_database")
```

**Creating a Table:**

```python
spark.sql("""
CREATE TABLE my_database.my_table (
    column1 INT,
    column2 STRING
)
USING parquet
""")
```

**Creating Views in Spark SQL:**

```python
spark.sql("CREATE OR REPLACE TEMP VIEW my_temp_view AS SELECT * FROM my_database.my_table")
```

---

### **5. Implementing Full Refresh and Incremental Load Patterns**

**Full Refresh**:

Full refresh mein aap purani data ko overwrite karte hain.

```python
csv_df.write.mode("overwrite").parquet("path/to/data_lake/csv_data.parquet")
```

**Incremental Load**:

Incremental load mein sirf naye records ko process kiya jaata hai. Yeh partitions ka istemal karke kiya ja sakta hai.

```python
incremental_df = spark.read.parquet("path/to/data_lake/csv_data.parquet").filter("load_date > last_processed_date")
incremental_df.write.mode("append").parquet("path/to/data_lake/incremental_data.parquet")
```

---

### **Hands-on Exercises**

**1. Processing JSON and CSV Data with PySpark:**

- Load a sample CSV and JSON file.
- Perform filtering, aggregation, and joins.
- Save the processed data as parquet files.

**2. ETL (Extract, Transform, Load) with PySpark:**

- Extract data from CSV and JSON files.
- Transform the data using various transformations.
- Load the processed data into a data lake in parquet format.

---

### **Conclusion**

Is section mein, humne PySpark ka use karke data ingestion, transformation, SQL operations, aur ETL processes ke baare mein seekha. PySpark powerful tools provide karta hai jo aapko large datasets ke saath efficiently kaam karne ki flexibility dete hain, jisse aap apne data lakes mein structured data ko manage kar sakte hain.
