SELECT country,
       CAST(AVG(CAST(a.bore * a.bore * a.bore / 2 AS NUMERIC(6, 2))) AS NUMERIC(6, 2)) avg_mw
FROM
(
    SELECT sh.name,
           cl.country,
           cl.bore
    FROM Ships sh,
         Classes cl
    WHERE sh.class = cl.class
    UNION
    SELECT DISTINCT
           o.ship,
           cl.country,
           cl.bore
    FROM Outcomes o,
         Classes cl
    WHERE o.ship = cl.class
) a
GROUP BY country;