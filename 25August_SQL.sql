use sakila;
SELECT actors,title FROM
 film_list WHERE actors LIKE 'NAT_%'; 

-- logical and or not
select * from actor;
select * from actor where first_name="NICK"
and actor_id=2;

select * from actor where first_name="NICK"
or actor_id=3;

show tables;
select * from actor_info;

select * from actor_info 
	where film_info like "Animation%" 
    and first_name="GOLDIE";

select * from actor_info;

select * from actor_info 
	where film_info like "Animation%" 
    and first_name="GOLDIE1" or first_name="NICK";



select * from actor_info 
	where  first_name like "GOLDIE";


-- exact matches with like too

select * from film_list;

SELECT category, rating,title 
FROM film_list WHERE category LIKE 'Sci-Fi'
AND rating LIKE 'PG';

SELECT category,rating,title FROM film_list 
WHERE ( category like 'Sci-Fi'
OR category LIKE 'Family' ) AND rating LIKE 'PG';

select * from film_list;


# use paranthesis here for the order setting
SELECT title FROM film_list WHERE (category like 'Sci-Fi'
OR category LIKE 'Family') AND rating LIKE 'PG';

select 2+2*3;

SELECT (2+2)*3;

select * from actor
where actor_id between 5 and 2 ;

select * from actor
where first_name between "B" and "E" ;

select * from actor where
first_name >"D";

select * from actor 
where actor_id=1 or actor_id=5;

select * from actor
where actor_id in (1,5);

select * from actor
where actor_id>=2 and actor_id<=5 ;

#-- differenet output bcz of paranthesis 
SELECT 2+2*3;

SELECT * FROM sakila.city WHERE city_id = 3
OR city_id = 4 AND country_id = 60;

SELECT * FROM sakila.city WHERE country_id = 60
AND city_id = 3 OR city_id = 4;

--   <>   !=

select * from actor where not(actor_id=1); 
#not operator with other or condition

select * from actor;
SELECT fid,title FROM film_list WHERE FID < 7 AND NOT (FID = 4 OR FID = 6);

#sorting with order by ( asc and desc)

#sorting based on address and grouped by district

SELECT address, district FROM address
ORDER BY district, address; 

use sakila;
#limit clause
SELECT name FROM customer_list LIMIT 10;

#offset
SELECT name FROM customer_list LIMIT 5, 5;

SELECT id, name FROM customer_list;

-- Inserting data typically occurs in two situations: when you bulk-load in a large batch as you create your database, and when you add data on an ad hoc basis as you use the database
INSERT INTO language VALUES (NULL, 'Portuguese', NOW());

 INSERT INTO language VALUES (8, 'Russian', '2020-09-26 10:35:00');
 
 #it will ignore it for inserting data here in this statement
 INSERT IGNORE INTO language VALUES (8, 'Arabic', '2020-09-26 10:35:00');
ORDER BY id LIMIT 10 OFFSET 5; 


