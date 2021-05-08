SELECT COALESCE(i.point, o.point) point,
       (COALESCE(inc, 0) - COALESCE(out, 0)) res
FROM
(
    SELECT point,
           SUM(inc) inc
    FROM Income_o
    GROUP BY point
) i
FULL JOIN
(
    SELECT point,
           SUM(out) out
    FROM Outcome_o
    GROUP BY point
) o ON i.point = o.point;