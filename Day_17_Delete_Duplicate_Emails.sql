-- Write a solution to delete all duplicate emails, keeping only one unique email with the smallest id.

-- Approach: Used window function to partition by email and assign the row number based on the id. Then I filtered email using rn>1 and deleted them from the table.

# Write your MySQL query statement below
WITH CTE AS (
    SELECT *,
    ROW_NUMBER() OVER (PARTITION BY email ORDER BY id) AS rn
    FROM Person
)
DELETE FROM PERSON
WHERE id IN (
    SELECT id FROM CTE 
    WHERE rn > 1
)