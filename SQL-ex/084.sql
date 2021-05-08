SELECT name
       ,SUM(f) [1-10]
	  ,SUM(s) [11-20]
	  ,SUM(t) [21-30]
FROM (SELECT name
		   ,IIF(DATEPART(DAY,date) < 11, 1, 0) f
		   ,IIF((DATEPART(DAY,date) > 10) AND (DATEPART(DAY,date) < 21), 1, 0) s
		   ,IIF(DATEPART(DAY,date) > 20, 1, 0) t
    FROM Pass_in_trip pt
    JOIN Trip t ON t.trip_no = pt.trip_no
    JOIN Company c ON c.ID_comp = t.ID_comp
    WHERE date BETWEEN '20030401' AND '20030430') q
GROUP BY name