SELECT TOP 1 WITH TIES name,
                       tripCount
FROM
(
    SELECT pit.ID_psg,
(
    SELECT COUNT(trip_no)
    FROM Pass_in_trip p
    WHERE p.ID_psg = pit.ID_psg
) tripCount
    FROM Pass_in_trip pit
         JOIN Trip t ON pit.trip_no = t.trip_no
    GROUP BY ID_psg
    HAVING COUNT(DISTINCT ID_comp) = 1
) q
JOIN Passenger p ON p.ID_psg = q.ID_psg
ORDER BY tripCount DESC;


/* Option 2 */

SELECT TOP 1 WITH TIES p.name
		 ,COUNT(t.trip_no) trips_qty
FROM Trip t
JOIN Pass_in_trip pit ON pit.trip_no = t.trip_no
JOIN Passenger p ON pit.ID_psg = p.ID_psg
GROUP BY pit.ID_psg,p.name
HAVING COUNT(DISTINCT ID_comp) = 1
ORDER BY trips_qty DESC