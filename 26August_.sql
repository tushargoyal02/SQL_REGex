-- use sakila;-- 

SELECT * FROM sakila.city WHERE (city_id = 3
OR city_id = 4) AND country_id = 60;

SELECT * FROM sakila.city WHERE country_id = 60
AND city_id = 3 OR city_id = 4;

--   <>   !=

select * from actor where actor_id=1; 
select * from actor where not(actor_id=1); 

#not operator with other or condition

select * from actor;

select * from film_list;

SELECT fid,title FROM film_list 
WHERE FID < 7 AND  not (FID = 4 OR FID = 6);

-- %abc% => %
select * from film_list;

-- order by clause => sort ascending or descending
select * from film_list order by category;
desc film_list;
select * from film_list order by 5;

select fid, title,category 
from film_list order by price;

select district, address, address_id from address 
order by district desc, address_id asc;

#sorting with order by ( asc and desc)

#sorting based on address and grouped by district

SELECT address, district FROM address
ORDER BY district, address; 

select address_id, address from address
limit 3;

-- 3 is offset (skip  , 2 number 
select * from address
limit 3,5;

select * from address
limit 5 offset 3;

select * from address;

# table => dual dummy table => logic test
-- pseduo column  => column => specific meaning
-- already avaialbe with your system 
select now() from dual;

select now();
-- 





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
 
 -- insert with other apporach
INSERT INTO actor (actor_id, first_name, last_name, last_update)
VALUES (NULL, 'Vinicius', 'Grippa', NOW());


# auto_increment ki wajah se
INSERT INTO city (city, country_id) VALUES ('Bebedouro', 19);

#bulk insert
INSERT INTO city (city,country_id) VALUES
('Sao Carlos',19),('Araraquara',19),
('Ribeirao Preto',19);

# All columns in a MySQL table have a default value of NULL
#until assigned

#other alternate
INSERT INTO country SET country_id=NULL,
country='Bahamas', last_update=NOW();

use sakila;
create table abc as select * from actor;
select * from abc;

delete from abc;


INSERT INTO country VALUES (NULL, 'Uruguay', DEFAULT);




