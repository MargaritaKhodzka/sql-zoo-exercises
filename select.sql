-- world table of countries with columns:
-- - name
-- - continent
-- - area
-- - population
-- - gdp
--
-- 1. Population of Germany
SELECT population
FROM world
WHERE name LIKE 'Germany'

-- 2. Name and population for 'Sweden', 'Norway' and 'Denmark'
SELECT name, population
FROM world
WHERE name in ('Sweden', 'Norway', 'Denmark')

-- 3. Country and area for countries with an area between 200,000 and 250,000
SELECT name, area
FROM world
WHERE area BETWEEN 200000 AND 250000

-- 4. Name for the countries that have a population of at least 200 million
SELECT name
FROM world
WHERE population >= 200000000

-- 5. Name and the per capita GDP for those countries with a population of at least 200 million
SELECT name, gdp/population
FROM world
WHERE population >= 200000000

-- 6. Name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.
SELECT name, population//1000000
FROM world
WHERE continent = 'South America'

-- 7. Name and population for France, Germany, Italy
SELECT name, population
FROM world
WHERE name in ('France', 'Germany', 'Italy')

-- 8. countries which have a name that includes the word 'United'
SELECT name
FROM world
WHERE name LIKE 'United%'

-- 9. A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million.
-- Show the countries that are big by area or big by population.
-- Show name, population and area.
SELECT name, population, area
FROM world
WHERE area > 3000000 OR population > 250000000

-- 10. Show the countries that are big by area or big by population but not both.
-- Show name, population and area.
SELECT name, population, area
FROM world
WHERE area > 3000000 XOR population > 250000000

-- 11. Name and population in millions and the GDP in billions for the countries of the continent 'South America'
-- Use the ROUND function to show the values to two decimal places.
SELECT name, ROUND(population/1000000, 2), ROUND(GDP/1000000000, 2)
FROM world
WHERE continent = 'South America'

-- 12. Name and per-capita GDP for countries with a GDP of at least one trillion.
-- Round this value to the nearest 1000.
SELECT name, ROUND(GDP/population, -3)
FROM world
WHERE GDP >= 1000000000000

-- 13. Name and capital where the name and the capital have the same number of characters.
SELECT name, capital
FROM world
WHERE LENGTH(name) = LENGTH(capital)

-- 14. Name and capital where the first letters of each match.
-- Don't include countries where the name and the capital are the same word.
-- You can use the function LEFT to isolate the first character.
-- You can use <> as the NOT EQUALS operator.
SELECT name, capital
FROM world
WHERE LEFT(name, 1) = LEFT(capital, 1) AND name <> capital

-- 15. Country that has all the vowels and no spaces in its name.
SELECT name
FROM world
WHERE name LIKE '%a%'
AND name LIKE '%e%'
AND name LIKE '%i%'
AND name LIKE '%o%'
AND name LIKE '%u%'
AND name NOT LIKE '% %'
