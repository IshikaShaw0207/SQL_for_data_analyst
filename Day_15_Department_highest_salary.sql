-- Write a solution to find employees who have the highest salary in each of the departments.

-- Approach: Used window function to partition employees by department and rank them based on salary. Then I filtered rank=1 to get employees with highest salary in each department.

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
where rnk = 1;