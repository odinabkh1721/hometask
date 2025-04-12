

1-Write a query to select the top 5 employees from the Employees table.

SELECT *
FROM Employees
LIMIT 5;

2-Use SELECT DISTINCT to select unique ProductName values from the Products table

SELECT Distnict ProductName
from Product Table

3-Write a query that filters the Products table to show products with Price > 100.

SELECT * Products 
WHERE Price > 100;


4-Write a query to select all CustomerName values that start with 'A' using the LIKE operator


SELECT * CustomerName 
FROM Customers
WHERE CustomerName LIKE 'A%',

5-Order the results of a Products query by Price in ascending order.

SELECT * from Products
ORDER BY Price 


6-Write a query that uses the WHERE clause to filter for employees with Salary >= 60000 and Department = 'HR'.


SELECT * FROM Employees 
WHERE Salary >=60000 AND Department='HR';


7-Use ISNULL to replace NULL values in the Email column with the text "noemail@example.com".From Employees table


SELECT Name,ISNULL(Email, 'noemail@example.com') AS Email
FROM Employees ;


8-Write a query that shows all products with Price BETWEEN 50 AND 100.

SELECT * FROM Products 
WHERE Price BETWEEN 50 AND 100;


9-Use SELECT DISTINCT on two columns (Category and ProductName) in the Products table.

SELECT DISTNICT Category,ProductName
FROM Products;


10-After SELECT DISTINCT on two columns (Category and ProductName) Order the results by ProductName in descending order.

SELECT DISTINCT Category, ProductName
FROM Products
ORDER BY ProductName descending;


11-Write a query to select the top 10 products from the Products table, ordered by Price DESC.

SELECT* FROM Products
ORDER BY Price DESC
LIMIT 10;


12-Use COALESCE to return the first non-NULL value from FirstName or LastName in the Employees table.

SELECT COALESCE (FirstName,LastName) AS Name 
FROM Employees;

13-Write a query that selects distinct Category and Price from the Products table

SELECT DISTNICT Category,Price
FROM Products;

14-Write a query that filters the Employees table to show employees whose Age is either between 30 and 40 or Department = 'Marketing'.

SELECT * Employees 
WHERE Age netween 30 and 40 
FROM Marketing 

15-Use OFFSET-FETCH to select rows 11 to 20 from the Employees table, ordered by Salary DESC.

SELECT * FROM Employees 
ORDER BY Salary DESC 
OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY


16 Write a query to display all products with Price <= 1000 and Stock > 50, sorted by Stock in ascending order.

SELECT * Products
WHERE Price <=100,Stock > 50
ORDER BY Stock ASC 


17-Write a query that filters the Products table for ProductName values containing the letter 'e' using LIKE.

SELECT * FROM Products 
WHERE ProductName LIKE '%e%';


18-Use IN operator to filter for employees who work in either 'HR', 'IT', or 'Finance'.

SELECT * FROM Employees
WHERE Department IN 'HR', 'IT',' Finance'),


19-Use ORDER BY to display a list of customers ordered by City in ascending and PostalCode in descending order.Use customers table

SELECT * FROM Customers
ORDER BY CITY ASC  POSTALCODE DESC;

20-Write a query that selects the top 10 products with the highest sales, using TOP(10) and ordered by SalesAmount DESC

SELECT TOP 10 *
FROM Products
ORDER BY SalesAmount DESC;

21-Combine FirstName and LastName into one column named FullName in the Employees table. (only in select statement)


SELECT FIRSTName + ' ' + LastName AS FullName
FROM Employees;

22-Write a query to select the distinct Category, ProductName, and Price for products that are priced above $50, using DISTINCT on three columns.


SELECT DISTINICT Category,ProductNamw,Price
FROM Products
WHERE Price > 50;


23-Write a query that selects products whose Price is less than 10% of the average price in the Products table. (Do some research on how to find average price of all products)

SELECT * FROM  Products
WHERE Price < ( SELECT AVG (Price) * 0.1 FROM Products);


24-Use WHERE clause to filter for employees whose Age is less than 30 and who work in either the 'HR' or 'IT' department.


SELECTT * FROM Employees 
WHERE Age < 30
AND Departmentt in ('HR','IT');


25 - Use LIKE with wildcard to select all customers whose Email contains the domain '@gmail.com'.


SELECT *
FROM Customers
WHERE Email LIKE '%@gmail.com';


26-Write a query that uses the ALL operator to find employees whose salary is greater than all employees in the 'Sales' department



SELECT *
FROM Employees
WHERE Salary > ALL (SELECT Salary FROM Employees WHERE Department = 'Sales');



27-.Write a query that filters the Orders table for orders placed in the last 180 days using BETWEEN and CURRENT_DATE. (Search how to get the current date)


SELECT *
FROM Orders
WHERE OrderDate BETWEEN CURRENT_DATE - INTERVAL 180 DAY AND CURRENT_DATE;
