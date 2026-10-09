--- Провести анализ занятий (профессий) пользователей - вывести количество пользователей для каждого рода занятий. Найти самую распространенную и самую редкую профессию посетитетей сайта.
SELECT 
    occupation,
    COUNT(*) AS users_count
FROM users
GROUP BY users.occupation
ORDER BY users_count DESC;

--- Самая распространённая:
SELECT 
    users.occupation,
    COUNT(*) AS users_count
FROM users
WHERE users.occupation IS NOT NULL
GROUP BY users.occupation
ORDER BY users_count DESC, users.occupation ASC
LIMIT 1;

--- Самая редкая:
SELECT 
    users.occupation,
    COUNT(*) AS users_count
FROM users
WHERE users.occupation IS NOT NULL
GROUP BY users.occupation
ORDER BY users_count ASC, users.occupation ASC
LIMIT 1;