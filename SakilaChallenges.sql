USE sakila;

#Question 1: List all actors.

SELECT first_name, last_name FROM actor;

#Question 2: Find the surname of the actor with the forename 'John'.

SELECT first_name, last_name from actor
WHERE first_name ='john';

#Question 3: Find all actors with surname 'Neeson'.

SELECT first_name, last_name from actor
WHERE last_name ='neeson';

#Question 4: Find all actors with ID numbers divisible by 10.

SELECT first_name, last_name FROM actor WHERE actor_id % 10 = 0;

#Question 5: What is the description of the movie with an ID of 100?

SELECT title, description FROM film
where film_id='100';

#Question 6: Find every R-rated movie.

SELECT * FROM film
where rating='R';

#Question 7: Find every non-R-rated movie.

SELECT * FROM film
WHERE rating!='R';

#Question 8: Find the ten shortest movies.

SELECT * from film 
ORDER BY length ASC LIMIT 10;

#Question 9: Find the movies with the longest runtime, without using LIMIT.
SELECT title, length FROM film WHERE length = (SELECT MAX(length) FROM film);

#Question 10: Find all movies that have deleted scenes.
SELECT * from film
WHERE special_features LIKE '%deleted scenes%';

#Question 11: Using HAVING, reverse-alphabetically list the last names that are not repeated.

SELECT last_name from actor
GROUP BY last_name
HAVING COUNT(last_name)=1
ORDER BY last_name DESC;

#Question 12: Using HAVING, list the last names that appear more than once, from highest to lowest frequency.

SELECT last_name, COUNT(last_name) AS Frequency FROM actor
GROUP BY last_name
HAVING COUNT(last_name)>1
ORDER BY (SELECT COUNT(last_name) FROM actor ORDER BY COUNT(last_name) DESC);

#Question 13: Which actor has appeared in the most films?

SELECT first_name AS First, last_name AS Last, COUNT(actor.actor_id) AS Frequency FROM actor
JOIN film_actor ON film_actor.actor_id=actor.actor_id
GROUP BY film_actor.actor_id
ORDER BY COUNT(actor.actor_id) DESC
LIMIT 1;


#Question 14: When is 'Academy Dinosaur' due?


#Question 15: What is the average runtime of all films?

SELECT AVG(length) FROM film;

#Question 16: List the average runtime for every film category.

SELECT category.name, round(AVG(length)) FROM film
JOIN film_catergory USING (film_id)
JOIN category USING (category_id)
GROUP BY category.name
ORDER BY AVG(length) DESC;

select category.name, round(avg(length))
from film join film_category using (film_id)
join category using (category_id)
group by category.name
order by avg(length) desc;

#Question 17: List all movies featuring a robot.
SELECT * FROM film
WHERE description like '%robot%';

#Question 18: How many movies were released in 2010?
SELECT * FROM film
WHERE release_year='2010';

#Question 19: Find the titles of all the horror movies.
select f.title
from film f
JOIN film_category fc ON f.film_id=fc.film_id
JOIN category c ON c.category_id=fc.category_id
WHERE c.name = "horror";

#Question 20: List the full name of the staff member with the ID of 2.
SELECT first_name, last_name FROM staff
WHERE staff_id='2';

#Question 21: List all the movies that Fred Costner has appeared in.
SELECT * FROM actor
INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN film ON film_actor.film_id=film.film_id
WHERE actor.first_name = 'Fred' AND actor.last_name = 'Costner';

#Question 22: How many distinct countries are there?
SELECT COUNT(DISTINCT(country)) FROM country;

#Question 23: List the name of every language in reverse-alphabetical order. 
SELECT * FROM language
ORDER BY name DESC;

#Question 24: List the full names of every actor whose surname ends with '-son' in alphabetical order by their forename.
SELECT first_name, last_name FROM actor
WHERE last_name like '%son'
ORDER BY first_name;

#Question 25: Which category contains the most films?

SELECT category.name, count(film.title)
FROM film_category
JOIN film ON film_category.film_id = film.film_id
JOIN category ON film_category.category_id = category.category_id
group by category.name
order by category.name desc
limit 1;



