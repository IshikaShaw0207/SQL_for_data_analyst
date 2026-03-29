/*

Problem Statement

You are given a table that tracks daily stock levels of suppliers.

	Write an SQL query to find suppliers whose stock was less than 50 for at 
	least 2 or more consecutive days.

Requirements

	Only consider days where stock < 50
	Consecutive days means continuous calendar days

Output should include:

supplier_id
start_date
end_date
consecutive_days
*/



CREATE TABLE supplier_stock (
    supplier_id INT,
    stock_date DATE,
    stock INT
);


INSERT INTO supplier_stock VALUES

(101, '2025-07-01', 60),
(101, '2025-07-02', 45),
(101, '2025-07-03', 40),
(101, '2025-07-04', 42),
(101, '2025-07-05', 55),


(102, '2025-07-01', 30),
(102, '2025-07-02', 25),
(102, '2025-07-03', 20),
(102, '2025-07-04', 70),

(103, '2025-07-01', 80),
(103, '2025-07-02', 45),
(103, '2025-07-03', 60),
(103, '2025-07-04', 40),
(103, '2025-07-05', 35),
(103, '2025-07-06', 30);

select * from supplier_stock

WITH low_stock AS (
    SELECT
        supplier_id,
        stock_date,
        ROW_NUMBER() OVER (
            PARTITION BY supplier_id
            ORDER BY stock_date
        ) AS rn
    FROM supplier_stock
    WHERE stock < 50
),
grouped_days AS (
    SELECT
        supplier_id,
        stock_date,
        DATEADD(DAY, -rn, stock_date) AS grp
    FROM low_stock
)
SELECT
    supplier_id,
    MIN(stock_date) AS start_date,
    MAX(stock_date) AS end_date,
    COUNT(*) AS consecutive_days
FROM grouped_days
GROUP BY supplier_id, grp
HAVING COUNT(*) >= 2
ORDER BY supplier_id;
