WITH q
     AS (SELECT DISTINCT
                town_from,
                town_to,
(
    SELECT COUNT(trip_no) qty
    FROM Trip tr
    WHERE(t.town_from = tr.town_from
          AND t.town_to = tr.town_to)
         OR (t.town_from = tr.town_to
             AND t.town_to = tr.town_from)
) trip_count
         FROM Trip t)
     SELECT CAST(SUM(trip_count) AS NUMERIC(2, 0)) trip_count
     FROM
(
    SELECT CASE
               WHEN EXISTS
(
    SELECT 1
    FROM q
    WHERE q.town_from = w.town_to
          AND q.town_to = w.town_from
)
               THEN 0.5
               ELSE 1
           END trip_count
    FROM
(
    SELECT town_from,
           town_to,
           trip_count
    FROM q
    WHERE trip_count =
(
    SELECT MAX(trip_count)
    FROM q
)
) w
) e;
-- var 2
WITH ordered_towns
     AS (SELECT CASE
                    WHEN(town_from < town_to)
                    THEN town_to
                    ELSE town_from
                END town1,
                CASE
                    WHEN town_from < town_to
                    THEN town_from
                    ELSE town_to
                END town2
         FROM Trip),
     trip_counts
     AS (SELECT town1,
                town2,
                COUNT(*) cnt
         FROM ordered_towns
         GROUP BY town1,
                  town2)
     SELECT COUNT(*) cnt
     FROM trip_counts
     WHERE cnt =
(
    SELECT MAX(cnt)
    FROM trip_counts
);