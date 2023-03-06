/*
 * This question and the next one are inspired by the Bacon Number:
 * https://en.wikipedia.org/wiki/Six_Degrees_of_Kevin_Bacon#Bacon_numbers
 *
 * List all actors with Bacall Number 1.
 * That is, list all actors that have appeared in a film with 'RUSSELL BACALL'.
 * Do not list 'RUSSELL BACALL', since he has a Bacall Number of 0.
 */

SELECT DISTINCT CONCAT(actor.first_name, ' ', actor.last_name) AS "Actor Name" FROM actor
JOIN film_actor ON film_actor.actor_id = actor.actor_id
JOIN film ON film.film_id = film_actor.film_id
JOIN film_actor f_bacall ON f_bacall.film_id = film.film_id
JOIN actor bacall ON f_bacall.actor_id = bacall.actor_id AND bacall.first_name = 'RUSSELL' AND bacall.last_name = 'BACALL'
WHERE CONCAT(actor.first_name, ' ', actor.last_name) != 'RUSSELL BACALL'
ORDER BY "Actor Name" ASC;


