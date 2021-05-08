/*
* Among those who use the services of only one company,
* identify the names of different passengers who flew more often than others.
* Output: passenger name, number of flights, and company name.
*/

SELECT (SELECT name FROM Passenger WHERE ID_psg = q.id_psg) passanger,
       q.trip_Qty,
       (SELECT name FROM Company WHERE ID_comp = q.id_comp) company
FROM (
	SELECT TOP 1 WITH ties id_psg,
					COUNT(id_comp) trip_Qty
					, MIN(id_comp) id_comp
	FROM   trip t
	JOIN pass_in_trip pt ON t.trip_no = pt.trip_no
	GROUP  BY id_psg
	HAVING Count(DISTINCT id_comp) = 1
	ORDER  BY Count(id_comp) DESC) q