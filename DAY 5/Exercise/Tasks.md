### **1. Filter and Aggregate on Join Results using SQL**
- Task: Join the `Orders` and `Customers` tables to find the total order amount per customer and filter out customers who have spent less than $1,000.

### **2. Cumulative Aggregations and Ranking in SQL Queries**
- Task: Create a cumulative sum of the `OrderAmount` for each customer to track the running total of how much each customer has spent.

### **3. OVER and PARTITION BY Clause in SQL Queries**
- Task: Rank the customers based on the total amount they have spent, partitioned by city.

### **4. Total Aggregation using OVER and PARTITION BY in SQL Queries**
- Task: Calculate the total amount of all orders (overall total) and the percentage each customer's total spending contributes to the overall total.

### **5. Ranking in SQL**
- Task: Rank all customers based on the total amount they have spent, without partitioning.

Here are additional tasks that build on the concepts of filtering, aggregating, ranking, and window functions in SQL:

### **6. Task: Calculate the Average Order Amount per City**
- Task: Write a query that joins the `Orders` and `Customers` tables, calculates the average order amount for each city, and orders the results by the average amount in descending order.

### **7. Task: Find Top N Customers by Total Spending**
- Task: Write a query to find the top 3 customers who have spent the most, using `ORDER BY` and `LIMIT`.

### **8. Task: Calculate Yearly Order Totals**
- Task: Write a query that groups orders by year (using `OrderDate`), calculates the total amount of orders for each year, and orders the results by year.

### **9. Task: Calculate the Rank of Customers by Total Order Amount**
- Task: Write a query that ranks customers by their total spending, but only for customers located in "Mumbai". The rank should reset for each customer in "Mumbai".

### **10. Task: Compare Each Customer's Total Order to the Average Order Amount**
- Task: Write a query that calculates each customer's total order amount and compares it to the average order amount for all customers.
