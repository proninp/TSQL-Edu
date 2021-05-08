/*
* Select all the white squares that were painted only from the cans that were
* empty by now. Print the name of the square.
*/
SELECT Q_NAME
FROM utQ
WHERE Q_ID IN (
	SELECT B_Q_ID
	FROM utB
	WHERE B_V_ID IN (SELECT B_V_ID
					 FROM utB b
					 GROUP BY B_V_ID
					 HAVING SUM(B_VOL) = 255)
	GROUP BY B_Q_ID
	HAVING SUM(B_VOL) = 765)