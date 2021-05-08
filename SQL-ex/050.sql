SELECT DISTINCT
       battle
FROM Outcomes o
     JOIN Ships s ON s.name = o.ship
                     AND s.class = 'Kongo';