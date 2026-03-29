<<<<<<< HEAD

--Find all numbers that appear at least three times consecutively.

--Approach: window function lag() is used in cte to find the previous two values. If both values is equal to num then that number appears three times consecutively.

with cte as(
    select num,
        lag(num,1) over (order by id) prev1,
        lag(num,2) over (order by id) prev2
        from Logs
)
select distinct num as ConsecutiveNums
from cte
where num=prev1
=======

--Find all numbers that appear at least three times consecutively.

--Approach: window function lag() is used in cte to find the previous two values. If both values is equal to num then that number appears three times consecutively.

with cte as(
    select num,
        lag(num,1) over (order by id) prev1,
        lag(num,2) over (order by id) prev2
        from Logs
)
select distinct num as ConsecutiveNums
from cte
where num=prev1
>>>>>>> 8ce2d4360389d407d1ae13074544a852f53746e1
AND num=prev2;