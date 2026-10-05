--- Вывести список фильмов с указанием тегов, которые были им присвоены пользователями. Сортировать по году выпуска, затем по названию фильма, затем по тегу. В списке оставить первые 40 записей
SELECT
    movies.title AS movie_title,
    movies.year AS release_year,
    tags.tag AS tag
FROM movies
JOIN tags ON tags.movie_id = movies.id
ORDER BY 
    movies.year ASC,
    movies.title ASC,
    tags.tag ASC
LIMIT 40;