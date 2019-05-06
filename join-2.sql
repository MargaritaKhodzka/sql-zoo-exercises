-- movie:
--   id
--   title
--   yr
--   director
--   budget
--   gross
--
-- actor
--   id
--   name
--
-- casting
--   movieid
--   actorid
--   ord

-- 1. List the films where the yr is 1962 [Show id, title]
SELECT id, title
FROM movie
WHERE yr = 1962;

-- 2. Give year of 'Citizen Kane'.
SELECT yr
FROM movie
WHERE title LIKE 'Citizen Kane';

-- 3. List all of the Star Trek movies, include the id, title and yr
-- Order results by year.
SELECT id, title, yr
FROM movie
WHERE title like 'Star Trek%'
ORDER BY yr;

-- 4. What id number does the actor 'Glenn Close' have?
SELECT id
FROM actor
WHERE name LIKE 'Glenn Close' ;

-- 5. What is the id of the film 'Casablanca'
SELECT id
FROM movie
WHERE title LIKE 'Casablanca';

-- 6. Obtain the cast list for 'Casablanca'.
SELECT name
FROM actor JOIN casting ON (id = actorid)
WHERE movieid=11768;

-- 7. Obtain the cast list for the film 'Alien'
SELECT name
FROM actor JOIN casting ON (id = actorid)
WHERE movieid LIKE (SELECT id
                    FROM movie
                    WHERE title LIKE 'Alien');

-- 8. List the films in which 'Harrison Ford' has appeared
SELECT title
FROM movie JOIN casting ON movie.id = casting.movieid JOIN actor ON casting.actorid = actor.id
WHERE name LIKE 'Harrison Ford';

-- 9. List the films where 'Harrison Ford' has appeared - but not in the starring role.
-- If ord=1 then this actor is in the starring role
SELECT title
FROM movie JOIN casting ON movie.id = casting.movieid JOIN actor ON casting.actorid = actor.id
WHERE name = 'Harrison Ford' AND ord != 1;
