-- Найти производителей, которые выпускают более одной модели, 
-- при этом все выпускаемые производителем модели являются продуктами одного типа.
Вывести: maker, type
SELECT DISTINCT
       p.Maker,
       p.type
FROM Product p
WHERE maker IN
(
    SELECT maker
    FROM Product
    GROUP BY maker
    HAVING COUNT(DISTINCT type) = 1
           AND COUNT(model) > 1
);

--- Variant 2:

SELECT p.Maker,
       p.type
FROM Product p
     JOIN
(
    SELECT maker
    FROM Product
    GROUP BY maker
    HAVING COUNT(DISTINCT type) = 1
) pr ON pr.maker = p.maker
GROUP BY p.maker,
         type
HAVING COUNT(p.model) > 1
