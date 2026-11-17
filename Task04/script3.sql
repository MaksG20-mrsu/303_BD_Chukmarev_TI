--- Вывести в одном списке все фильмы с максимальным средним рейтингом и все фильмы с минимальным средним рейтингом. Общий список отсортировать по году выпуска и названию фильма. В зависимости от рейтинга в колонке "Рекомендуем" для фильмов должно быть написано "Да" или "Нет".
WITH avg_ratings AS (
    SELECT movie_id, AVG(rating) AS avg_rating
    FROM ratings
    GROUP BY movie_id
),
minmax AS (
    SELECT MAX(avg_rating) AS max_avg, MIN(avg_rating) AS min_avg FROM avg_ratings
)
SELECT m.title AS movie, m.year, a.avg_rating,
       CASE WHEN a.avg_rating = mm.max_avg THEN 'Да' ELSE 'Нет' END AS [Рекомендуем]
FROM avg_ratings a
JOIN movies m ON m.id = a.movie_id
CROSS JOIN minmax mm
WHERE a.avg_rating = mm.max_avg OR a.avg_rating = mm.min_avg
ORDER BY m.year, m.title;