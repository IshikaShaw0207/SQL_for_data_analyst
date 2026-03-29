/*𝗣𝗿𝗼𝗯𝗹𝗲𝗺 𝗦𝘁𝗮𝘁𝗲𝗺𝗲𝗻𝘁

Write a SQL query to find the 2nd highest total daily sales for each category.

𝗥𝗲𝗾𝘂𝗶𝗿𝗲𝗺𝗲𝗻𝘁𝘀

If an employee has multiple orders on the same day, first aggregate total sales per employee per day per category
Then determine the 2nd highest total sales within each category
*/

CREATE TABLE employee_sales (
 order_id INT,
 employee_name VARCHAR(50),
 category VARCHAR(50),
 sales_amount INT,
 sales_date DATE
);


INSERT INTO employee_sales VALUES
(1, 'Amit', 'Electronics', 20000, '2024-01-05'),
(2, 'Amit', 'Electronics', 30000, '2024-01-05'),
(3, 'Ravi', 'Electronics', 40000, '2024-01-10'),
(4, 'Ravi', 'Electronics', 25000, '2024-01-10'),
(5, 'Neha', 'Electronics', 35000, '2024-01-15'),
(6, 'Neha', 'Electronics', 20000, '2024-01-15'),
(7, 'Kiran', 'Furniture', 30000, '2024-01-12'),
(8, 'Kiran', 'Furniture', 25000, '2024-01-12'),
(9, 'Pooja', 'Furniture', 20000, '2024-01-18'),
(10, 'Pooja', 'Furniture', 30000, '2024-01-18'),
(11, 'Suresh','Furniture', 40000, '2024-01-07'),
(12, 'Rahul', 'Clothing', 15000, '2024-01-06'),
(13, 'Rahul', 'Clothing', 15000, '2024-01-06'),
(14, 'Anita', 'Clothing', 25000, '2024-01-14'),
(15, 'Anita', 'Clothing', 20000, '2024-01-14'),
(16, 'Vikas', 'Clothing', 18000, '2024-01-20'),
(17, 'Vikas', 'Clothing', 17000, '2024-01-20');

select * from employee_sales;

with cte as(
select employee_name, sales_date, category , sum(sales_amount) as total_sales from employee_sales
group by employee_name, sales_date, category
),
cte2 as(
select *,
DENSE_RANK() over (partition by category order by total_sales desc) as [DR] from cte
)
select * from cte2 where DR = 2;