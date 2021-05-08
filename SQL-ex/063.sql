SELECT name
FROM Passenger p
     JOIN
(
    SELECT DISTINCT
           ID_psg
    FROM Pass_in_trip
    GROUP BY ID_psg,
             place
    HAVING COUNT(date) > 1
) q ON q.ID_psg = p.ID_psg;