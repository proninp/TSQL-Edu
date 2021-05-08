WITH q AS (
    SELECT p.trip_no,
		 town_from,
		 town_to,
		 (CAST(CONVERT(date, p.date) AS datetime) + CAST(CONVERT(TIME, t.time_out) AS datetime)) date_out,
		 p.ID_psg,
		 pas.name
    FROM Pass_in_trip p
    JOIN Trip t ON t.trip_no = p.trip_no
    JOIN Passenger pas ON p.ID_psg = pas.ID_psg)
SELECT name,
       COUNT(*) Flights
FROM q
WHERE town_to = 'Moscow' AND
      ID_psg IN (
	   SELECT ID_psg
	   FROM q qq WHERE town_from <> 'Moscow' AND
				    date_out = (SELECT MIN(date_out)
							 FROM q
							 WHERE ID_psg = qq.ID_psg)
                )
GROUP BY ID_psg, name
HAVING COUNT(*) > 1
