SELECT TOP 1 WITH TIES COUNT(t.trip_no) tripsQty,
       q.date
FROM Trip t
JOIN (
    SELECT DISTINCT trip_no,
		    date
    FROM Pass_in_trip pt) q
ON q.trip_no = t.trip_no
WHERE t.town_from = 'Rostov'
GROUP BY q.[date]
ORDER BY tripsQty DESC