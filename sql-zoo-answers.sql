--******************************************************************
                                                                -- *
--  answers from questions at https://sqlzoo.net/wiki/SQL_Tutorial *
                                                               --  *
-- *****************************************************************

-- 0 Select basics
-- https://sqlzoo.net/wiki/SELECT_basics

-- 1. Introducing the world table of countries
-- The example uses a WHERE clause to show the population of 'France'. Note that strings (pieces of text that are data) should be in 'single quotes';

-- Modify it to show the population of Germany 
-- example of how to find population where country equal France
SELECT population FROM world WHERE name = 'France';
-- Answer
SELECT population FROM world WHERE name = 'Germany';

-- 2. Scandinavia
-- Checking a list The word IN allows us to check if an item is in a list. The example shows the name and population for the countries 'Brazil', 'Russia', 'India' and 'China'.

-- Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.
-- example on how to find population from different countries in the table world
SELECT name, population FROM world
  WHERE name IN ('Brazil', 'Russia', 'India', 'China');
  -- Answer
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- 3. Just the right size
-- Which countries are not too small and not too big? BETWEEN allows range checking (range specified is inclusive of boundary values). The example below shows countries with an area of 250,000-300,000 sq. km. Modify it to show the country and the area for countries with an area between 200,000 and 250,000.

SELECT name, area FROM world
  WHERE area BETWEEN 250000 AND 300000;
-- Answer
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000;

-- 1 SELECT from world QUIZ
-- https://sqlzoo.net/wiki/SELECT_from_WORLD_Tutorial

-- 1. Find the country that start with Y
-- You can use WHERE name LIKE 'B%' to find the countries that start with "B".

-- The % is a wild-card it can match any characters
-- example of how to find countries that start with letter F
SELECT name FROM world
  WHERE name LIKE 'F%';
-- Answer
SELECT name FROM world
  WHERE name LIKE 'Y%';

-- 2. Find the countries that end with y
-- example of how to find contries that end with letter t
SELECT name FROM world WHERE name LIKE '%t';
-- Answer
SELECT name from world WHERE name LIKE '%y';


-- 3. Find the countries that contain the letter x
-- Luxembourg has an x - so does one other country. List them both.
-- example on how to query for countries that contains the letter t in between
SELECT name FROM wolrd WHERE name LIKE '%t%';
-- Answer
SELECT name FROM world WHERE name LIKE '%x%';

-- 4. Find the countries that end with land
-- Iceland, Switzerland end with land - but are there others?
-- example of countries that end with 'ia'
SELECT name FROM world WHERE name like '%ia';
-- Answer
SELECT name FROM world WHERE name like '%land';

-- 5. Find the countries that start with C and end with ia
-- Columbia starts with a C and ends with ia - there are two more like this.
-- Answer
SELECT name FROM world WHERE name LIKE 'C%' AND name LIKE '%ia';

-- 6. Find the country that has oo in the name
-- Greece has a double e - who has a double o?
-- Answer
SELECT name FROM world WHERE name LIKE '%oo%';


-- 7. Find the countries that have three or more a in the name
-- Bahamas has three a - who else?
-- Answer
SELECT name FROM world WHERE name LIKE '%a%a%a%';

-- 8. Find the countries that have "t" as the second character.
-- India and Angola have an n as the second character. You can use the underscore as a single character wildcard.

-- SELECT name FROM world
--  WHERE name LIKE '_n%'
-- ORDER BY name
-- Answer
SELECT name FROM world WHERE name like '_t%' ORDER by name;

-- 9. Find the countries that have two "o" characters separated by two others.
-- Lesotho and Moldova both have two o characters separated by two other characters.
-- Answers
SELECT name FROM world WHERE name LIKE '%o_o%';

-- 10.Find the countries that have exactly four characters.
-- Cuba and Togo have four characters names.
SELECT name FROM world WHERE LENGTH(name) = 4

-- 11. Find the country where the name is the capital city.
-- The capital of Luxembourg is Luxembourg. Show all the countries where the capital is the same as the name of the country
-- Answer
SELECT name FROM world WHERE name = capital

