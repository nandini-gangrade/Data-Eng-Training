### **Pandas for Data Processing**
Pandas ek powerful tool hai jo tabular data ke processing aur manipulation mein help karta hai. Yeh data ko efficient tarike se handle aur process karta hai, especially jab CSV, Excel, ya SQL data ke saath kaam karna ho.

### **1. Reading CSV Data using Pandas**
Pandas mein CSV file ko read karne ke liye **`read_csv()`** method ka use hota hai.

```python
import pandas as pd

# Reading CSV file into a Pandas DataFrame
df = pd.read_csv('data.csv')

# Displaying the first 5 rows
print(df.head())
```

### **2. Read Data from CSV Files to Pandas Dataframes**
Agar aapke paas ek ya zyada CSV files hain, aap inhe Pandas DataFrames mein load kar sakte ho. Yeh tabular format mein data ko handle karna easy banata hai.

```python
# Read CSV file
df = pd.read_csv('data.csv')

# Display the DataFrame structure
print(df.info())
```

### **3. Filter Data in Pandas DataFrame using `query()`**
Pandas ke **`query()`** function ka use kar ke aap apne DataFrame se condition-based filtering kar sakte ho.

```python
# Filter rows where 'Age' > 30
filtered_df = df.query('Age > 30')
print(filtered_df)
```

### **4. Get Count by Status using Pandas DataFrame APIs**
Agar aapko kisi specific status ya condition ke according row count nikalna ho toh `value_counts()` function use kar sakte ho.

```python
# Count of different status values
status_count = df['Status'].value_counts()
print(status_count)
```

### **5. Get Count by Month and Status using Pandas DataFrame APIs**
Agar aapko month aur status ke basis par count chahiye, toh groupby aur aggregation ka use karna padta hai.

```python
# Convert the date column to datetime type if not already
df['Date'] = pd.to_datetime(df['Date'])

# Extract month from date
df['Month'] = df['Date'].dt.month

# Group by Month and Status, then count rows
count_by_month_status = df.groupby(['Month', 'Status']).size().reset_index(name='Count')
print(count_by_month_status)
```

### **6. Create DataFrames using Dynamic Column List on CSV Data**
Agar aapko CSV file ke specific columns ko select karna hai, toh column names ka dynamic list bana ke use kar sakte ho.

```python
# Define a list of columns dynamically
columns_to_use = ['Name', 'Age', 'Status']

# Create DataFrame using only these columns
df = pd.read_csv('data.csv', usecols=columns_to_use)
print(df.head())
```

### **7. Performing Inner Join between Pandas DataFrames**
**Inner join** ka use kar ke aap do ya zyada DataFrames ko common columns ke basis par merge kar sakte ho.

```python
# DataFrame 1
df1 = pd.DataFrame({
    'ID': [1, 2, 3],
    'Name': ['John', 'Jane', 'Mike']
})

# DataFrame 2
df2 = pd.DataFrame({
    'ID': [1, 2, 4],
    'Salary': [50000, 60000, 70000]
})

# Performing inner join on 'ID'
merged_df = pd.merge(df1, df2, on='ID', how='inner')
print(merged_df)
```

### **8. Perform Aggregations on Join Results**
Agar aap join ke results pe aggregation operations perform karna chahte ho, jaise sum, mean, count, etc., toh Pandas aggregation functions ka use kar sakte ho.

```python
# Sum of salaries for the merged DataFrame
salary_sum = merged_df['Salary'].sum()
print("Total Salary:", salary_sum)
```

### **9. Sort Data in Pandas DataFrames**
Pandas mein sorting karne ke liye **`sort_values()`** function ka use hota hai. Aap ek ya zyada columns ke basis par data ko sort kar sakte ho.

```python
# Sorting the DataFrame by Age
sorted_df = df.sort_values(by='Age')
print(sorted_df)
```

### **10. Writing Pandas DataFrames to Files**
Pandas mein processed DataFrames ko files mein write kar sakte ho, jaise CSV ya Excel formats mein.

```python
# Writing DataFrame to CSV file
df.to_csv('output.csv', index=False)
```

### **11. Write Pandas DataFrames to JSON Files**
Agar aapko DataFrame ko JSON file mein convert karna hai, toh **`to_json()`** method ka use hota hai.

```python
# Writing DataFrame to JSON file
df.to_json('output.json', orient='records', lines=True)
``` 

Pandas ke in APIs ka use kar ke aap efficient data processing, manipulation, aur analysis kar sakte ho, jo data handling ko easy aur fast bana deta hai.
