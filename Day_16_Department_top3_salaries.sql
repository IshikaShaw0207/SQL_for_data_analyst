-- Write a solution to find the 3 employees who are high earners in each of the departments.

-- Approach: Used window function to partition employees by department and rank them based on salary. Then I filtered using rank <=3 to get 3 employees with highest salary of each department.

# Write your MySQL query statement below
SELECT Department, Employee, Salary
FROM
(
    SELECT d.name AS Department,
           e.name AS Employee,
           e.salary AS Salary,
           DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS rnk
    FROM Employee e
    JOIN Department d
    ON e.departmentId = d.id
)t
WHERE rnk<=3