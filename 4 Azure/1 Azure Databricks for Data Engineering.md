### **Azure Databricks for Data Engineering**

Azure Databricks ek powerful analytics platform hai jo Apache Spark ke upar build kiya gaya hai. Ye data engineering, data science, aur machine learning tasks ko perform karne ke liye ek collaborative environment provide karta hai.

---

### **1. Introduction to Databricks**

Databricks ek unified analytics platform hai jo data engineering aur data science ke processes ko streamline karta hai. Iska main focus data lake aur data warehouse ke beech data ko efficiently process karna hai.

#### Key Features:
- **Collaborative Workspace**: Multiple users ek hi notebook par kaam kar sakte hain.
- **Integrated with Azure**: Azure ke saath seamless integration, jisse data storage aur compute resources easily manage ho sakte hain.
- **Auto-scaling**: Clusters automatically scale hote hain workload ke hisaab se.

---

### **2. Setting Up Azure Databricks Workspace**

**Workspace Create Karna:**

1. **Azure Portal** par login karein.
2. **Create a resource** par click karein.
3. "Databricks" search karein aur Databricks service ko select karein.
4. Workspace ka naam, subscription, resource group, aur location fill karein.
5. "Create" par click karein.

---

### **3. Configuring Clusters**

Clusters configure karne se aapko compute resources milte hain jisse aap Spark jobs run kar sakte hain.

**Cluster Create Karna:**

1. Databricks workspace mein navigate karein.
2. "Clusters" tab par click karein.
3. "Create Cluster" par click karein.
4. Cluster ka naam, node type, aur number of workers specify karein.
5. "Create Cluster" par click karein.

---

### **4. Hands-on Exercise: Creating a Databricks Notebook**

1. **Notebook Create Karna**:
   - Databricks workspace par jayein.
   - "Workspace" section mein right-click karein aur "Create" > "Notebook" select karein.
   - Notebook ka naam aur language (Python, Scala, SQL, etc.) select karein.

2. **Code likhna**:
   - Notebook mein code likhein aur execute karein.
   - Results ko visualize karne ke liye graphs aur charts ka use karein.

#### Example: Simple DataFrame Creation

```python
# PySpark DataFrame create karna
data = [("Alice", 1), ("Bob", 2), ("Cathy", 3)]
df = spark.createDataFrame(data, ["Name", "ID"])
df.show()
```

---

### **5. Hands-on Exercise: Implementing Databricks for Real-Time Data Processing**

**Real-Time Data Processing Setup**:

1. **Streaming Data Source**:
   - Kafka, Azure Event Hubs, ya socket streaming ke through real-time data ingest karein.

2. **DataFrame Streaming**:
   - Spark Structured Streaming ka use karke data process karein.

#### Example: Streaming Data from a Socket

```python
# Socket se streaming data read karna
streaming_df = spark.readStream.format("socket").option("host", "localhost").option("port", 9999).load()

# Processed data ko query karna
query = streaming_df.writeStream.outputMode("append").format("console").start()
query.awaitTermination()
```

3. **Results Visualize Karna**:
   - Streamed data ko console par display karein ya kisi dashboard par visualize karein.

---

### **Conclusion**

Is section mein, humne Azure Databricks ka overview, workspace aur clusters kaise set up karte hain, notebooks create karne ka process, aur real-time data processing ke liye hands-on exercises cover kiye. Azure Databricks aapko data engineering aur analytics tasks ko efficiently execute karne ke liye ek powerful platform provide karta hai, jisse aap easily data ko process, analyze, aur visualize kar sakte hain.

---

### **Data Exploration and Visualization in Databricks**

Azure Databricks mein data exploration aur visualization ke tools aapko apne data ko samajhne aur insights nikalne mein madad karte hain. Is section mein, hum exploratory data analysis (EDA) aur data visualization ke processes ko cover karenge.

---

### **1. Exploratory Data Analysis (EDA) in Databricks**

**EDA ka Maqsad:**
Exploratory Data Analysis ka main maqsad data ki structure, patterns, aur relationships ko samajhna hai. Iske liye aapko summary statistics, data distributions, aur relationships ka analysis karna hota hai.

**Steps for EDA:**

1. **Data Load Karna:**
   - Data ko DataFrame mein load karna.

   ```python
   # Sample data load karna
   df = spark.read.csv("path/to/data.csv", header=True, inferSchema=True)
   ```

2. **Basic Statistics:**
   - DataFrame ki basic statistics nikalna.

   ```python
   # Descriptive statistics
   df.describe().show()
   ```

3. **Data Types aur Null Values:**
   - Data types check karna aur missing values identify karna.

   ```python
   # Data types aur null values
   df.printSchema()
   df.select([F.count(F.when(F.col(c).isNull(), c)).alias(c) for c in df.columns]).show()
   ```

4. **Data Distribution:**
   - Histogram aur box plots ke through data distribution samajhna.

---

### **2. Hands-on Exercise: Visualizing Data in Databricks**

**Data Visualization Tools:**
Databricks mein data visualization ke liye built-in charting capabilities hain, jisse aap easily data ko visualize kar sakte hain.

