--- Составить список фильмов с указанием их средней оценки и места в рейтинге по средней оценке. Полученный список отсортировать по году выпуска и названиям фильмов. В списке оставить первые 20 записей.
WITH avg_ratings AS (
    SELECT movie_id, AVG(rating) AS avg_rating
    FROM ratings
    GROUP BY movie_id
)
SELECT m.title AS movie, m.year, a.avg_rating,
       RANK() OVER (ORDER BY a.avg_rating DESC) AS rating_place
FROM movies m
JOIN avg_ratings a ON a.movie_id = m.id
ORDER BY m.year, m.title
LIMIT 20;