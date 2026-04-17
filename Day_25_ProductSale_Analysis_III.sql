-- Write a solution to find all sales that occurred in the first year each product was sold. For each product_id, identify the earliest year it appears in the Sales table. Return all sales entries for that product in that year.

# Write your MySQL query statement below
SELECT product_id, year as first_year, quantity, price
FROM(
    SELECT *,
            DENSE_RANK() OVER (PARTITION BY product_id ORDER BY year) as rnk
    FROM Sales
)t
WHERE rnk = 1;