**Common Visualization Techniques:**

1. **Line Chart:**
   - Time series data ko visualize karne ke liye line charts ka use hota hai.

   ```python
   # Line chart plot karna
   display(df.groupBy("date_column").agg(F.sum("value_column").alias("total_value")))
   ```

2. **Bar Chart:**
   - Categorical data ko compare karne ke liye bar charts useful hote hain.

   ```python
   # Bar chart plot karna
   display(df.groupBy("category_column").agg(F.count("id_column").alias("count")))
   ```

3. **Scatter Plot:**
   - Do continuous variables ke beech relationship dikhane ke liye scatter plots ka use hota hai.

   ```python
   # Scatter plot create karna
   display(df.select("feature1", "feature2"))
   ```

4. **Box Plot:**
   - Data distribution aur outliers ko dikhane ke liye box plots helpful hote hain.

   ```python
   # Box plot create karna
   display(df.select("value_column").describe())
   ```

---

### **Conclusion**

Is section mein, humne Azure Databricks mein exploratory data analysis (EDA) ke steps aur data visualization techniques ko cover kiya. EDA se aap data ke patterns aur relationships ko samajh sakte hain, jabki visualization se aap apne findings ko effectively present kar sakte hain. Databricks ke built-in visualization tools ki madad se aap data ko asani se explore aur visualize kar sakte hain, jisse aapko better insights milte hain.

---

### **Mounting ADLS and S3 to Databricks**

Azure Databricks mein Azure Data Lake Storage (ADLS) aur Amazon S3 ko mount karna aapko data access aur analysis ko aasaan banata hai. Is process se aap in storage services ke data ko directly Databricks notebooks se access kar sakte hain.

---

### **1. Mounting Azure Data Lake Storage (ADLS) to Databricks**

**Prerequisites:**
- Azure subscription.
- Databricks workspace.
- ADLS Gen1 or Gen2 account with appropriate permissions.

**Step-by-Step Process:**

1. **Generate Access Credentials:**
   - Azure portal par jayein aur ADLS storage account ke access keys ko note karein.

2. **Spark Configuration:**
   - Databricks notebook mein ADLS ko mount karne ke liye Spark configuration set karein.

   ```python
   spark.conf.set("fs.azure.account.key.<storage-account-name>.dfs.core.windows.net", "<access-key>")
   ```

3. **Mounting the ADLS:**
   - Databricks par ADLS ko mount karne ke liye code likhein.

   ```python
   dbutils.fs.mount(
       source = "abfss://<container-name>@<storage-account-name>.dfs.core.windows.net/",
       mount_point = "/mnt/adls",
       extra_configs = {"<conf-key>": "<conf-value>"}
   )
   ```

4. **Verify the Mount:**
   - Verify karein ki ADLS successfully mount hua hai.

   ```python
   display(dbutils.fs.ls("/mnt/adls"))
   ```

---

### **2. Mounting Amazon S3 to Databricks**

**Prerequisites:**
- AWS account.
- S3 bucket with data.
- AWS access key and secret key.

**Step-by-Step Process:**

1. **Set Up Spark Configuration:**
   - S3 ko access karne ke liye AWS access credentials ko configure karein.

   ```python
   spark.conf.set("fs.s3a.access.key", "<your-access-key>")
   spark.conf.set("fs.s3a.secret.key", "<your-secret-key>")
   ```

2. **Mounting the S3 Bucket:**
   - Databricks par S3 bucket ko mount karne ke liye code likhein.

   ```python
   dbutils.fs.mount(
       source = "s3a://<bucket-name>",
       mount_point = "/mnt/s3",
       extra_configs = {}
   )
   ```

3. **Verify the Mount:**
   - Verify karein ki S3 bucket successfully mount hua hai.

   ```python
   display(dbutils.fs.ls("/mnt/s3"))
   ```

---

### **Conclusion**

Is process se aap ADLS aur S3 ko Databricks mein mount karke in data sources se asani se data access kar sakte hain. Mounting se aapko direct file system path ke zariye data ko read aur write karne ki flexibility milti hai, jisse aap data engineering aur analytics tasks ko efficiently perform kar sakte hain.

---

### **Reading and Writing Data in Databricks**

Databricks par data ko efficiently read aur write karne ke liye kai formats aur techniques hain. Is section mein, hum various data formats, notebook execution, aur data ingestion processes ko cover karenge.

---

### **1. Big Data Formats**

Databricks multiple big data formats ko support karta hai, jo large datasets ke liye optimized hain:

- **CSV**: Simple aur widely used format, lekin schema enforcement nahi hota.
- **JSON**: Hierarchical data representation, suitable for semi-structured data.
- **Parquet**: Columnar storage format, jisse performance aur storage efficiency badhti hai.
- **Delta Table**: ACID transactions, schema enforcement, aur time travel features ke saath enhanced data management.

---

### **2. Run One Notebook from Another**

Databricks mein aap ek notebook se doosre notebook ko run kar sakte hain, jo workflows ko automate karne mein madad karta hai.

