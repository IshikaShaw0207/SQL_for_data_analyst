--Write a solution to report all the duplicate emails. Note that it's guaranteed that the email field is not NULL

--Approach: Used group by to find duplicate emails and having clause with count greater than 1.

# Write your MySQL query statement below
SELECT email FROM Person
GROUP BY email
HAVING count(email)>1