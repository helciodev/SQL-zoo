-- 0 Select basics

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

-- 1 SELECT names

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








