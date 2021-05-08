-- Найдите модели ПК-блокнотов, скорость которых меньше скорости любого из ПК. 
-- Вывести: type, model, speed
SELECT DISTINCT 'laptop' type,
       l.model,
       speed
FROM Laptop l
WHERE l.speed < 
(
    SELECT MIN(speed)
    FROM PC
)