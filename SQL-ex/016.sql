-- Найдите пары моделей PC, имеющих одинаковые скорость и RAM.
-- В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i),
-- Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.
SELECT DISTINCT
       p1.model model1,
       p2.model model2,
       p1.speed,
       p1.ram
FROM pc p1,
     pc p2
WHERE p1.speed = p2.speed
      AND p1.ram = p2.ram
      AND p1.model > p2.model;