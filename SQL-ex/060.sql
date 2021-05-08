SELECT COALESCE(i.point, o.point) point,
       (COALESCE(i.inc, 0) - COALESCE(o.out, 0)) res
FROM
(
    SELECT point,
           SUM(inc) inc
    FROM Income_o
    WHERE date < '20010415'
    GROUP BY point
) i
FULL JOIN
(
    SELECT point,
           SUM(out) out
    FROM Outcome_o
    WHERE date < '20010415'
    GROUP BY point
) o ON i.point = o.point;