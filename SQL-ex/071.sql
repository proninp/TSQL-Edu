SELECT DISTINCT
       maker
FROM Product
WHERE type = 'PC'
EXCEPT
SELECT maker
FROM Product p1
WHERE type = 'PC'
      AND model NOT IN
(
    SELECT p2.model
    FROM Product p2
         JOIN pc ON p2.model = pc.model
    WHERE p2.maker = p1.maker
);

-- var. 2

SELECT q.maker
FROM (SELECT p.maker,
           COUNT(model) ttlmodel
    FROM Product p
    WHERE type = 'pc'
    GROUP BY p.maker) q
JOIN (SELECT maker,
           COUNT(model) qty
      FROM(
	   SELECT DISTINCT maker,
           pc.model
        FROM Product p
        JOIN PC ON p.model = pc.model) q
    GROUP BY maker) w ON w.maker = q.maker
WHERE q.ttlmodel = w.qty
