-- Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker
SELECT DISTINCT maker
FROM product pr
     JOIN pc p ON p.model = pr.Model
                  AND p.speed >= 450;