--- Найти все комедии, выпущенные после 2000 года, которые понравились мужчинам (оценка не ниже 4.5). Для каждого фильма в этом списке вывести название, год выпуска и количество таких оценок. Результат отсортировать по году выпуска и названию фильма
SELECT 
    movies.title,
    movies.year,
    COUNT(ratings.id) AS likes_count
FROM movies
JOIN ratings ON ratings.movie_id = movies.id
JOIN users ON users.id = ratings.user_id
WHERE 
    movies.genres LIKE '%Comedy%'
    AND CAST(movies.year AS INTEGER) > 2000
    AND users.gender = 'male'
    AND ratings.rating >= 4.5
GROUP BY movies.id, movies.title, movies.year
ORDER BY 
    CAST(movies.year AS INTEGER) ASC,
    movies.title ASC;