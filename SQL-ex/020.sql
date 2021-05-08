-- Найдите производителей, выпускающих по меньшей мере три различных модели ПК. Вывести: Maker, число моделей ПК.
SELECT maker,
       COUNT(*) model_qty
FROM Product
WHERE type = 'pc'
GROUP BY maker
HAVING COUNT(*) > 2;