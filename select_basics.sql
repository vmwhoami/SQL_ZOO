-- 1. The example uses a WHERE clause to show the population of 'France'. Note that strings (pieces of text that are data) should be in 'single quotes';

-- Modify it to show the population of Germany

SELECT population
FROM world
WHERE name = 'Germany'

-- 2.Checking a list The word IN allows us to check if an item is in a list. The example shows the name and population for the countries 'Brazil', 'Russia', 'India' and 'China'.

-- Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.

SELECT name, population
FROM world
WHERE name IN ('Sweden', 'Norway','Denmark');

-- 3. Which countries are not too small and not too big? BETWEEN allows range checking (range specified is inclusive of boundary values). The example below shows countries with an area of 250,000-300,000 sq. km. Modify it to show the country and the area for countries with an area between 200,000 and 250,000.

SELECT name, area
FROM world
WHERE area BETWEEN 200000 AND 250000

-- SELECT from WORLD Tutorial

-- 4.How to use WHERE to filter records. Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros.

SELECT name
FROM world
WHERE population >= 200000000

-- 5.Give the name and the per capita GDP for those countries with a population of at least 200 million.

SELECT name, gdp/population
FROM world
WHERE population >= 200000000

-- 6.Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.

SELECT name, population/1000000
FROM world
WHERE continent = 'South America'

-- 7.Show the name and population for France, Germany, Italy

SELECT name, population
FROM world
WHERE name IN ('France', 'Germany', 'Italy')

-- 8.Show the countries which have a name that includes the word 'United'

SELECT name
FROM world
WHERE name LIKE 'United%'