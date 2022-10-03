/*
 * For each company that transported passengers,
 * calculate the time that planes with passengers spent in flight.
 * Conclusion: company name, time in minutes.
*/

SELECT c.[name]
      , [TotalTime]
FROM (
	SELECT [ID_comp]       
		   , SUM([TimeInFlight]) [TotalTime]
	FROM (
		SELECT [ID_comp]
			  , CASE
				WHEN [time_out] < [time_in] THEN
					DATEDIFF(mi, time_out, time_in)
				ELSE
					DATEDIFF(mi, time_out, '1900-01-02 00:00:00') + DATEDIFF(mi, '1900-01-01 00:00:00', time_in)
				END [TimeInFlight]
		  FROM [Trip] t
		  JOIN (SELECT DISTINCT [trip_no]
		                         ,[date]
				 FROM [Pass_in_trip]) p ON p.trip_no = t.trip_no
		  ) q
	GROUP BY [ID_comp]) t
JOIN [Company] c ON c.[ID_comp] = t.[ID_comp]
