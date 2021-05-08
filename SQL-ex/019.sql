-- Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов. 
-- Вывести: maker, средний размер экрана.
SELECT maker,
       AVG(screen) size
FROM Product pr
     JOIN Laptop l ON pr.Model = l.model
GROUP BY maker;