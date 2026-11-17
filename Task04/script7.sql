--- С помощью рекурсивного CTE составить таблицу умножения для чисел от 1 до 10.
WITH RECURSIVE nums(n) AS (
    SELECT 1
    UNION ALL
    SELECT n + 1 FROM nums WHERE n < 10
)
SELECT a.n || 'x' || b.n || '=' || (a.n * b.n) AS [Таблица умножения]
FROM nums a CROSS JOIN nums b
ORDER BY a.n, b.n;