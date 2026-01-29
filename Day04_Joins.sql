
/*
What is the output of: Inner Join, Left Join, Right Join, Full Join
*/



--Tables 1 :
CREATE TABLE LeftTable (
    left_id INT NULL
);


INSERT INTO LeftTable (left_id) VALUES
(1),
(1),
(2),
(3),
(3),
(4),
(4),
(NULL),
(NULL);

--Tables 2 :
CREATE TABLE RightTable (
    right_id INT NULL
);


INSERT INTO RightTable (right_id) VALUES
(1),
(2),
(2),
(4),
(4),
(5),
(5),
(NULL),
(NULL);

--Left Join

select l1.left_id from LeftTable l1
left Join RightTable r1
on l1.left_id=r1.right_id

--Right Join

select r1.right_id from LeftTable l1
left Join RightTable r1
on l1.left_id=r1.right_id

--Inner Join

select l1.left_id, r1.right_id from LeftTable l1
Inner Join RightTable r1
on l1.left_id=r1.right_id

--Full Join

select l1.left_id, r1.right_id from LeftTable l1
Full Join RightTable r1
on l1.left_id=r1.right_id
