<<<<<<< HEAD
--Write a solution to find the nth highest distinct salary from the Employee table. If there are less than n distinct salaries, return null.

--Approach: CTE ranks salary using dense_rank() and final query filters the 2nd highest distinct salary

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      -- Write your MySQL query statement below.
    with rankedsalary as(
        select salary,
            dense_rank() over (order by salary desc) as rnk
            from Employee
    )
    select max(salary) from rankedsalary
    where rnk=N
  );
=======
--Write a solution to find the nth highest distinct salary from the Employee table. If there are less than n distinct salaries, return null.

--Approach: CTE ranks salary using dense_rank() and final query filters the 2nd highest distinct salary

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      -- Write your MySQL query statement below.
    with rankedsalary as(
        select salary,
            dense_rank() over (order by salary desc) as rnk
            from Employee
    )
    select max(salary) from rankedsalary
    where rnk=N
  );
>>>>>>> 8ce2d4360389d407d1ae13074544a852f53746e1
END