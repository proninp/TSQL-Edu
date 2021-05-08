SELECT CAST(AVG(numGuns * 1.0) AS NUMERIC(8, 2)) avg_numGuns
FROM Classes c
WHERE c.type = 'bb';