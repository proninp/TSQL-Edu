SELECT COUNT(*) qty
FROM
(
    SELECT COUNT(maker) qty
    FROM Product
    GROUP BY maker
    HAVING COUNT(model) = 1
) a;