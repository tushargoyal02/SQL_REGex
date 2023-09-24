# 4) Which country has a population that is more than United Kingdom but less than Germany? Show the name and the population.
  SELECT name,population FROM world
where population > ( select population from world
where name='United Kingdom' ) and population < ( select population from world
where name='Germany' );
