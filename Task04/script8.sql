--- С помощью рекурсивного CTE выделить все жанры фильмов, имеющиеся в таблице movies (каждый жанр в отдельной строке).
WITH RECURSIVE split(id, genre, rest) AS (
    SELECT id, '', genres || '|' FROM movies
    UNION ALL
    SELECT id,
           SUBSTR(rest, 1, INSTR(rest, '|') - 1),
           SUBSTR(rest, INSTR(rest, '|') + 1)
    FROM split
    WHERE rest <> ''
)
SELECT DISTINCT genre
FROM split
WHERE genre <> ''
ORDER BY genre;