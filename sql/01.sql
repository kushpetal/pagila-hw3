/*
 * Compute the number of customers who live outside of the US.
 */


SELECT count(customer.customer_id) FROM customer
JOIN address ON address.address_id = customer.address_id
JOIN city ON city.city_id = address.city_id
JOIN country ON country.country_id = city.country_id
WHERE country.country != 'United States';

