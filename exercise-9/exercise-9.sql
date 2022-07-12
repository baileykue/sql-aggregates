-- ROLLUP of amount made per year, month, day
-- use ROLLUP and EXTRACT YEAR, MONTH, DAY from payment_date

SELECT
  EXTRACT(YEAR FROM payment_date) y,
  EXTRACT(MONTH FROM payment_date) m,
  EXTRACT(DAY FROM payment_date) d,
  SUM(amount)
FROM
  payment
GROUP BY 
  ROLLUP(
    EXTRACT(YEAR FROM payment_date),
    EXTRACT(MONTH FROM payment_date),
    EXTRACT(DAY FROM payment_date)
  );