-- Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.
SELECT AVG(speed) speed
FROM Laptop
WHERE price > 1000;