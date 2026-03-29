with ranked_salary as(
    select salary,
        DENSE_RANK() over (order by salary desc) as rnk
    from Employee
)
select max(salary) as SecondHighestSalary
from ranked_salary
where rnk = 2