<<<<<<< HEAD
--Write a solution to find the second highest distinct salary from the Employee table. If there is no second highest salary, return null.
--Approach: CTE ranks salary using dense_rank() and final query filters the 2nd highest distinct salary


with ranked_salary as(
    select salary,
        DENSE_RANK() over (order by salary desc) as rnk
    from Employee
)
select max(salary) as SecondHighestSalary
from ranked_salary
=======
with ranked_salary as(
    select salary,
        DENSE_RANK() over (order by salary desc) as rnk
    from Employee
)
select max(salary) as SecondHighestSalary
from ranked_salary
>>>>>>> 8ce2d4360389d407d1ae13074544a852f53746e1
where rnk = 2