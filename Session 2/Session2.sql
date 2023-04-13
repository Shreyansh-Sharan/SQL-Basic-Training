-- 1- write a update statement to update city as null for order ids :  CA-2020-161389 , US-2021-156909
Update DBO.orders
SET city = null where Order_id IN ('CA-2020-161389','US-2021-156909');

-- 2- write a query to find orders where city is null (2 rows)
SELECT * FROM DBO.orders Where city IS NULL;

-- 3- write a query to get total profit, first order date and latest order date for each category
SELECT Category ,SUM(profit) as TOTAL_PROFIT, MIN(order_date) as First_order, max(order_date) as latest_order
FROM dbo.orders GROUP BY category;

-- 4- write a query to find sub-categories where average profit is more than the half of the max profit in that sub-category
select sub_category
from orders
group by sub_category
having avg(profit) > max(profit)/2;

-- 5- create the exams table with below script;
create table exams (student_id int, subject varchar(20), marks int);

insert into exams values (1,'Chemistry',91),(1,'Physics',91),(1,'Maths',92)
,(2,'Chemistry',80),(2,'Physics',90)
,(3,'Chemistry',80),(3,'Maths',80)
,(4,'Chemistry',71),(4,'Physics',54)
,(5,'Chemistry',79);

-- write a query to find students who have got same marks in Physics and Chemistry.
SELECT * FROM exams;
SELECT student_id,marks,count(marks) as Occurence FROM EXAMS WHERE subject in ('Physics','Chemistry')
GROUP BY student_id,marks
having count(marks)=2;

-- 6- write a query to find total number of products in each category.
SELECT TOP 10 * FROM dbo.orders;
SELECT count(distinct product_id), Category 
FROM dbo.orders 
GROUP BY Category;

-- 7- write a query to find top 5 sub categories in west region by total quantity sold
SELECT top 5 sub_category, sum(quantity) as total_sold
FROM dbo.orders WHERE region = 'west'
Group By sub_category order by total_sold DESC; 



-- 8- write a query to find total sales for each region and ship mode combination for orders in year 2020
SELECT sum(sales),region,ship_mode FROM dbo.orders
WHERE DATEPART(year,order_date) = '2020'
GROUP BY region,ship_mode;