-- SELECT from nobel QUIZ
-- https://sqlzoo.net/wiki/SELECT_from_Nobel_Tutorial


-- 1. Winners from 1950
-- Change the query shown so that it displays Nobel prizes for 1950.
-- Answer
SELECT yr, subject, winner FROM nobel WHERE yr = 1950

-- 2. 1962 Literature
-- Show who won the 1962 prize for Literature.
-- Answer
SELECT winner from nobel WHERE yr = 1962 AND subject = 'literature'

-- 3. Albert Einstein
-- Show the year and subject that won 'Albert Einstein' his prize.
-- Answer
SELECT yr, subject FROM nobel WHERE winner = 'Albert Einstein'

-- 4. Recent Peace Prizes
-- Give the name of the 'Peace' winners since the year 2000, including 2000.
-- Answer
SELECT winner FROM nobel WHERE yr BETWEEN 2000 AND 2020 AND subject = 'Peace'

-- 5. Literature in the 1980's
-- Show all details (yr, subject, winner) of the Literature prize winners for 1980 to 1989 inclusive.
-- Answer
SELECT yr, subject, winner FROM nobel 
WHERE yr BETWEEN 1980 AND 1989 
AND subject = 'literature'

-- 6. Only Presidents
-- Show all details of the presidential winners:
-- 'Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama' 
-- Answer
SELECT * FROM nobel WHERE  winner 
IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama')

-- 7. John
-- Show the winners with first name John
-- Answer
SELECT winner FROM nobel WHERE winner like 'John%'

-- 8. Chemistry and Physics from different years
-- Show the year, subject, and name of Physics winners for 1980 together with the Chemistry winners for 1984
-- Answer
SELECT yr, subject, winner FROM nobel 
WHERE (subject = 'chemistry' 
and yr = 1984)
OR (subject = 'physics'
AND yr = 1980);

-- 9 .Exclude Chemists and Medics
-- Show the year, subject, and name of winners for 1980 excluding Chemistry and Medicine
-- Answer
SELECT * FROM nobel WHERE subject REGEXP '[^chemistry medicine]' AND yr = 1980

-- 10. Early Medicine, Late Literature
-- Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) together with winners of a 'Literature' prize in a later year (after 2004, including 2004)
-- Answer:
SELECT yr, subject, winner FROM nobel WHERE (subject = 'medicine' AND yr < 1910) OR (subject = 'literature' AND yr >= 2004)


-- SELECT IN QUIZ
-- https://sqlzoo.net/wiki/SELECT_within_SELECT_Tutorial

-- 1. Bigger than Russia
-- List each country name where the population is larger than that of 'Russia'.
-- Answer
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

-- 2. Richer than UK 
-- Show the countries in Europe with a per capita GDP greater than 'United Kingdom'.
-- Answer
SELECT name FROM world WHERE continent = 'europe' AND 
gdp/population > (SELECT gdp/population FROM world WHERE name = 'United Kingdom')

-- 3. Neighbours of Argentina and Australia
-- List the name and continent of countries in the continents containing either Argentina or Australia. Order by name of the country.
-- Answer
SELECT name, continent FROM world WHERE continent IN ('South America', 'Oceania') ORDER BY name

-- 4. Between Canada and Poland
-- Which country has a population that is more than Canada but less than Poland? Show the name and the population.
-- Answer
SELECT name FROM world WHERE population 
> ( SELECT population FROM world WHERE name = 'Canada' ) 
AND population < ( SELECT population FROM world WHERE name = 'Poland' )

-- 5. Percentages of Germany
-- Germany (population 80 million) has the largest population of the countries in Europe. Austria (population 8.5 million) has 11% of the population of Germany.

-- Show the name and the population of each country in Europe. Show the population as a percentage of the population of Germany.

-- The format should be Name, Percentage for example:
-- _____________________
-- |name	  |percentage|
-- |Albania	|3%        |
-- |Andorra	|0%        |
-- |Austria	|11%       |
-- |...	... |          |
-- |________|__________|
-- Answer
SELECT name, CONCAT(ROUND(population * 100 / (SELECT population FROM world WHERE name = 'germany')), '%')  AS percentage FROM world WHERE continent = 'europe'

