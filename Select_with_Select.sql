# 4) Which country has a population that is more than United Kingdom but less than Germany? Show the name and the population.
  SELECT name,population FROM world
where population > ( select population from world
where name='United Kingdom' ) and population < ( select population from world
where name='Germany' );


/*
#5 
Germany (population 80 million) has the largest population of the countries in Europe. 
Austria (population 8.5 million) has 11% of the population of Germany.
*/
select name, concat( round( (population/84432670)*100),'%' ) as percentage from world
where continent='Europe' ;

-- alternative ans


select name, concat( round( (population/ (select population from world where name='Germany')  )*100),'%' ) as percentage from world
where
continent='Europe' ;



-- #6 Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)
-- Solution
select name from world
where gdp >ALL (select gdp from world where continent='Europe');
