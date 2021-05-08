-- Finish the Transact-SQL query that retrieves all values for City and StateProvince, without duplicates, from the Address table.
-- select unique cities, and state province
SELECT DISTINCT City, StateProvince
FROM SalesLT.Address;

-- Finish the query to retrieve the names of the top ten percent of products by weight.
-- select the top 10 percent from the Name column
SELECT TOP 10 PERCENT Name
FROM SalesLT.Product
-- order by the weight in descending order
ORDER BY Weight DESC;

--Tweak the query to list the heaviest 100 products not including the ten most heavy ones.
SELECT Name
FROM SalesLT.Product
ORDER BY Weight DESC
-- offset 10 rows and get the next 100
OFFSET 10 ROWS FETCH NEXT 100 ROWS ONLY;

-- Write a query to find the names, colors, and sizes of the products with a product model ID of 1.
-- select the Name, Color, and Size columns
SELECT Name, Color, Size
FROM SalesLT.Product
-- check ProductModelID is 1
WHERE ProductModelID = 1;

-- Retrieve the product number and name of the products that have a Color of 'Black', 'Red', or 'White' and a Size of 'S' or 'M'.
-- select the ProductNumber and Name columns
SELECT ProductNumber, Name
FROM SalesLT.Product
-- check that Color is one of 'Black', 'Red' or 'White'
-- check that Size is one of 'S' or 'M'
WHERE Color IN ('Black', 'Red', 'White') AND Size IN ('S','M');

-- Retrieve the product number, name, and list price of products that have a product number beginning with 'BK-'.
-- select the ProductNumber, Name, and ListPrice columns
SELECT ProductNumber, Name, ListPrice
FROM SalesLT.Product
-- filter for product numbers beginning with BK- using LIKE
WHERE ProductNumber LIKE 'BK-%';

--Modify your previous query to retrieve the product number, name,
-- and list price of products with product number beginning with 'BK-'
-- followed by any character other than 'R', and ending with a '-' followed by any two numerals.
-- select the ProductNumber, Name, and ListPrice columns
SELECT ProductNumber, Name, ListPrice
FROM SalesLT.Product
-- filter for ProductNumbers
WHERE ProductNumber LIKE 'BK-[^R]%-[0-9][0-9]';