SELECT maker
FROM
  (SELECT p.maker, COUNT(DISTINCT model) q, MAX(type) type
    FROM Product p
    GROUP BY p.maker
    HAVING COUNT(DISTINCT type) = 1) t
WHERE t.type = 'Printer' OR (t.type = 'PC' AND q > 2)