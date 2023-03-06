/*
 * Compute the country with the most customers in it. 
 */

SELECT country.country FROM customer
JOIN address ON address.address_id = customer.address_id
JOIN city ON city.city_id = address.city_id
JOIN country ON country.country_id = city.country_id
GROUP BY country.country
ORDER BY COUNT(customer.customer_id) DESC
LIMIT 1


