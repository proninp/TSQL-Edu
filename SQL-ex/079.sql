SELECT pas.name,
       total_time_in_fly
FROM
(
    SELECT TOP 1 WITH TIES p.ID_psg,
                           SUM(CASE
                                   WHEN t.time_out > t.time_in
                                   THEN DATEDIFF(minute, t.time_out, t.time_in) + 24 * 60
                                   ELSE DATEDIFF(minute, t.time_out, t.time_in)
                               END) total_time_in_fly
    FROM Pass_in_trip p
         JOIN Trip t ON t.trip_no = p.trip_no
    GROUP BY p.ID_psg ORDER BY total_time_in_fly DESC
) q
JOIN Passenger pas ON q.ID_psg = pas.ID_psg;


/* Option 2 */

SELECT TOP 1 WITH TIES name,
       InFlyghtDuration
FROM (
    SELECT ID_psg,
	   SUM(IIF(DATEDIFF(mi,time_out,time_in) > 0,DATEDIFF(mi,time_out,time_in),24*60+DATEDIFF(mi,time_out,time_in))) InFlyghtDuration
    FROM Pass_in_trip pt
    JOIN Trip t ON t.trip_no = pt.trip_no
    GROUP BY ID_psg) q
JOIN Passenger p ON p.ID_psg = q.ID_psg
ORDER BY InFlyghtDuration DESC