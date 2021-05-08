SELECT maker,
       MAX(price) price
FROM Product pr
     JOIN PC p ON pr.Model = p.model
GROUP BY maker;