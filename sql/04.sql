/*
 * List the first and last names of all actors who:
 * 1. have appeared in at least one movie in the "Children" category,
 * 2. but that have never appeared in any movie in the "Horror" category.
 */


WITH children_actors AS (
SELECT actor.first_name, actor.last_name FROM actor
JOIN film_actor ON film_actor.actor_id = actor.actor_id
JOIN film ON film.film_id = film_actor.film_id
JOIN film_category ON film_category.film_id = film.film_id
JOIN category ON category.category_id = film_category.category_id
WHERE category.name = 'Children'
GROUP BY actor.first_name, actor.last_name
),

horror_actors AS (
SELECT actor.first_name, actor.last_name FROM actor
JOIN film_actor ON film_actor.actor_id = actor.actor_id
JOIN film ON film.film_id = film_actor.film_id
JOIN film_category ON film_category.film_id = film.film_id
JOIN category ON category.category_id = film_category.category_id
WHERE category.name = 'Horror'
GROUP BY actor.first_name, actor.last_name
)

SELECT children_actors.* FROM children_actors
WHERE CONCAT(children_actors.first_name, ' ', children_actors.last_name) NOT IN (SELECT CONCAT(horror_actors.first_name, ' ', horror_actors.last_name) FROM horror_actors)
ORDER BY children_actors.last_name ASC, children_actors.first_name ASC;

