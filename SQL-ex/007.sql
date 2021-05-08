-- Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).
SELECT p.model,
       p.price
FROM PC p
     JOIN Product pr ON pr.model = p.model
                        AND pr.Maker = 'B'
UNION
SELECT l.model,
       l.price
FROM Laptop l
     JOIN Product pr ON pr.model = l.model
                        AND pr.Maker = 'B'
UNION
SELECT prin.model,
       prin.price
FROM Printer prin
     JOIN Product pr ON pr.model = prin.model
                        AND pr.Maker = 'B'