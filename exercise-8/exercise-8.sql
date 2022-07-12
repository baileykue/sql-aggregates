-- rank of film category by times rented
-- include the name, count, and rank

SELECT
  category.name, 
  COUNT(*),
  RANK() OVER (ORDER BY COUNT(*) DESC)
FROM
  category
INNER JOIN 
    film_category
ON 
    film_category.category_id = category.category_id
INNER JOIN 
    film
ON 
    film.film_id = film_category.film_id
INNER JOIN 
    inventory
ON 
    inventory.film_id = film.film_id
INNER JOIN 
    rental
ON 
    rental.inventory_id = inventory.inventory_id
GROUP BY 
    category.name;