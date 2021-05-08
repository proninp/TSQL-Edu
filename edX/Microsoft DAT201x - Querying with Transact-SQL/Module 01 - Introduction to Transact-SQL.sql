-- select all columns
-- from the SalesLT.Customer table
SELECT *
FROM [SalesLT].[Customer]

-- select the Title, FirstName, MiddleName, LastName and Suffix columns
-- from the Customer table
SELECT [Title], FirstName, MiddleName, LastName, Suffix
FROM SalesLT.Customer;

-- finish the query
SELECT [SalesPerson], Title + ' ' + LastName AS CustomerName, Phone
FROM SalesLT.Customer;

--Provide a list of all customer companies in the format <Customer ID>: <Company Name> (e.g. 78: Preferred Bikes).
--You'll need to use both CAST() and VARCHAR in your solution. Don't forget to use the alias provided.
-- cast the CustomerID column to a VARCHAR and concatenate with the CompanyName column
SELECT CAST([CustomerID] AS VARCHAR(5)) + ': ' + [CompanyName] AS CustomerCompany
FROM SalesLT.Customer;

-- Complete the query on the right to create the 2-column table that's specified above.
-- finish the query
SELECT [SalesOrderNumber] + ' (' + STR([RevisionNumber], 1) + ')' AS OrderRevision,
	   CONVERT(NVARCHAR(30), [OrderDate], 102) AS OrderDate
FROM SalesLT.SalesOrderHeader;

-- Retrieve customer contact names including middle names when they're known.
-- use ISNULL to check for middle names and concatenate with FirstName and LastName
SELECT [FirstName] + ' ' + ISNULL([MiddleName] + ' ', '') + [LastName]
AS CustomerName
FROM SalesLT.Customer;

-- Write a query that returns a list of customer IDs in one column, 
--and a second column called PrimaryContact that contains the email address if known, and otherwise the phone number.
-- select the CustomerID, and use COALESCE with EmailAddress and Phone columns
SELECT [CustomerID], COALESCE([EmailAddress], [Phone]) AS PrimaryContact
FROM SalesLT.Customer;

--Write a query to list sales order IDs and order dates with a column named ShippingStatus that contains the text 'Shipped'
--for orders with a known ship date, and 'Awaiting Shipment' for orders with no ship date.
SELECT SalesOrderID, OrderDate,
  CASE
    WHEN [ShipDate] IS NULL THEN 'Awaiting Shipment'
    ELSE 'Shipped'
  END AS ShippingStatus
FROM SalesLT.SalesOrderHeader;