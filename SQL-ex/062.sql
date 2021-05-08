SELECT SUM(rem) rem
FROM
(
    SELECT SUM(inc) rem
    FROM Income_o
    WHERE date < '20010415'
    UNION ALL
    SELECT-SUM(out)
    FROM Outcome_o
    WHERE date < '20010415'
) q;