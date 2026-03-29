-- Problem: Combine two tables
--Link: https://leetcode.com/problems/combine-two-tables/
--Approach: Used left join

select firstName, lastName,city,state 
from Person p
left join Address a
on p.personId= a.personId;