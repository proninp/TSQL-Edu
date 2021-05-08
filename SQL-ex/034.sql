SELECT name
FROM Ships
WHERE class IN
(
    SELECT class
    FROM Classes
    WHERE type = 'bb'
          AND displacement > 35000
)
      AND launched >= 1922;