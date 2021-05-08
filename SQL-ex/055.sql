SELECT c.class,
       MIN(launched) launched
FROM CLasses c
     LEFT JOIN Ships s ON s.class = c.class
GROUP BY c.class;