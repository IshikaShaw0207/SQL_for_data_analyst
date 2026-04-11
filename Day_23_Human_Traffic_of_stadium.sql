-- Write a solution to display the records with three or more rows with consecutive id's, and the number of people is greater than or equal to 100 for each. Return the result table ordered by visit_date in ascending order.

# Write your MySQL query statement below
WITH CTE AS (
    SELECT *,
           id - ROW_NUMBER() OVER(ORDER BY visit_date) AS grp
    FROM Stadium
    WHERE people >= 100
)

SELECT id, visit_date, people
FROM CTE
WHERE grp IN (
    SELECT grp
    FROM CTE
    GROUP BY grp
    HAVING COUNT(*) >= 3
)
