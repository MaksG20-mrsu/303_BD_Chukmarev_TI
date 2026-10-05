@echo off
chcp 65001

sqlite3 movies_rating.db < db_init.sql

echo "1. Составить список фильмов, имеющих хотя бы одну оценку. Список фильмов отсортировать по году выпуска и по названиям. В списке оставить первые 10 фильмов."
echo --------------------------------------------------
sqlite3 movies_rating.db -box -echo "SELECT * FROM movies m WHERE EXISTS (SELECT 1 FROM ratings r WHERE r.movie_id = m.id) ORDER BY m.year, m.title LIMIT 10;"

echo "2. Вывести список всех пользователей, фамилии (не имена!) которых начинаются на букву 'A'. Полученный список отсортировать по дате регистрации. В списке оставить первых 5 пользователей."
echo --------------------------------------------------
sqlite3 movies_rating.db -box -echo "SELECT * FROM users WHERE name LIKE 'A%% %%' ORDER BY register_date LIMIT 5"

echo "3. Написать запрос, возвращающий информацию о рейтингах в более читаемом формате: имя и фамилия эксперта, название фильма, год выпуска, оценка и дата оценки в формате ГГГГ-ММ-ДД. Отсортировать данные по имени эксперта, затем названию фильма и оценке. В списке оставить первые 50 записей."
sqlite3 movies_rating.db -box -echo "SELECT users.name AS expert_name, movies.title AS movie_title, movies.year AS release_year, ratings.rating, DATE(ratings.timestamp, 'unixepoch') AS rating_date FROM ratings JOIN users ON ratings.user_id = users.id JOIN movies ON ratings.movie_id = movies.id ORDER BY users.name ASC, movies.title ASC, ratings.rating ASC LIMIT 50;"