**Notebook Run Karna:**

```python
# Another notebook run karna
%run /path/to/another_notebook
```

---

### **3. Databricks Ingestion**

Databricks par data ko ingest karne ke liye various methods available hain:

- **File Upload**: Databricks workspace par files upload karke read kiya ja sakta hai.
- **Cloud Storage**: S3, ADLS jaise cloud storage se direct access.

---

### **4. Read Data from Various Formats**

Aap different formats se data read kar sakte hain:

- **CSV:**

  ```python
  df_csv = spark.read.csv("path/to/data.csv", header=True, inferSchema=True)
  ```

- **JSON:**

  ```python
  df_json = spark.read.json("path/to/data.json")
  ```

- **Parquet:**

  ```python
  df_parquet = spark.read.parquet("path/to/data.parquet")
  ```

- **Table:**

  ```python
  df_table = spark.table("table_name")
  ```

- **Delta Table:**

  ```python
  df_delta = spark.read.format("delta").load("path/to/delta_table")
  ```

---

### **5. Write Data to Various Formats**

Aap data ko different formats mein write kar sakte hain:

- **CSV:**

  ```python
  df.write.csv("path/to/output.csv", header=True)
  ```

- **JSON:**

  ```python
  df.write.json("path/to/output.json")
  ```

- **Parquet:**

  ```python
  df.write.parquet("path/to/output.parquet")
  ```

- **Delta Table:**

  ```python
  df.write.format("delta").save("path/to/delta_table")
  ```

---

### **6. Writing DataFrame to Delta Table**

Delta Table mein data write karna aapko efficient data management aur ACID transactions ki capabilities deta hai.

**Writing DataFrame to Delta Table:**

```python
# DataFrame ko Delta Table mein likhna
df.write.format("delta").mode("overwrite").saveAsTable("delta_table_name")
```

---

### **Conclusion**

Is section mein, humne data ko Databricks mein kaise read aur write kiya jata hai, various big data formats, aur notebooks ko execute karne ke methods ko cover kiya. Databricks ki flexibility aur scalability se aap large datasets ko efficiently manage kar sakte hain, jo analytics aur data processing tasks ke liye beneficial hai.

---

### **Hands-on Exercise: Analyzing and Visualizing Streaming Data with Databricks**

Is exercise mein, hum streaming data ko analyze aur visualize karne ka process dekhenge. Databricks ki streaming capabilities ka istemal karke, hum real-time data processing aur visualization ka experience le sakte hain.

---

### **1. Set Up Streaming Data Source**

Sabse pehle, humein ek streaming data source set up karna hoga. Yahan hum Apache Kafka ya socket stream ka istemal kar sakte hain.

**Example: Socket Stream**

```python
# Socket stream se data read karna
streaming_df = spark.readStream.format("socket").option("host", "localhost").option("port", 9999).load()
```

---

### **2. Data Processing**

Data stream ko process karna zaroori hai taaki hum meaningful insights nikal sakein. Aap kuch transformations apply kar sakte hain, jaise filtering ya aggregation.

**Example: Data Processing**

```python
from pyspark.sql.functions import *

# Data processing: Example transformation
processed_df = streaming_df.selectExpr("CAST(value AS STRING)").groupBy("value").count()
```

---

### **3. Writing Stream to Sink**

Ab humein processed stream ko kisi sink par write karna hoga. Hum results ko console par display kar sakte hain ya Delta Table mein store kar sakte hain.

**Example: Writing to Console**

```python
# Console par results write karna
query = processed_df.writeStream.outputMode("complete").format("console").start()
```

---

### **4. Visualizing Streaming Data**

Streaming data ko visualize karne ke liye, hum Delta Table ka istemal karte hue visualization tools ka use kar sakte hain.

1. **Writing to Delta Table:**

   ```python
   # Writing stream to Delta Table
   processed_df.writeStream.format("delta").outputMode("append").option("checkpointLocation", "/path/to/checkpoint").start("/path/to/delta_table")
   ```

2. **Querying Delta Table:**

   Notebook ke ek alag cell mein, Delta Table se data ko query karein:

   ```python
   df_delta = spark.read.format("delta").load("/path/to/delta_table")
   ```

3. **Visualizing with Databricks:**

   Aap now Delta Table ka istemal karke visualization kar sakte hain. For example, aap bar chart ya line chart create kar sakte hain:

   ```python
   display(df_delta)
   ```

   Phir "Visualization" tab par jayein aur chart type select karein, jisse aapko real-time analytics dikhaye ja sake.

---

### **5. Stop the Streaming Query**

Jab aap apne streaming analysis ko complete kar lein, to streaming query ko stop karna mat bhooliyega.

```python
query.stop()
```

---

### **Conclusion**

Is exercise mein, humne streaming data ko Databricks par kaise analyze aur visualize kiya, including setting up a streaming source, processing the data, writing to a sink, and visualizing the results. Databricks ki powerful streaming capabilities se aap real-time data ko analyze karne aur insights nikalne mein kaafi madad kar sakte hain, jo modern data applications ke liye zaroori hai.
