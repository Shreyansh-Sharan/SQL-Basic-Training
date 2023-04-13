/*
1- write a sql to get all the orders where customers name has "a" as second character and "d" as fourth character (58 rows)

2- write a sql to get all the orders placed in the month of dec 2020 (352 rows) 

3- write a query to get all the orders where ship_mode is neither in 'Standard Class' nor in 'First Class' and ship_date is after nov 2020 (944 rows)

4- write a query to get all the orders where customer name neither start with "A" and nor ends with "n" (9815 rows)

5- write a query to get all the orders where profit is negative (1871 rows)

6- write a query to get all the orders where either quantity is less than 3 or profit is 0 (3348)

7- your manager handles the sales for South region and he wants you to create a report of all the orders in his region where some discount is provided to the customers (815 rows)

8- write a query to find top 5 orders with highest sales in furniture category 

9- write a query to find all the records in technology and furniture category for the orders placed in the year 2020 only (1021 rows)

10-write a query to find all the orders where order date is in year 2020 but ship date is in 2021 (33 rows)
*/
USE SQLPRACTICE;

-- SOLUTION 1
SELECT * FROM dbo.orders WHERE customer_name LIKE '_a_d%';

-- SOLUTION 2
SELECT * FROM dbo.orders where order_date >= '2020-12-01' and order_date <'2021-01-01';

-- SOLUTION 3
SELECT * FROM dbo.orders Where ship_mode NOT IN ('Standard Class','First Class') and ship_date >'2020-11-30';

-- SOLUTION 4
SELECT * FROM dbo.orders WHERE customer_name NOT LIKE 'A%n';

-- SOLUTION 5
SELECT * FROM dbo.orders WHERE profit < 0;

-- SOLUTION 6
SELECT * FROM dbo.orders WHERE quantity < 3 or profit = 0;

--SOLUTION 7
SELECT * FROM dbo.orders WHERE region = 'South' and discount >0;

--SOLUTION 8 
SELECT top 5 * FROM dbo.orders WHERE category = 'Furniture' ORDER BY sales DESC;  

-- SOLUTION 9 
SELECT * FROM dbo.orders WHERE category IN ('Furniture','Technology') and DATEPART(year,order_date) = 2020;

-- SOLUTION 10
SELECT * FROM dbo.orders WHERE DATEPART(year,order_date) = 2020 and DATEPART(year,ship_date)=2021;