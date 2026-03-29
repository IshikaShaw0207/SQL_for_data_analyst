
/*𝗤𝘂𝗲𝘀𝘁𝗶𝗼𝗻: 𝗖𝗮𝗹𝗰𝘂𝗹𝗮𝘁𝗲 𝗬𝗲𝗮𝗿-𝗼𝘃𝗲𝗿-𝗬𝗲𝗮𝗿 (𝗬𝗼𝗬) 𝗦𝗮𝗹𝗲𝘀 𝗚𝗿𝗼𝘄𝘁𝗵 𝗣𝗲𝗿𝗰𝗲𝗻𝘁𝗮𝗴𝗲 𝗯𝘆 𝗖𝗮𝘁𝗲𝗴𝗼𝗿𝘆 

𝗣𝗿𝗼𝗯𝗹𝗲𝗺 𝗦𝘁𝗮𝘁𝗲𝗺𝗲𝗻𝘁
You are given a table employee_sales that contains sales transaction 
data across multiple categories and years.
Each category can have multiple sales records in a month.

𝗪𝗿𝗶𝘁𝗲 𝗮 𝗦𝗤𝗟 𝗾𝘂𝗲𝗿𝘆 𝘁𝗼 𝗰𝗮𝗹𝗰𝘂𝗹𝗮𝘁𝗲 𝘁𝗵𝗲 𝗬𝗲𝗮𝗿-𝗼𝘃𝗲𝗿-𝗬𝗲𝗮𝗿 (𝗬𝗼𝗬) 𝘀𝗮𝗹𝗲𝘀 𝗴𝗿𝗼𝘄𝘁𝗵 𝗽𝗲𝗿𝗰𝗲𝗻𝘁𝗮𝗴𝗲 𝗳𝗼𝗿 𝗲𝗮𝗰𝗵 𝗰𝗮𝘁𝗲𝗴𝗼𝗿𝘆.
*/


CREATE TABLE employee_sales_YOY (
 order_id INT,
 employee_name VARCHAR(50),
 category VARCHAR(50),
 sales_amount INT,
 sales_date DATE
);


INSERT INTO employee_sales_YOY VALUES
(1, 'Amit', 'Electronics', 20000, '2023-01-10'),
(2, 'Neha', 'Electronics', 40000, '2023-02-15'),
(3, 'Amit', 'Electronics', 30000, '2024-01-12'),
(4,'Ravi', 'Electronics', 35000, '2024-03-15'),
(5, 'Amit', 'Electronics', 35000, '2025-01-14'),
(6, 'Ravi', 'Electronics', 38000, '2025-03-18'),
(7, 'Kiran', 'Furniture', 25000, '2023-01-08'),
(8, 'Pooja', 'Furniture', 30000, '2023-02-14'),
(9, 'Kiran', 'Furniture', 40000, '2024-01-16'),
(10, 'Suresh','Furniture', 50000, '2024-03-25'),
(11, 'Kiran', 'Furniture', 42000, '2025-01-19'),
(12, 'Rahul', 'Clothing', 15000, '2023-01-05'),
(13, 'Rahul', 'Clothing', 22000, '2024-01-09'),
(14, 'Vikas', 'Clothing', 21000, '2024-03-21'),
(15, 'Vikas', 'Clothing', 23000, '2025-03-23');

select * from employee_sales_YOY;

with YEARLY_SALES as(
select category,YEAR(sales_date) as [year], sum(sales_amount) as [yearly_sales] 
from employee_sales_YOY
group by category, YEAR(sales_date)
), YOY_Growth_Calculation as(
select *,
lag(yearly_sales,1,yearly_sales) over (partition by category order by year) as [prev_year_sales]
from YEARLY_SALES
)
select *,((yearly_sales - prev_year_sales)* 100.0/ prev_year_sales) as YOY_growth_percentage
from YOY_Growth_Calculation