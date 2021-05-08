-- Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price
SELECT DISTINCT TOP 1 WITH TIES pr.maker,
                                price
FROM Printer p,
     Product pr
WHERE pr.model = p.model
      AND price IS NOT NULL
      AND p.color = 'y' ORDER BY price;


SELECT DISTINCT TOP 1 WITH TIES pr.maker,
                                price
FROM
(
    SELECT model,
           price
    FROM Printer
    WHERE color = 'y'
) p,
Product pr
WHERE pr.model = p.model
      AND price IS NOT NULL ORDER BY price;