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