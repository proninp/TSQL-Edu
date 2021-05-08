SELECT q.maker,
       type,
       CAST(tmQty * 100.0 / mQty AS NUMERIC(12, 2)) perc
FROM
(
    SELECT w.type,
           w.maker,
           COALESCE(tmQty, 0) tmQty
    FROM
(
    SELECT type,
           maker,
           COUNT(model) tmQty
    FROM Product
    GROUP BY type,
             maker
) e
RIGHT JOIN
(
    SELECT DISTINCT
           type,
           q.maker
    FROM Product
         CROSS JOIN
(
    SELECT DISTINCT
           maker
    FROM Product
) q
) w ON w.maker = e.maker
       AND w.type = e.type
) q
LEFT JOIN
(
    SELECT maker,
           COUNT(model) mQty
    FROM Product
    GROUP BY maker
) w ON q.maker = w.maker;