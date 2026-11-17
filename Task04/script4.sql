--- Вычислить количество оценок и среднюю оценку, которую дали фильмам пользователи-женщины в период с 2010 по 2012 год.
SELECT COUNT(*) AS count_ratings, AVG(r.rating) AS avg_rating
FROM ratings r
JOIN users u ON u.id = r.user_id
WHERE u.gender = 'female'
  AND strftime('%Y', r.timestamp, 'unixepoch') BETWEEN '2010' AND '2012';