SELECT name,
       DATEFROMPARTS(DATEPART(yyyy,date),DATEPART(mm,date),1) FirstDate,
       DATEADD(dd,-1,DATEFROMPARTS(DATEPART(yyyy,date)+IIF(DATEPART(mm,date)<12,0,1),IIF(DATEPART(mm,date)<12,DATEPART(mm,date)+1,1),1)) LastDate
FROM Battles