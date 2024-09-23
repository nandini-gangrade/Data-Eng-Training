### **Hands-On Lab: Data Processing with Python**

In this hands-on lab, we'll focus on using **NumPy** for numerical computing and **Pandas** for data manipulation. We'll also explore how to load datasets, clean and preprocess data, perform simple data analysis tasks, merge datasets, and handle errors and exceptions in Python.

---

### **1. NumPy for Numerical Computing**
**NumPy** is a powerful Python library for numerical computing, especially for working with arrays and matrices. 

#### Example: Creating and Manipulating NumPy Arrays

```python
import numpy as np

# Creating a NumPy array
arr = np.array([1, 2, 3, 4, 5])

# Performing mathematical operations
print(arr * 2)  # Multiply each element by 2
print(np.mean(arr))  # Calculate mean
print(np.sum(arr))  # Calculate sum
```

---

### **2. Using Pandas for Data Manipulation**
Pandas is widely used for data manipulation and analysis. Let's see how we can create and manipulate DataFrames.

#### Example: Creating and Modifying a Pandas DataFrame

```python
import pandas as pd

# Creating a DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie'],
    'Age': [25, 30, 35],
    'City': ['New York', 'Los Angeles', 'Chicago']
}
df = pd.DataFrame(data)

# Display DataFrame
print(df)

# Add a new column
df['Salary'] = [50000, 60000, 70000]
print(df)
```

---

### **3. Loading and Exploring Datasets with Pandas**
We'll load a dataset from a CSV file and explore it using basic Pandas functions.

```python
# Loading dataset from a CSV file
df = pd.read_csv('your_dataset.csv')

# Exploring the dataset
print(df.head())  # Display first 5 rows
print(df.info())  # Information about columns and data types
print(df.describe())  # Summary statistics for numerical columns
```

---

### **4. Data Cleaning and Preprocessing using Pandas**
Data cleaning involves handling missing values, correcting data types, and removing duplicates.

```python
# Handling missing values
df.fillna(0, inplace=True)  # Replace NaN with 0
df.dropna(inplace=True)  # Drop rows with missing values

# Correcting data types
df['Date'] = pd.to_datetime(df['Date'])

# Removing duplicates
df.drop_duplicates(inplace=True)
```

---

### **5. Simple Data Analysis Tasks with Python**
Now let's perform some basic data analysis tasks like finding the mean, median, and grouping data.

```python
# Calculating mean and median
print(df['Age'].mean())  # Mean age
print(df['Salary'].median())  # Median salary

# Grouping data by city and finding the mean salary
grouped_df = df.groupby('City')['Salary'].mean()
print(grouped_df)
```

---

### **6. Merging and Transforming Datasets with Pandas**
We'll learn how to merge two datasets and transform the resulting DataFrame.

```python
# Merging two DataFrames
df1 = pd.DataFrame({'ID': [1, 2, 3], 'Name': ['John', 'Jane', 'Mike']})
df2 = pd.DataFrame({'ID': [1, 2, 4], 'Salary': [50000, 60000, 70000]})

# Performing an inner join on 'ID'
merged_df = pd.merge(df1, df2, on='ID', how='inner')
print(merged_df)

# Transforming data by adding a new column
merged_df['Salary_in_thousands'] = merged_df['Salary'] / 1000
print(merged_df)
```

---

### **7. Error Handling and Exception in Python**
Error handling in Python is done using `try`, `except`, and `finally` blocks to ensure the program doesn’t crash when an error occurs.

#### Example: Handling Division by Zero Error

```python
try:
    x = 10 / 0
except ZeroDivisionError as e:
    print(f"Error: {e}")
finally:
    print("This block executes no matter what.")
```
