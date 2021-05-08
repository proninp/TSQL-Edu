WITH q AS (
SELECT s.ID_Psg, p.name, sq.trip_no, sq.place
FROM (
SELECT ID_Psg
FROM Pass_in_trip
GROUP BY ID_psg
HAVING COUNT(trip_no) = COUNT(DISTINCT place)) s
JOIN Pass_in_trip sq ON sq.ID_psg = s.ID_psg
JOIN Passenger p ON p.ID_psg = s.ID_psg
)
SELECT name, SUM(diff) time_in_trip
FROM (
SELECT
t.trip_no,
q.name,
CASE 
WHEN ((DATEPART(hh, time_out) > DATEPART(hh, time_in)) OR ((DATEPART(hh, time_out) = DATEPART(hh, time_in))
AND (DATEPART(minute, time_out) > DATEPART(minute, time_in)))) THEN
(SELECT 24*60 + (DATEDIFF(minute, time_out, time_in)))
ELSE
(SELECT DATEDIFF(minute, time_out, time_in))
END diff
FROM Trip t
JOIN q ON q.trip_no = t.trip_no) qs
GROUP BY name
ORDER BY time_in_trip

/* Option 2 */

SELECT p.Name,
       [Flyght Duration]
FROM (
    SELECT pt.ID_psg,
		 SUM(IIF(DATEDIFF(mi,time_out,time_in) > 0,DATEDIFF(mi,time_out,time_in),24*60+DATEDIFF(mi,time_out,time_in))) [Flyght Duration]
    FROM Trip t
    JOIN Pass_in_trip pt ON pt.trip_no = t.trip_no
    WHERE pt.ID_psg IN (
	   SELECT ID_psg
	   FROM Pass_in_trip pit
	   GROUP BY ID_psg
	   HAVING COUNT(DISTINCT place) = COUNT(trip_no))
    GROUP BY pt.ID_psg) q
JOIN Passenger p ON p.ID_psg = q.ID_psg