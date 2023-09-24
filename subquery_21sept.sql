use employees;

show tables;


select * from employees;
-- e,[ 10003   => hiring_date  1986-08-28
select hire_date from employees where emp_no=10003;  

select * from employees where hire_date>"1986-08-28";

select * from employees where first_name="Georgi" and birth_date="1953-09-02" ;
-- nested sub query
select * from employees 
where hire_date> ( select hire_date from employees where emp_no=10003);

-- nested => result 
drop table a;
create table a(id int);
select * from a;
insert into a values(null);

create table b(newid int);
insert into b values(5);

select * from b;
select * from b where newid>10;
select id from a;
select * from b 
where newid =ANY (select id from a);

select id from a where id is not null;

select * from a; 
select * from b 
where newid < ALL (select id from a);

select * from b;
select * from b 
where newid IN (select id from a);

use employees;






select * from employees;
-- nested queries
SELECT emp_no, first_name, last_name, hire_date
FROM employees JOIN titles USING (emp_no)
WHERE title = 'Assistant Engineer'
AND hire_date < ANY (SELECT hire_date FROM
employees JOIN titles USING (emp_no)
WHERE title = 'Manager');

show tables;
select * from titles;
-- title == emp_Np 10001
select title from titles where emp_no in (10001,10002);

-- subquery return 1 row => = , >, <, >=,<= 
select * from titles 
where title =  (select title from titles where emp_no in (10001,10002));

select title from titles where emp_no in (10001,10002);
select * from titles 
where title =ANY  (select title from titles where emp_no in (10001,10002));

select salary from salaries where emp_no=10002; 

select * from salaries 
where salary <=ANY ( select salary from salaries where emp_no=10002)
order by salary desc;

-- new 
SELECT emp_no, first_name, last_name,title
FROM employees JOIN titles USING (emp_no)
WHERE title = 'Manager'
AND emp_no = ANY (SELECT emp_no FROM employees
JOIN titles USING (emp_no) WHERE
title <> 'Manager');

-- join part here
SELECT DISTINCT emp_no, first_name, last_name
FROM employees JOIN titles mgr USING (emp_no)
JOIN titles nonmgr USING (emp_no)
WHERE mgr.title = 'Manager'
AND nonmgr.title <> 'Manager';

-- ALL condition
SELECT emp_no, first_name, last_name, hire_date
FROM employees JOIN titles USING (emp_no)
WHERE title = 'Assistant Engineer'
AND hire_date < ALL (SELECT hire_date FROM
employees JOIN titles USING (emp_no)
 WHERE title = 'Manager');

use employees;
-- alternative check
(SELECT 'Assistant Engineer' AS title,
MIN(hire_date) AS mhd FROM employees
JOIN titles USING (emp_no)
WHERE title = 'Assistant Engineer')
UNION
(SELECT 'Manager' title, MIN(hire_date) mhd FROM employees
JOIN titles USING (emp_no)
WHERE title = 'Manager');



-- Other here ( ROW SubQuery )
SELECT mgr.emp_no, year(mgr.from_date),year(other.from_date),
 mgr.title,other.title AS fd
FROM titles AS mgr, titles AS other
where mgr.emp_no= other.emp_no and mgr.title="Manager"
and mgr.title<>other.title
and year(mgr.from_date)=year(other.from_date);

SELECT mgr.emp_no, YEAR(mgr.from_date) AS fd
FROM titles AS mgr, titles AS other
WHERE mgr.emp_no = other.emp_no
AND mgr.title = 'Manager'
AND mgr.title <> other.title
AND YEAR(mgr.from_date) = YEAR(other.from_date);


SELECT emp_no, YEAR(from_date),title FROM titles WHERE title <> 'Manager';

-- alternative ( row subquery)
 SELECT emp_no, YEAR(from_date) AS fd FROM titles WHERE title = 'Manager' AND
(emp_no, YEAR(from_date)) IN
	(SELECT emp_no, YEAR(from_date) FROM titles WHERE title <> 'Manager');
    
show tables;

select salary, count(salary)
from salaries group by salary
having 
count(salary) >= (select count(salary) from salaries
					where salary=60117 group by salary);

-- here if you see ( we are looking an other way for the query with 
-- where clause

 SELECT employees.emp_no,first_name, last_name
FROM employees, titles where (employees.emp_no = titles.emp_no);

SELECT employees.emp_no, first_name,last_name,title
FROM employees, titles
where employees.emp_no=titles.emp_no and first_name="Georgi"
and last_name="Klassen" and title="Staff";

SELECT employees.emp_no,first_name, last_name
FROM employees, titles
WHERE (employees.emp_no, first_name, last_name, title) =
(titles.emp_no, 'Georgi', 'Klassen', 'Staff');


use sakila;
select count(*) from film
where exists (select * from test);


--  In this section, you’ll learn about a fourth type, the correlated subquery, where a table used in the outer query is referenced in the subquery.
/*
Co-related query
*/
SELECT title FROM film
WHERE EXISTS (SELECT * FROM film WHERE title = 'IS THIS A MOVIE?');


SELECT first_name, last_name FROM staff
WHERE EXISTS (SELECT * FROM customer
WHERE customer.first_name = staff.first_name
AND customer.last_name = staff.last_name);

SELECT COUNT(*) FROM film WHERE EXISTS
(SELECT film_id FROM inventory
WHERE inventory.film_id = film.film_id
GROUP BY film_id HAVING COUNT(*) >= 2);

SELECT emp_no, first_name, last_name
FROM employees JOIN titles USING (emp_no)
WHERE title = 'Manager'
AND emp_no IN (SELECT emp_no FROM employees
JOIN titles USING (emp_no) WHERE
title <> 'Manager');


-- using corelated query
SELECT emp_no, first_name, last_name
FROM employees JOIN titles USING (emp_no)
WHERE title = 'Manager'
AND EXISTS (SELECT emp_no FROM titles
WHERE titles.emp_no = employees.emp_no
AND title <> 'Manager');


-- Nested Query in FROM Clause

