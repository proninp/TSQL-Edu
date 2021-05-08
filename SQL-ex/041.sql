SELECT title,
       info
FROM
(
    SELECT TOP 1 p.model,
                 CAST(p.speed AS VARCHAR(50)) speed,
                 CAST(p.ram AS VARCHAR(50)) ram,
                 CAST(p.hd AS VARCHAR(50)) hd,
                 CAST(p.cd AS VARCHAR(50)) cd,
                 CAST(p.price AS VARCHAR(50)) price
    FROM PC p ORDER BY code DESC
) x UNPIVOT(info FOR title IN(model,
                              speed,
                              ram,
                              hd,
                              cd,
                              price)) unpvt;