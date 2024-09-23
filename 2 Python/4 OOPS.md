# OOPS (Object-Oriented Programming System):
**OOPS** ek programming paradigm hai jo objects aur classes ke concept par based hota hai. Isme real-world entities ko code mein represent kiya jata hai using objects. OOPS ke 4 main principles hain:
1. **Encapsulation**: Data aur methods ko ek single unit mein bind karna.
2. **Abstraction**: Complex details ko hide kar ke sirf essential features show karna.
3. **Inheritance**: Ek class ka doosri class se properties aur methods inherit karna.
4. **Polymorphism**: Ek function ya method ka different forms mein act karna.

---

### Class and Object:
**Class** ek blueprint hota hai jo objects banata hai. **Object** us class ka instance hota hai.

Example:
```python
class Car:
    def __init__(self, brand, model):
        self.brand = brand
        self.model = model

car1 = Car("Toyota", "Corolla")
print(car1.brand)  # Output: Toyota
```

- **Class**: Yeh ek template hai jo properties aur methods define karta hai.
- **Object**: Class ka ek instance jo actual data hold karta hai.

---

### Access Specifiers:
**Access specifiers** ka use data ko control karne ke liye hota hai ki wo class ke bahar se access ho sake ya nahi. Python mein 3 types ke access specifiers hote hain:
1. **Public** (`self.variable`): Class ke andar aur bahar dono se access ho sakte hain.
2. **Protected** (`self._variable`): Class aur uske subclasses ke andar access ho sakte hain.
3. **Private** (`self.__variable`): Sirf class ke andar hi access ho sakte hain.

Example:
```python
class Person:
    def __init__(self, name):
        self.name = name  # Public
        self._age = 25  # Protected
        self.__salary = 50000  # Private
```

---

### Constructor:
**Constructor** ek special method hota hai jo object create hote hi automatically call hota hai. Python mein constructor ko `__init__()` ke naam se jaana jata hai.

Example:
```python
class Dog:
    def __init__(self, breed, color):
        self.breed = breed
        self.color = color

dog1 = Dog("Labrador", "Black")
print(dog1.breed)  # Output: Labrador
```

---

### Inheritance:
**Inheritance** ek class ke properties aur methods ko doosri class mein reuse karne ka concept hai. Isme ek class doosri class se data aur behavior inherit kar sakti hai.

Example:
```python
class Animal:
    def sound(self):
        print("This is an animal sound")

class Dog(Animal):  # Inheriting Animal class
    def sound(self):
        print("Bark")

dog = Dog()
dog.sound()  # Output: Bark
```

---

### Polymorphism:
**Polymorphism** ka matlab hai "many forms". Python mein ek function ya method different types ke objects par different behavior show kar sakta hai.

Example:
```python
class Bird:
    def fly(self):
        print("Bird can fly")

class Penguin(Bird):
    def fly(self):
        print("Penguins cannot fly")

bird = Bird()
penguin = Penguin()
bird.fly()      # Output: Bird can fly
penguin.fly()   # Output: Penguins cannot fly
```

---

### Method Overriding:
**Method overriding** inheritance ka part hai jisme subclass apne parent class ke method ko redefine karta hai apne specific behavior ke liye.

Example:
```python
class Parent:
    def display(self):
        print("This is parent class")

class Child(Parent):
    def display(self):
        print("This is child class")

child = Child()
child.display()  # Output: This is child class
```

---

### File Handling:
**File handling** ka use data ko files mein store karne ya waha se retrieve karne ke liye hota hai. Python mein `open()`, `read()`, `write()`, and `close()` functions ka use hota hai.

Example:
```python
# Writing to a file
file = open("example.txt", "w")
file.write("Hello, Python!")
file.close()

# Reading from a file
file = open("example.txt", "r")
content = file.read()
print(content)  # Output: Hello, Python!
file.close()
```

---

### Exception Handling:
**Exception handling** ka use runtime errors ko handle karne ke liye hota hai. Python mein exceptions ko handle karne ke liye `try-except` blocks ka use hota hai.

Example:
```python
try:
    result = 10 / 0
except ZeroDivisionError:
    print("Cannot divide by zero!")
finally:
    print("This will always execute.")
```

In the example above, agar error aati hai toh `except` block execute hoga, aur `finally` block hamesha execute hota hai, chahe exception aaye ya na aaye.

