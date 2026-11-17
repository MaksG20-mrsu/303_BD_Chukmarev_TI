---Найти все пары пользователей, оценивших один и тот же фильм. Устранить
---дубликаты, проверить отсутствие пар с самим собой. Для каждой пары должны
---быть указаны имена пользователей и название фильма, который они ценили. В
---списке оставить первые 100 записей.
SELECT DISTINCT u1.name AS user1, u2.name AS user2, m.title
FROM ratings r1
JOIN ratings r2 ON r1.movie_id = r2.movie_id AND r1.user_id < r2.user_id
JOIN users u1 ON u1.id = r1.user_id
JOIN users u2 ON u2.id = r2.user_id
JOIN movies m ON m.id = r1.movie_id
ORDER BY m.title, user1, user2
LIMIT 100;