SELECT speed,
       AVG(price) avg_price
FROM PC
GROUP BY speed
HAVING speed > 600;