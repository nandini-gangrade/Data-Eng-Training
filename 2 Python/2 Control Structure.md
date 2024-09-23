### If Statement:
**If statement** ka use conditional logic implement karne ke liye hota hai. Agar condition true hoti hai, toh uske andar ka code execute hota hai.

Example:
```python
age = 18
if age >= 18:
    print("You are an adult.")
```

### If-Else Statement:
**If-else statement** mein agar condition false hoti hai, toh else block ka code execute hota hai.

Example:
```python
age = 16
if age >= 18:
    print("You are an adult.")
else:
    print("You are a minor.")
```

### If-Elif-Else Statement:
**If-elif-else statement** ka use multiple conditions check karne ke liye hota hai. Agar pehli condition false hoti hai, toh next condition check hoti hai.

Example:
```python
marks = 75
if marks >= 90:
    print("Grade: A")
elif marks >= 75:
    print("Grade: B")
else:
    print("Grade: C")
```

### Control Structure:
**Control structures** programming mein flow ko control karte hain. Yeh statements ko order aur conditions ke according execute karne mein madad karte hain.

### For Loop:
**For loop** ka use sequence (jaise list ya string) ke elements par iterate karne ke liye hota hai.

Example:
```python
fruits = ["apple", "banana", "cherry"]
for fruit in fruits:
    print(fruit)
```

### While Loop:
**While loop** tab tak code execute karta hai jab tak condition true hoti hai. Iska use jab unknown number of iterations honi chahiye tab hota hai.

Example:
```python
count = 0
while count < 5:
    print(count)
    count += 1
```

### Nested Loop:
**Nested loop** ek loop ke andar doosra loop hota hai. Iska use multi-dimensional data structures ke liye hota hai.

Example:
```python
for i in range(3):  # Outer loop
    for j in range(2):  # Inner loop
        print(f"i: {i}, j: {j}")
```

### Break, Continue & Pass:
- **Break**: Yeh loop ko instantly terminate karne ke liye use hota hai.
  
  Example:
  ```python
  for i in range(5):
      if i == 3:
          break
      print(i)  # Output: 0, 1, 2
  ```

- **Continue**: Yeh current iteration ko skip karne ke liye use hota hai aur next iteration par chala jata hai.

  Example:
  ```python
  for i in range(5):
      if i == 3:
          continue
      print(i)  # Output: 0, 1, 2, 4
  ```

- **Pass**: Yeh placeholder ke liye use hota hai jab aapko koi statement likhna nahi hota, lekin syntax ki zarurat hoti hai.

  Example:
  ```python
  for i in range(5):
      if i == 3:
          pass  # Nothing happens
      print(i)  # Output: 0, 1, 2, 3, 4
  ```

### Input and Output:
Python mein input lene ke liye `input()` function use hota hai aur output dene ke liye `print()` function.

Example:
```python
name = input("Enter your name: ")
print("Hello, " + name)
```

### Introduction to Lists:
**Lists** Python mein ordered collection hain jisme multiple items ko store kiya ja sakta hai. Aap lists ko square brackets (`[]`) se define karte ho.

Example:
```python
numbers = [1, 2, 3, 4, 5]
```

### List Methods and Slicing:
**List methods**: Python mein lists ke liye kai methods hain, jaise:
- `append()`: Item add karne ke liye.
- `remove()`: Item remove karne ke liye.
- `sort()`: List ko sort karne ke liye.

**Slicing**: Iska use list ke part ko access karne ke liye hota hai.

Example:
```python
fruits = ["apple", "banana", "cherry"]
print(fruits[1:3])  # Output: ['banana', 'cherry']
```

### Introduction to Dictionaries & Dictionary Methods:
**Dictionaries** key-value pairs ka collection hote hain. Yeh unordered hote hain aur curly braces (`{}`) se define kiye jate hain.

Example:
```python
student = {"name": "Nandini", "age": 23}
```

**Dictionary methods**:
- `get()`: Value ko retrieve karne ke liye.
- `keys()`: Sab keys ko list mein return karne ke liye.
- `values()`: Sab values ko list mein return karne ke liye.

### Introduction to Set & Set Methods:
**Sets** unique elements ka collection hote hain aur unordered hote hain. Yeh curly braces (`{}`) se define kiye jate hain.

Example:
```python
fruits = {"apple", "banana", "cherry"}
```

**Set methods**:
- `add()`: Element add karne ke liye.
- `remove()`: Element remove karne ke liye.
- `union()`: Do sets ka union lene ke liye.

### Introduction to Map & Map Methods:
**Map** function ka use iterable (jaise list) par function apply karne ke liye hota hai. Yeh har element par function ko apply karta hai aur result ko return karta hai.

Example:
```python
def square(x):
    return x * x

numbers = [1, 2, 3, 4]
squared_numbers = list(map(square, numbers))  # Output: [1, 4, 9, 16]
```

Yeh sab basic concepts hain jo Python programming ko samajhne mein madad karte hain!
