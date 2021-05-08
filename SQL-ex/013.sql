-- Найдите среднюю скорость ПК, выпущенных производителем A.
SELECT AVG(speed) speed
FROM PC pc
     JOIN Product pr ON pr.Model = pc.model
                        AND pr.Maker = 'A';