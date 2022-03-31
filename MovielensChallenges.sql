use movielens;

#Question 1: List the titles and release dates of movies released between 1983-1993 in reverse chronological order.
 
SELECT title, release_date FROM movies
WHERE release_date BETWEEN '1983-01-01' AND '1993-01-12'
ORDER BY release_date DESC;

#Question 2: Without using LIMIT, list the titles of the movies with the lowest average rating.

SELECT movies.title, SUM(ratings.rating)/COUNT(ratings.movie_id)
FROM movies
JOIN ratings ON movies.id=ratings.movie_id
GROUP BY ratings.movie_id
ORDER BY SUM(ratings.rating)/COUNT(ratings.movie_id) asc;

#Question 3: List the unique records for Sci-Fi movies where male 24-year-old students have given 5-star ratings.

SELECT movies.id, users.id, genres.name, users.age, users.gender, ratings.rating
FROM genres_movies
JOIN movies ON genres_movies.movie_id = movies.id
JOIN genres ON genres_movies.genre_id = genres.id
JOIN ratings ON movies.id = ratings.movie_id
JOIN users ON ratings.user_id = users.id
WHERE ratings.rating = 5 AND
users.gender = 'M'
AND genres.name = 'Sci-Fi'
AND users.age = 24
ORDER BY users.id;

#Question 4: List the unique titles of each of the movies released on the most popular release day.

SELECT title, release_date from movies
WHERE release_date = (SELECT release_date FROM movies 
GROUP BY release_date ORDER BY COUNT(id) DESC LIMIT 1);

#Question 5: Find the total number of movies in each genre; list the results in ascending numeric order.
select count(m.title), g.name
from movies m
join genres_movies gm ON m.id = gm.movie_id
join  genres g ON g.id = gm.genre_id
group by g.name
order by count(m.title) asc;



