

show databases;

use sakila;

show tables;

-- kisi select
-- select statement

describe actor;

desc actor;

-- dql statement
select * from actor;

SELECT actor_id,first_name
 from
	ACTOR;

DESC ACTOR_INFO;

-- projection and selection
select actor_id, actor_id*10 from actor_info;

select * from actor_info;

-- where clause
select * from actor_info where actor_id=2;

select first_name
 from actor_info where actor_id>2;


select *
 from actor_info where first_name="ED";
 
-- statement vs clause
-- where clause, internal, 
--  mysql install + sakila + world database
--  dbms vs rdbms
--  acid properties  



