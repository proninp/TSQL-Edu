SELECT SUM(rem) rem
FROM
(
    SELECT SUM(inc) rem
    FROM Income_o
    UNION ALL
    SELECT-SUM(out)
    FROM Outcome_o
) q;