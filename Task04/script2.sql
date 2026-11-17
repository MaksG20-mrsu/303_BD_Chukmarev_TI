--- Найти 10 самых свежих оценок от разных пользователей, вывести названия фильмов, имена пользователей, оценку, дату отзыва в формате ГГГГ-ММ-ДД.
WITH latest AS (
    SELECT r.*, ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY timestamp DESC) AS rn
    FROM ratings r
)
SELECT m.title AS movie, u.name AS user_name, l.rating,
       strftime('%Y-%m-%d', l.timestamp, 'unixepoch') AS date
FROM latest l
JOIN movies m ON m.id = l.movie_id
JOIN users u ON u.id = l.user_id
WHERE l.rn = 1
ORDER BY l.timestamp DESC
LIMIT 10;