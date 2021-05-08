SELECT ROW_NUMBER() OVER(ORDER BY models_qty DESC,
                                  maker,
                                  model),
       maker,
       model
FROM
(
    SELECT models_qty,
           p.maker,
           p.model
    FROM Product p
         JOIN
    (
        SELECT maker,
               COUNT(model) models_qty
        FROM Product
        GROUP BY maker
    ) q ON q.Maker = p.Maker
) sub;

-- Variant 2
SELECT ROW_NUMBER() OVER(ORDER BY qty DESC,
                                  p.maker,
                                  p.model) [no],
       p.maker,
       p.model
FROM Product p
     JOIN
(
    SELECT COUNT(model) qty,
           maker
    FROM Product
    GROUP BY maker
) q ON q.Maker = p.Maker;