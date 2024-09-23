### **Views in Databricks**

Views ek virtual table hoti hain jo query results ko represent karti hain. Yeh actual data ko store nahi karti, balki underlying tables ya data sources se data ko dynamically fetch karti hain. Databricks mein teen prakar ke views hain: Views, Temporary Views, aur Global Temporary Views.

---

### **1. Views**

**Views** ek logical representation hai underlying table ya tables ke data ki. Jab aap view create karte hain, to aap ek SQL query define karte hain jo underlying data ko fetch karegi. Views ko use karke aap complex queries ko simplify kar sakte hain aur data access ko control kar sakte hain.

**View Create Karne ka Syntax:**

```sql
CREATE VIEW view_name AS
SELECT column1, column2
FROM table_name
WHERE condition;
```

**Example:**

```sql
CREATE VIEW employee_view AS
SELECT name, salary
FROM employees
WHERE salary > 50000;
```

**View Query Karne ka Example:**

```sql
SELECT * FROM employee_view;
```

**View Drop Karne ka Syntax:**

```sql
DROP VIEW view_name;
```

---

### **2. Temporary Views**

**Temporary Views** woh views hain jo session-specific hote hain. Yeh views sirf us session ke dauran available hote hain jismein yeh create kiye gaye hain. Jaise hi session end hota hai, temporary views automatically delete ho jate hain.

**Temporary View Create Karne ka Syntax:**

```sql
CREATE OR REPLACE TEMP VIEW temp_view_name AS
SELECT column1, column2
FROM table_name;
```

**Example:**

```sql
CREATE OR REPLACE TEMP VIEW temp_employee_view AS
SELECT name, salary
FROM employees
WHERE department = 'Sales';
```

**Temporary View Query Karne ka Example:**

```sql
SELECT * FROM temp_employee_view;
```

---

### **3. Global Temporary Views**

**Global Temporary Views** bhi session-specific hote hain, lekin yeh kisi bhi session se accessible hote hain jab tak aap explicitly inhe drop nahi karte. Yeh views `global_temp` database ke andar store hote hain.

**Global Temporary View Create Karne ka Syntax:**

```sql
CREATE OR REPLACE GLOBAL TEMP VIEW global_temp_view_name AS
SELECT column1, column2
FROM table_name;
```

**Example:**

```sql
CREATE OR REPLACE GLOBAL TEMP VIEW global_temp_employee_view AS
SELECT name, salary
FROM employees;
```

**Global Temporary View Query Karne ka Example:**

```sql
SELECT * FROM global_temp.global_temp_employee_view;
```

**Global Temporary View Drop Karne ka Syntax:**

```sql
DROP VIEW global_temp.global_temp_view_name;
```

---

### **Key Differences Between Views, Temporary Views, and Global Temporary Views**

| Feature                  | View                               | Temporary View                         | Global Temporary View                   |
|--------------------------|------------------------------------|---------------------------------------|-----------------------------------------|
| Scope                    | Database-wide                       | Session-specific                      | Accessible from any session             |
| Data Persistence         | Persists until dropped              | Persists until session ends           | Persists until dropped                  |
| Location                 | Stored in the database              | Not stored; exists in memory          | Stored in `global_temp` database        |
| Usage                    | For shared access across sessions    | For short-term operations within a session | For sharing data across sessions       |

---

### **Conclusion**

Is section mein, humne views, temporary views, aur global temporary views ko detail mein dekha. In views ka istemal karke aap data retrieval ko simplify kar sakte hain aur data access ko control kar sakte hain, jo data analysis aur reporting ke liye behad useful hota hai.
