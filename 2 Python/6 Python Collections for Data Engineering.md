### File I/O using Python:
Python mein **file input-output (I/O)** ka use data ko files se read aur write karne ke liye hota hai. Common operations:
- `open()`: File ko open karna
- `read()`: File se data read karna
- `write()`: File mein data likhna
- `close()`: File close karna

Example:
```python
# Writing to a file
file = open("data.txt", "w")
file.write("Hello, Python!")
file.close()

# Reading from a file
file = open("data.txt", "r")
content = file.read()
print(content)  # Output: Hello, Python!
file.close()
```

---

### Read Data from CSV File into Python List:
CSV (Comma-Separated Values) file se data ko read karke Python list mein store karne ke liye `csv` module ka use hota hai.

Example:
```python
import csv

with open('data.csv', 'r') as file:
    reader = csv.reader(file)
    data = list(reader)  # CSV data as list
print(data)
```

---

### Processing Python Lists:
Python lists ko process karna matlab data ko modify ya manipulate karna. Common operations hain adding, removing, sorting, slicing, etc.

Example:
```python
my_list = [5, 3, 9, 2]
my_list.sort()  # Sorting list
print(my_list)  # Output: [2, 3, 5, 9]
```

---

### Lambda Functions in Python:
**Lambda functions** ek short anonymous function hota hai jo ek hi expression ko execute karta hai.

Example:
```python
add = lambda x, y: x + y
print(add(3, 5))  # Output: 8
```

---

### Usage of Lambda Functions:
Lambda functions ka use quick and temporary functions create karne ke liye hota hai, especially jab ek hi baar use karna ho.

Example:
```python
nums = [1, 2, 3, 4]
squares = list(map(lambda x: x**2, nums))
print(squares)  # Output: [1, 4, 9, 16]
```

---

### Filter Data in Python Lists using `filter()` and Lambda:
**Filter** function lambda ke saath use hota hai list mein se specific condition meet karne wale elements ko extract karne ke liye.

Example:
```python
nums = [1, 2, 3, 4, 5, 6]
even_nums = list(filter(lambda x: x % 2 == 0, nums))
print(even_nums)  # Output: [2, 4, 6]
```

---

### Get Unique Values from List using `map()` and `set()`:
**`set()`** ka use karke list ke unique values ko extract kiya jata hai, aur `map()` list ke elements ko transform karta hai.

Example:
```python
nums = [1, 2, 3, 2, 4, 4, 5]
unique_nums = set(map(lambda x: x, nums))
print(unique_nums)  # Output: {1, 2, 3, 4, 5}
```

---

### Sort Python Lists using `key`:
Python lists ko specific `key` function ke basis par sort kiya jata hai. For example, sorting by length of strings.

Example:
```python
names = ['Alice', 'Bob', 'Charlie']
names.sort(key=lambda x: len(x))
print(names)  # Output: ['Bob', 'Alice', 'Charlie']
```

---

### Overview of JSON Strings and Files:
**JSON (JavaScript Object Notation)** ek data format hai jo human-readable aur machine-readable hota hai. Python mein JSON data ko easily parse aur generate kiya ja sakta hai.

---

### Read JSON Strings to Python Dicts or Lists:
`json` module ka use karke JSON strings ko Python dictionaries ya lists mein convert karte hain.

Example:
```python
import json

json_string = '{"name": "John", "age": 30}'
data = json.loads(json_string)
print(data)  # Output: {'name': 'John', 'age': 30}
```

---

### Read JSON Schemas from File to Python Dicts:
Aap JSON schema ko file se read karke Python dictionaries mein store kar sakte ho.

Example:
```python
with open('schema.json', 'r') as file:
    schema = json.load(file)
print(schema)
```

---

### Processing JSON Data using Python:
JSON data ko load karne ke baad usse manipulate ya process kar sakte hain jaise kisi normal Python dictionary ko process karte hain.

---

### Extract Details from Complex JSON Arrays using Python:
Complex JSON arrays se specific data ko extract karne ke liye aap keys ka reference karte ho.

Example:
```python
data = {
    "employees": [
        {"name": "John", "age": 30},
        {"name": "Jane", "age": 25}
    ]
}
for employee in data['employees']:
    print(employee['name'])
# Output: John, Jane
```

---

### Sort Data in JSON Arrays using Python:
JSON arrays ko sort karna possible hai using custom `key` functions.

Example:
```python
data = {
    "employees": [
        {"name": "John", "age": 30},
        {"name": "Jane", "age": 25}
    ]
}
sorted_data = sorted(data['employees'], key=lambda x: x['age'])
print(sorted_data)
```

---

### Create Function to Get Column Details from Schemas JSON File:
Aap ek function bana sakte ho jo JSON schema se column details extract kare.

Example:
```python
def get_column_details(schema):
    return schema.get('columns', [])

schema = {
    "columns": ["name", "age", "salary"]
}
print(get_column_details(schema))  # Output: ['name', 'age', 'salary']
```

---

### Lists and Tuples in Python:
- **Lists**: Mutable sequences hain, jo add, modify, remove kar sakte ho.
- **Tuples**: Immutable sequences hain, jinka data change nahi kar sakte.

Example:
```python
# List
my_list = [1, 2, 3]
my_list[0] = 10

# Tuple
my_tuple = (1, 2, 3)
# my_tuple[0] = 10  # Error: Tuples are immutable
```

---

### Enriching Data using NumPy & Pandas:
**NumPy** aur **Pandas** Python mein powerful libraries hain data ko efficiently process karne ke liye:
- **NumPy**: Numerical data ko handle karta hai with arrays.
- **Pandas**: DataFrames provide karta hai jo structured tabular data ko handle karta hai.

Example:
```python
import numpy as np
import pandas as pd

# NumPy Array
array = np.array([1, 2, 3, 4])
print(array)

# Pandas DataFrame
data = {'Name': ['John', 'Jane'], 'Age': [30, 25]}
df = pd.DataFrame(data)
print(df)
``` 

These libraries data analysis aur manipulation ke liye bahut effective hain, especially large datasets ke liye.
