/*
 * You love the acting in the movie 'AMERICAN CIRCUS' and want to watch other movies with the same actors.
 *
 * Write a SQL query that lists the title of all movies where at least 2 actors were also in 'AMERICAN CIRCUS'.
 *
 * HINT:
 * This can be solved with a self join on the film_actor table.
 */


WITH movie_actors AS (
SELECT actor.actor_id FROM actor
JOIN film_actor ON film_actor.actor_id = actor.actor_id
JOIN film ON film.film_id = film_actor.film_id
WHERE film.title = 'AMERICAN CIRCUS'
),
movies AS (
SELECT actor.actor_id, film.title FROM actor
JOIN film_actor ON film_actor.actor_id = actor.actor_id
JOIN film ON film.film_id = film_actor.film_id
)

SELECT movies.title FROM movies
WHERE movies.actor_id IN (SELECT movie_actors.* FROM movie_actors)
GROUP BY movies.title 
HAVING COUNT(movies.actor_id) >= 2
ORDER BY movies.title ASC;




