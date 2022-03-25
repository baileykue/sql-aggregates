-- CUBE of amount made per year, month, day, and film rating
-- similar to exercise 9 but include the rating with joins
-- replace ROLLUP with CUBE

SELECT
  EXTRACT(YEAR FROM payment_date) y,
  EXTRACT(MONTH FROM payment_date) m,
  EXTRACT(DAY FROM payment_date) d,
  SUM(amount),
  rating
FROM
  payment
LEFT JOIN 
	rental
ON 
	payment.rental_id = rental.rental_id
LEFT JOIN
	inventory
ON 
	rental.inventory_id = inventory.inventory_id
LEFT JOIN 
	film
ON
	inventory.film_id = film.film_id
GROUP BY
  CUBE(
    EXTRACT(YEAR FROM payment_date),
    EXTRACT(MONTH FROM payment_date),
    EXTRACT(DAY FROM payment_date),
    rating
  )
ORDER BY rating, y, m, d;