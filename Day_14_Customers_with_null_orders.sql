-- Write a solution to find all customers who never order anything.

--Approach: Left join customer and order table based on id and use where clause to find customers with null order.

# Write your MySQL query statement below
SELECT c.name as Customers
FROM Customers c
LEFT JOIN Orders o
ON c.id=o.customerId
WHERE o.customerId IS NULL;
