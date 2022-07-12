-- customer ranking by total film time watched
-- similar to exercise 6

SELECT
	email,
    RANK() OVER (ORDER BY SUM(length) DESC)
FROM
	rental
LEFT JOIN
	inventory
ON
	rental.inventory_id = inventory.inventory_id
LEFT JOIN
	film
ON 
	inventory.film_id = film.film_id
LEFT JOIN
	customer
ON 
	rental.customer_id = customer.customer_id
GROUP BY
	email
ORDER BY
	rank ASC