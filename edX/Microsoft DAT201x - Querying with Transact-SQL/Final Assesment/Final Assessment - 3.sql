/*Use a subquery to get the product name and unit price of products from the Products table
which have a unit price greater than the average unit price from the Order Details table.
Note that you need to use [Order Details] since the table name contains whitespace.*/
SELECT ProductName,
       UnitPrice
FROM dbo.Products p
WHERE UnitPrice > (SELECT AVG(UnitPrice)
                   FROM dbo.[Order Details])


/*Select from the Employees and Orders tables. Use a subquery to get the first name and employee ID
for employees who were associated with orders which shipped from the USA.*/
SELECT FirstName
       ,EmployeeID
FROM dbo.Employees e
WHERE EmployeeID IN (SELECT EmployeeID
                     FROM dbo.Orders
                     WHERE ShipCountry = 'USA')


/*Use the # to create a new temporary table called ProductNames which has one field called ProductName (a VARCHAR of max length 40).
Insert into this table the names of every product from the Products table.
Note that there are two syntaxes for the INSERT INTO statement.
Use the syntax that does not specify the column names since the table only has one field.
Select all columns from the ProductNames table you created.
Note: you need to specify the Products table as Products, not dbo.Products.*/
CREATE TABLE #ProductNames
(ProductName VARCHAR(40));

INSERT INTO #ProductNames
SELECT ProductName
FROM Products;

SELECT *
FROM #ProductNames;