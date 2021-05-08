SELECT CAST(w.date AS DATETIME) [dt],
       COALESCE(q.trip_count, 0) trup_count
FROM
(
    SELECT '20030401' [date]
    UNION ALL
    SELECT '20030402'
    UNION ALL
    SELECT '20030403'
    UNION ALL
    SELECT '20030404'
    UNION ALL
    SELECT '20030405'
    UNION ALL
    SELECT '20030406'
    UNION ALL
    SELECT '20030407'
) w
LEFT JOIN
(
    SELECT pit.date,
           COUNT(DISTINCT pit.trip_no) trip_count
    FROM Pass_in_trip pit
         JOIN Trip t ON t.trip_no = pit.trip_no
    WHERE t.town_from = 'Rostov'
    GROUP BY pit.date
) q ON q.date = w.date;