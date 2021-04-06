-- Question 1 (actors with last name 'Wahlberg')
SELECT *
FROM actor;

-- Shows list of last_name Wahlberg
SELECT first_name,last_name
FROM actor
WHERE last_name = 'Wahlberg'

-- Shows number count of last_name 'Wahlberg'
SELECT COUNT(last_name)
FROM actor
WHERE last_name = 'Wahlberg'



-- Question 2 (payments made between 3.99 and 5.99)
SELECT *
FROM payment;

-- List of the amounts between 3.99 and 5.99
SELECT amount
FROM payment
WHERE amount BETWEEN 3.99 and 5.99
ORDER BY amount ASC;

-- Count of the amounts between 3.99 and 5.99
SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 and 5.99;



-- Question 3 (what film does the store have the most of)
SELECT *
FROM inventory
ORDER BY film_id DESC;

-- Results for both Store 1 and Store 2
SELECT film_id, COUNT(film_id)
FROM inventory
GROUP BY film_id
ORDER BY count DESC;

-- Results for Store 1 Only
SELECT film_id, COUNT(film_id), store_id
FROM inventory
WHERE store_id = 1
GROUP BY film_id, store_id
ORDER BY count DESC;

-- Results for Store 2 Only
SELECT film_id, COUNT(film_id), store_id
FROM inventory
WHERE store_id = 2
GROUP BY film_id, store_id
ORDER BY count DESC;



-- Question 4 (how many customers have the last name 'William')
SELECT *
FROM customer;

-- List of customers with last name 'William'
SELECT first_name, last_name
FROM customer
WHERE last_name = 'William';

-- Count of customers with last name 'William'
SELECT first_name, last_name
FROM customer
WHERE last_name = 'William';



-- Question 5 (which store employee sold the most rentals)
SELECT *
FROM rental

-- Counts by staff_id
SELECT COUNT(staff_id) AS count_of_rentals_sold, staff_id
FROM rental
GROUP BY staff_id;

-- ER checking work - shows total count for full table
-- SELECT COUNT(*)
-- FROM rental;





-- Question 6 (how many different district names are there)
SELECT *
from address;

-- With blanks fields in district removed
SELECT COUNT(DISTINCT district), district
FROM address
WHERE district != ''
GROUP BY district
ORDER by district ASC;

-- Simply count-only of unique districts - blanks removed
SELECT COUNT (DISTINCT district)
FROM address
WHERE district != '';



-- Question 7 (which film has the most actors in it)
SELECT *
FROM film_actor
ORDER BY film_id DESC;

-- Shows number of times each film_id is listed (once for each actor in the film)
SELECT film_id, COUNT(film_id) AS count_of_film_id
FROM film_actor
GROUP BY film_id
ORDER BY count_of_film_id DESC;



-- Question 8 (how many customers from store_id 1 have a last name ending in 'es')
SELECT *
FROM customer;

-- List of customers in store_id 1 with last_name ending in 'es'
SELECT store_id, first_name, last_name
FROM customer
WHERE store_id = 1 
AND last_name LIKE '%es';



-- Question 9 (how many payment amts had a number of rentals above 250 for customers with ids bet'n 380 and 430)
SELECT *
FROM payment;

SELECT COUNT(amount) AS count_amount, amount
FROM payment
WHERE customer_id BETWEEN 380 and 430
GROUP BY amount
HAVING COUNT(amount) > 250
ORDER BY amount ASC;



-- Question 10 (in the film table, how many rating categories are there - which rating has the most movies)
SELECT *
FROM film;

-- Displays different ratings and number assigned to each rating
SELECT COUNT(rating) AS rating_count, rating
FROM film
GROUP BY rating
ORDER BY rating_count DESC;


-- ER - Confirming count (1,000 film_ids here and 1,000 assigned to ratings in above query)
-- SELECT COUNT(film_id), film_id
-- FROM film
-- GROUP BY film_id
-- ORDER BY film_id DESC;