-- 6. Bigger than every country in Europe
-- Which countries have a GDP greater than every country in Europe? [Give the name only.] (Some countries may have NULL gdp values)
-- Answer
   SELECT name, gdp FROM world WHERE continent !='europe' AND gdp  >= all(select gdp FROM world WHERE gdp != 0 AND continent = 'europe')

  -- 7. Largest in each continent
  -- Find the largest country (by area) in each continent, show the continent, the name and the area:
-- Answer:
  SELECT continent, name, area FROM world x
  WHERE area >= ALL( SELECT area FROM world y
  WHERE x.continent = y.continent and area != 0)

  -- 8. First country of each continent (alphabetically)
  -- List each continent and the name of the country that comes first alphabetically.
  SELECT continent,name FROM world x
  WHERE x.name <= ALL (
    SELECT name FROM world y
     WHERE x.continent= y.continent)

    --  SUM and COUNT QUIZ
    -- https://sqlzoo.net/wiki/SUM_and_COUNT

    -- 1. Total world population
    --  Show the total population of the world.
    -- Answer:
    SELECT SUM(population) FROM world;

    -- 2. Total world population
    -- List all the continents - just once each.
    -- Answer:
    SELECT DISTINCT continent FROM  world

    -- 3. GDP of Africa
    -- Give the total GDP of Africa
    -- Answer:
    SELECT SUM(gdp) FROM world WHERE continent = 'africa'

    -- 4. Count the big countries
    -- How many countries have an area of at least 1000000
    -- Answer:
    SELECT COUNT(name) FROM world where area >= 1000000

  -- 5. Baltic states population
  -- What is the total population of ('Estonia', 'Latvia', 'Lithuania')
  -- Answer:
  SELECT SUM (population) 
  FROM world 
  WHERE name IN ('Estonia', 'Latvia', 'Lithuania')

  -- 6. Counting the countries of each continent
  -- For each continent show the continent and number of countries.
  -- Answer
  SELECT continent, COUNT (name) FROM world GROUP BY continent

  -- 7. Counting big countries in each continent
  -- For each continent show the continent and number of countries with populations of at least 10 million.
  -- Answer:
  SELECT continent, COUNT(name) 
  FROM world 
  WHERE population >= 10000000 GROUP BY continent

  -- 8. Counting big continents
  -- List the continents that have a total population of at least 100 million.
  SELECT continent 
  FROM world 
  GROUP BY (continent) HAVING sum(population) >= 100000000  

-- JOIN and UEFA EURO 2012
-- https://sqlzoo.net/wiki/The_JOIN_operation

-- 1. The first example shows the goal scored by a player with the last name 'Bender'. The * says to list all the columns in the table - a shorter way of saying matchid, teamid, player, gtime
-- Modify it to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'
-- Answer
SELECT matchid, player from goal WHERE teamid = 'GER';

-- 2. From the previous query you can see that Lars Bender's scored a goal in game 1012. Now we want to know what teams were playing in that match.
-- Notice in the that the column matchid in the goal table corresponds to the id column in the game table. We can look up information about game 1012 by finding that row in the game table.
-- Show id, stadium, team1, team2 for just game 1012
-- Answer
SELECT id, stadium, team1, team2 FROM game WHERE id= 1012

-- 3. You can combine the two steps into a single query with a JOIN.

