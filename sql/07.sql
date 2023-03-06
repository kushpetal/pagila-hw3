/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSELL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */


WITH
bacall_1 AS (
  SELECT DISTINCT actor.actor_id
  FROM actor
  JOIN film_actor ON film_actor.actor_id = actor.actor_id
  JOIN film ON film.film_id = film_actor.film_id
  JOIN film_actor f_bacall ON f_bacall.film_id = film.film_id
  JOIN actor bacall ON f_bacall.actor_id = bacall.actor_id AND bacall.first_name = 'RUSSELL' AND bacall.last_name = 'BACALL'
),
bacall_2 AS (
  SELECT DISTINCT actor.actor_id
  FROM actor
  JOIN film_actor ON actor.actor_id = film_actor.actor_id
  JOIN film ON film_actor.film_id = film.film_id
  JOIN film_actor f_bacall ON f_bacall.film_id = film.film_id
  JOIN bacall_1 b1 ON f_bacall.actor_id = b1.actor_id
  WHERE actor.actor_id NOT IN (SELECT actor_id FROM bacall_1)
)
SELECT CONCAT(actor.first_name, ' ', actor.last_name) AS "Actor Name"
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN film ON film_actor.film_id = film.film_id
JOIN film_actor f_bacall ON f_bacall.film_id = film.film_id
JOIN bacall_2 b2 ON f_bacall.actor_id = b2.actor_id
WHERE CONCAT(actor.first_name, ' ', actor.last_name) NOT IN ('RUSSELL BACALL') AND actor.actor_id NOT IN (SELECT actor_id FROM bacall_1)
GROUP BY "Actor Name"
ORDER BY "Actor Name" ASC;

