--Problem: Combine Two Tables
--Link: https://leetcode.com/problems/combine-two-tables/
--Difficulty: Easy

select firstName, lastName,city,state 
from Person p
left join Address a
on p.personId= a.personId;