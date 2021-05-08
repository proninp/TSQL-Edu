WITH q
     AS (
     SELECT town_from,
            town_to,
            COUNT(trip_no) tr
     FROM Trip
     GROUP BY town_from,
              town_to)
     SELECT COUNT(*) cnt
     FROM q
     WHERE tr =
(
    SELECT MAX(tr)
    FROM q
);