-- SELECT *
--   FROM game JOIN goal ON (id=matchid)
-- The FROM clause says to merge data from the goal table with that from the game table. The ON says how to figure out which rows in game go with which rows in goal - the matchid from goal must match id from game. (If we wanted to be more clear/specific we could say
-- ON (game.id=goal.matchid)

-- The code below shows the player (from the goal) and stadium name (from the game table) for every goal scored.

-- Modify it to show the player, teamid, stadium and mdate for every German goal.

SELECT player, teamid, stadium, mdate FROM game x
JOIN goal y on ( x.id = y.matchid) where teamid = 'GER'

-- 4. Use the same JOIN as in the previous question.

-- Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'
-- Answer:
SELECT team1, team2, player FROM game x
JOIN goal y ON (x.id = y.matchid) WHERE player REGEXP '^Mario'

-- 5. The table eteam gives details of every national team including the coach. You can JOIN goal to eteam using the phrase goal JOIN eteam on teamid=id

-- Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
-- Answer:
SELECT player, teamid, coach, gtime FROM eteam x
JOIN goal y ON (x.id = y.teamid) WHERE gtime <= 10

-- 6. To JOIN game with eteam you could use either
-- game JOIN eteam ON (team1=eteam.id) or game JOIN eteam ON (team2=eteam.id)

-- Notice that because id is a column name in both game and eteam you must specify eteam.id instead of just id

-- List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
-- Answer:
SELECT mdate, teamname FROM game x
JOIN eteam y on (x.team1 = y.id) WHERE coach = 'Fernando Santos'

-- 7 List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
-- Answer:
SELECT player from goal x
JOIN game y on ( x.matchid = y.id) where stadium = 'National Stadium, Warsaw'

-- 8 The example query shows all goals scored in the Germany-Greece quarterfinal.
-- The example query shows all goals scored in the Germany-Greece quarterfinal.
-- Instead show the name of all players who scored a goal against Germany.
-- Answer:
SELECT DISTINCT player FROM game x
JOIN goal y ON (x.id = y.matchid) WHERE (team1 = 'GER' OR team2 = 'GER') and temaid != 'GER';

-- More JOIN operations
-- https://sqlzoo.net/wiki/More_JOIN_operations

-- 1. 1962 movies
-- List the films where the yr is 1962 [Show id, title]
-- Answer:
SELECT id, title
 FROM movie
 WHERE yr=1962

--  2. When was Citizen Kane released?
-- Give year of 'Citizen Kane'.
-- Answer:
SELECT yr FROM movie WHERE title ='Citizen kane'

-- 3. Star Trek movies
-- List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.
-- Answer:
SELECT id, title, yr FROM movie 
where title REGEXP 'Star Trek' 
ORDER BY yr

-- 4. id for actor Glenn Close
-- What id number does the actor 'Glenn Close' have?
-- Answer:
SELECT id FROM actor WHERE name = 'Glenn Close'

-- 5. id for Casablanca
-- What is the id of the film 'Casablanca'
-- Answer:
SELECT id from movie WHERE title = 'Casablanca'

-- 6. Cast list for Casablanca
-- Obtain the cast list for 'Casablanca'.
-- The cast list is the names of the actors who were in the movie.
-- Use movieid=11768, (or whatever value you got from the previous question)
-- Answer:
SELECT name FROM actor x, casting y WHERE y.movieid = 11768 AND x.id = y.actor.id

-- 7. Alien cast list
-- Obtain the cast list for the film 'Alien'
-- Answer:
SELECT name FROM actor x, casting y 
WHERE movieid = (SELECT id FROM movie where title = 'Alien')
 AND x.id = y.actorid

--  8. Harrison Ford movies
-- List the films in which 'Harrison Ford' has appeared
-- Answer:
SELECT title FROM movie mov, actor act
join casting cas ON (cas.actorid = act.id)
 WHERE name = 'Harrison Ford' 
 AND mov.id = cas.movieid

--  9 Harrison Ford as a supporting actor
-- List the films where 'Harrison Ford' has appeared - but not in the starring role. [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]
-- Answer:
SELECT title FROM movie mov, actor act 
JOIN casting cas ON (cas.actorid = act.id)
WHERE name = 'Harrison Ford'
AND mov.id = cas.movieid 
AND cas.ord != 1

-- 10 Lead actors in 1962 movies
-- List the films together with the leading star for all 1962 films.
-- Answer:
SELECT title, name FROM actor act, movie mov
JOIN casting cas ON ( cas.movieid = mov.id) WHERE mov.yr = 1962
AND act.id = cas.actorid
AND cas.ord = 1
