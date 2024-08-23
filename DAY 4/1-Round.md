### **Apply a 15% discount, round the discounted price to 2 decimal places, and show both the ceiling and floor values of the final discounted price.**

```sql
SELECT 
    ProductID, 
    Price, 
    ROUND(Price * 0.85, 2) AS DiscountedPrice,  -- Applying a 15% discount and rounding to 2 decimal places
    CEILING(Price * 0.85) AS CeilingPrice,      -- Calculating the ceiling of the discounted price
    FLOOR(Price * 0.85) AS FloorPrice           -- Calculating the floor of the discounted price
FROM 
    Productss;                                  -- Replace 'Productss' with your actual table name if different
```

### Explanation of the Query:

1. **`ROUND(Price * 0.85, 2)`**:
   - **Calculation**: This calculates the price after applying a 15% discount (`Price * 0.85`).
   - **Rounding**: The `ROUND` function is used to round the discounted price to 2 decimal places.
   
2. **`CEILING(Price * 0.85)`**:
   - This function returns the smallest integer greater than or equal to the discounted price. It effectively rounds up to the nearest whole number.
   
3. **`FLOOR(Price * 0.85)`**:
   - This function returns the largest integer less than or equal to the discounted price. It effectively rounds down to the nearest whole number.
