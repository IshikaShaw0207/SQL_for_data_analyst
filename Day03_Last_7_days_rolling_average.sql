/*
SQL Question: Last 7 Days Rolling Average

Question Statement

You are given a table that stores daily sales data for different categories.

Task:
For each category and sales date, calculate the rolling 
average sales of the last 7 days, including the current day.
*/



CREATE TABLE daily_sales (
    sale_date DATE,
    category VARCHAR(50),
    sales_amount INT
);


INSERT INTO daily_sales VALUES
-- Electronics
('2024-01-01', 'Electronics', 1000),
('2024-01-01', 'Electronics', 500),
('2024-01-02', 'Electronics', 1200),
('2024-01-03', 'Electronics', 1100),
('2024-01-04', 'Electronics', 1500),
('2024-01-05', 'Electronics', 1300),
('2024-01-05', 'Electronics', 900),
('2024-01-06', 'Electronics', 1600),
('2024-01-06', 'Electronics', 600),
('2024-01-07', 'Electronics', 1700),
('2024-01-08', 'Electronics', 1800),
('2024-01-09', 'Electronics', 1900),

-- Furniture
('2024-01-01', 'Furniture', 800),
('2024-01-02', 'Furniture', 900),
('2024-01-03', 'Furniture', 850),
('2024-01-04', 'Furniture', 950),
('2024-01-04', 'Furniture', 750),
('2024-01-05', 'Furniture', 1000),
('2024-01-06', 'Furniture', 1100),
('2024-01-07', 'Furniture', 1200),
('2024-01-07', 'Furniture', 200),
('2024-01-08', 'Furniture', 1250),
('2024-01-09', 'Furniture', 1300);

select * from daily_sales

with cte as(
select category, sale_date, sum(sales_amount) as [Daily_total_sale] 
from daily_sales
group by category, sale_date
)
select *,
Avg(Daily_total_sale) over(partition by category order by sale_date 
                              rows between 6 preceding and current row) as [last_7_days_rolling_avg]
from cte							
