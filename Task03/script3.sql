--- Написать запрос, возвращающий информацию о рейтингах в более читаемом формате: имя и фамилия эксперта, название фильма, год выпуска, оценка и дата оценки в формате ГГГГ-ММ-ДД. Отсортировать данные по имени эксперта, затем названию фильма и оценке. В списке оставить первые 50 записей.
SELECT 
    users.name AS expert_name,
    movies.title AS movie_title,
    movies.year AS release_year,
    ratings.rating,
    DATE(ratings.timestamp, 'unixepoch') AS rating_date 
FROM ratings
JOIN users ON ratings.user_id = users.id
JOIN movies ON ratings.movie_id = movies.id 
ORDER BY users.name ASC, movies.title ASC, ratings.rating ASC LIMIT 50;