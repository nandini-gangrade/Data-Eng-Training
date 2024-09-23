### Mapping Function:
**Mapping function** Python mein `map()` function ka use karke ek function ko iterable (jaise list) ke har element par apply karte hain, aur result return hota hai. Iska fayda yeh hai ki aap ek hi operation ko ek saath multiple values par apply kar sakte ho.

Example:
```python
def square(x):
    return x * x

numbers = [1, 2, 3, 4]
squared_numbers = list(map(square, numbers))  # Output: [1, 4, 9, 16]
```

### String Function:
Python mein **string functions** strings ke sath kaam karne ke liye bohot useful hote hain. Kuch common string functions yeh hain:
- `len()`: String ki length batata hai.
- `upper()`: String ko uppercase mein convert karta hai.
- `lower()`: String ko lowercase mein convert karta hai.
- `replace()`: String mein ek substring ko doosri substring se replace karta hai.

Example:
```python
name = "Python Programming"
print(name.upper())  # Output: PYTHON PROGRAMMING
```

### Number Function:
Python mein **number functions** numeric values par operations perform karte hain. Kuch common number functions yeh hain:
- `abs()`: Ek number ka absolute value return karta hai.
- `pow(x, y)`: x ko y power tak raise karta hai (i.e., x^y).
- `round()`: Ek number ko nearest integer ya specified decimal places tak round karta hai.

Example:
```python
print(abs(-5))  # Output: 5
print(pow(2, 3))  # Output: 8
```

### Date and Time Function:
**Date and time functions** ka use date aur time ke sath kaam karne ke liye hota hai. Yeh `datetime` module mein available hote hain. 

Example:
```python
import datetime
current_time = datetime.datetime.now()
print(current_time)  # Output: 2024-09-23 12:30:45.3456
```

Common functions:
- `today()`: Current date ko return karta hai.
- `strftime()`: Date aur time ko specific format mein convert karta hai.

### Python Functions:
**Functions** Python mein code ko reusable aur organized banane ke liye use hote hain. Function ko define karne ke liye `def` keyword ka use hota hai.

Example:
```python
def greet(name):
    return f"Hello, {name}!"

print(greet("Nandini"))  # Output: Hello, Nandini!
```

### Default Argument Values:
Agar function mein koi argument pass nahi kiya jata toh **default argument value** use hoti hai. Yeh tab helpful hoti hai jab kuch arguments optional hote hain.

Example:
```python
def greet(name="Guest"):
    return f"Hello, {name}!"

print(greet())  # Output: Hello, Guest!
```

### Keyword Arguments:
**Keyword arguments** ka use function ko call karte waqt argument ke naam ke sath specific value pass karne ke liye hota hai. Isse arguments ka order important nahi hota.

Example:
```python
def describe_pet(animal_type, pet_name):
    print(f"I have a {animal_type} named {pet_name}.")

describe_pet(animal_type="dog", pet_name="Buddy")
```

### Special Parameters:
Python functions mein **special parameters** ka use kar ke aap positional aur keyword arguments ke rules define kar sakte ho. Yeh kuch features Python 3.8 se introduce kiye gaye hain:
- `/`: Iska use positional-only parameters ke liye hota hai.
- `*`: Iska use keyword-only parameters ke liye hota hai.

Example:
```python
def function(pos1, /, pos2, *, key1):
    return pos1, pos2, key1

print(function(10, 20, key1=30))
```

### Arbitrary Argument Lists:
Agar aapko function mein unknown number of arguments pass karne hain, toh **arbitrary argument list** ka use hota hai (`*args`). Yeh function ko variable number of positional arguments accept karne deta hai.

Example:
```python
def sum_all(*numbers):
    return sum(numbers)

print(sum_all(1, 2, 3, 4))  # Output: 10
```

### Lambda Expressions:
**Lambda expressions** ek anonymous function define karne ka tarika hai, jo ek line mein likha ja sakta hai. Iska syntax `lambda` keyword se start hota hai, followed by inputs aur expression.

Example:
```python
square = lambda x: x * x
print(square(5))  # Output: 25
```

Yeh lambda functions short aur temporary operations ke liye helpful hote hain, jaha aapko ek-line functions chahiye hote hain.
