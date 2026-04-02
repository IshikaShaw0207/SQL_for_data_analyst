-- Write a solution to find the first login date for each player.

--Approach: Used window function to partition by player id and assign rank base on event date. Then filtered using rnk=1 to get the first login date.

# Write your MySQL query statement below
SELECT player_id, event_date as first_login
FROM(
    SELECT player_id, event_date,
    DENSE_RANK() OVER (PARTITION BY player_id ORDER BY event_date) as rnk
    FROM Activity
)t
WHERE rnk=1;