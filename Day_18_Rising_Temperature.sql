-- Write a solution to find all dates' id with higher temperatures compared to its previous dates (yesterday).

# Write your MySQL query statement below
WITH CTE AS(
    SELECT *, 
    LAG(temperature,1) OVER (ORDER BY recordDate) AS prev_temp,
    LAG(recordDate,1) OVER (ORDER BY recordDate) AS prev_date 
    FROM Weather
)
SELECT id FROM CTE
WHERE temperature > prev_temp
AND DATEDIFF(recordDate, prev_date)=1;