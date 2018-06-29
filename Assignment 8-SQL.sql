USE sakila;

SELECT first_name, last_name FROM actor;

SELECT CONCAT(first_name, ' ', last_name) AS 'Actor Name' FROM actor;

SELECT * FROM actor WHERE last_name LIKE '%GEN%';

SELECT last_name, first_name FROM actor WHERE last_name LIKE '%LI%';

SELECT country_id, country FROM country WHERE country IN ('Afghanistan', 'Bangladesh', 'China');

#The first 4-5 problems are quite easy just simple SELECT query

ALTER TABLE actor
	ADD middle_name VARCHAR(25) AFTER first_name;
    
ALTER TABLE actor
	MODIFY COLUMN middle_name blob;

ALTER TABLE actor
	DROP COLUMN middle_name;
    
#These three required ALTER TABLE command
    
SELECT last_name, COUNT(*) AS 'count' FROM actor GROUP BY last_name;

SELECT last_name, COUNT(*) AS 'count' FROM actor GROUP BY last_name HAVING COUNT(*) > 1;

UPDATE actor
SET first_name ='HARPO'
WHERE (first_name ='GROUCHO' AND last_name = 'WILLIAMS');

UPDATE actor
SET first_name ='GROUCHO'
WHERE (first_name ='HARPO' AND last_name = 'WILLIAMS');

UPDATE actor
SET first_name ='MUCHO GROUCHO'
WHERE first_name ='GROUCHO';

SHOW CREATE TABLE address;

#THe above one I had to research

SELECT staff.first_name, staff.last_name, address.address
FROM staff
INNER JOIN address ON
staff.address_id = address.address_id;

SELECT staff.first_name, staff.last_name, SUM(payment.amount) AS 'Total', payment.payment_date
FROM staff
INNER JOIN payment ON
staff.staff_id = payment.staff_id
WHERE payment.payment_date LIKE '%2005_08%';

SELECT film.title, COUNT(film_actor.actor_id)
FROM film
INNER join film_actor ON
film.film_id = film_actor.film_id
GROUP BY film.title;

SELECT COUNT(*)
FROM inventory
WHERE film_id IN
	(
    SELECT film_id
    FROM film
    WHERE title = 'Hunchback Impossible'
    );

SELECT customer.last_name, customer.first_name, SUM(payment.amount)
FROM customer
INNER JOIN payment ON
customer.customer_id = payment.customer_id
GROUP BY customer.last_name;

#The problems for 6 were all a combination of JOINs and nested subqueries

SELECT * FROM film WHERE film.title LIKE 'K%' OR 'Q%'
INNER JOIN language ON
language.language_id = film.language_id
WHERE language.name = 'English';

#Had some problems with 7a

SELECT first_name, last_name
FROM actor
WHERE actor_id IN
 (
  SELECT actor_id
  FROM film_actor
  WHERE film_id IN
   (
    SELECT film_id
    FROM film
    WHERE title = 'Alone Trip'
   )
  );
  
SELECT customer.first_name, customer.last_name, customer.email
FROM customer
INNER JOIN address ON customer.address_id = address.address_id
INNER JOIN city ON address.city_id = city.city_id
WHERE country_id = '20';

SELECT title, rating FROM film WHERE rating = 'PG';

SELECT SUM(payment.amount), store.store_id
FROM payment
INNER JOIN staff ON payment.staff_id = staff.staff_id
INNER JOIN store ON staff.store_id = store.store_id;

SELECT store.store_id, city.city, country.country 
FROM store
INNER JOIN address ON store.address_id = address.address_id
INNER JOIN city ON address.city_id = city.city_id
INNER JOIN country ON city.country_id = country.country_id;

#7h I also could not figure out, so I am using 7d for the VIEW;

CREATE VIEW family_movies AS
SELECT title, rating
FROM film
WHERE rating = 'PG';

SELECT * FROM family_movies;

DROP VIEW family_movies;

#And that's it for the problem set!