1-Write a query to find the minimum (MIN) price of a product in the Products table.

SELECT min(price) PRODUCT
FROM Products_table


2-Write a query to find the maximum (MAX) Salary from the Employees table.

SELECT max(salary) 
FROM Employees

3-Write a query to count the number of rows in the Customers table using COUNT(*).

SELECT  COUNT * AS RowCount
FROM Customers

4-Write a query to count the number of unique product categories (COUNT(DISTINCT Category)) from the Products table.

SELECT COUNT(DISTINCT CATEGORY) AS UniqueCategory
FROM Products 

6-Write a query to find the total (SUM) sales amount for the product with id 7 in the Sales table.

SELELCT SUM(SalesAmount) AS SalesAmount
FROM Sales
WHERE Product_id=7;

7Write a query that uses GROUP BY to count the number of employees in each department.

SELECT Deparment,COUNT(EmployeeID) AS EmployeeCount
FROM Employees
GROUP BY Department 


8Write a query to show the minimum and maximum Price of products grouped by Category. Use products table.

SELECT Category 
    MIN( price) AS MinPrice
      MAX (price) AS MaxPrice
	  FROM Products
GROUP BY Category ;


9-Write a query to calculate the total (SUM) sales per Customer in the Sales table.

SELECT Sales
    SUM(Sales per) AS SalesPer
FROM Sales table

10-Write a query to use HAVING to filter departments having more than 5 employees from the Employees table.(DeptID is enough, if you don't have DeptName).

 SELECT DeptID, COUNT(EmployeeID) AS EmployeeCount 
 FROM Employees
 GROUP BY DeptID
 HAVING COUNT (EmpployeeID) > 5



 11-Write a query to calculate the total sales and average sales for each product category from the Sales table.

 SELECT ProductCategory
      SUM(SalesAmount) AS TotalSales
      AVG(SalesAmount) AS  AvgSales
	  FROM Sales 
GROUP BY ProductCategory

12- Write a query that uses COUNT(columnname) to count the number of employees from the Department HR.

SELECT COUNT (EmployeeID) AS EmployeeCount
FROM Employees
WHERE Department = 'HR';



13-Write a query that finds the highest (MAX) and lowest (MIN) Salary by department in the Employees table.(DeptID is enough, if you don't have DeptName)

SELECT DeptID,
   MAX(Salary) AS HighSalary,
   MIN( Salary) AS LowestSalary
FROM Employees
GROUP BY DeptID


14-Write a query that uses GROUP BY to calculate the average salary per Department.(DeptID is enough, if you don't have DeptName).

SELECT DeptID
  AVG(Salary) AS AvgSalary
  FROM Department
  GROUP BY DeptID 


 15-Write a query to show the AVG salary and COUNT(*) of employees working in each department.(DeptID is enough, if you don't have DeptName).

 SELECT  DeptID
   AVG (Salary) AS AvgSalary,
   COUNT ( * ) AS EmployeeCount
   FROM Employees
   GROUP BY DeptID

   16-Write a query that uses HAVING to filter product categories with an average price greater than 400.

   SELECT Category
     Avg(price) AS AvgPrice
   FROM Product
   GROUP BY Category
   HAVING AVG (Price) > 400;

   17-Write a query that calculates the total sales for each year in the Sales table, and use GROUP BY to group them.


  SELECT YEAR (SaleDATE) AS SaleYear,
     SUM(SalesAmount) AS TotalSales
FROM Sales
GROUP BY YEAR (SaleDate)


18-Write a query that uses COUNT to show the number of customers who placed at least 3 orders

SELECT COUNT ( * ) AS CustomersWithAtLeast3Orders
FROM (
    SELECT CustomerID
    FROM Orders
    GROUP BY CustomerID
    HAVING COUNT(*) >= 3
) AS Subquery;


19- Write a query that applies the HAVING clause to filter out Departments with total salary expenses greater than 500,000.(DeptID is enough, if you don't have DeptName).


SELECT DeptID 
   SUM (Salary) AS TotalSalary
   FROM Employees
   GROUP BY DeptID
   HAVING SUM (Salary) > 500000;


 20 - Write a query that shows the average (AVG) sales for each product category, and then uses HAVING to filter categories with an average sales amount greater than 200.

 SELECT ProductCategory
    AVG(SalesAmount) AS SalesAmount
	FROM Sales 
	GROUP BY ProductCategory
	HAVING AVG(SalesAmount)>  200;



21-Write a query to calculate the total (SUM) sales for each Customer, then filter the results using HAVING to include only Customers with total sales over 1500

SELECT CustomerID
  SUM(SalesAmount) AS TotalSales
  FROMWrite a query to find the total (SUM) and average (AVG) salary of employees grouped by department, and use HAVING to include only departments with an average salary greater than 65000.
Sales
  GROUP BY CustomerID
  HAVING SUM (SalesAmount) >  1500;

  22-Write a query to find the total (SUM) and average (AVG) salary of employees grouped by department, and use HAVING to include only departments with an average salary greater than 65000.

  SELECT EmployeeID
  SUM(Salary) AS TotalSalary
  AVG (Salary) AS TotalSalary
  FROM Employees
  GROUP BY DeptID
  HAVING AVG(Salary) > 65000;


23-Write a query that finds the maximum (MAX) and minimum (MIN) order value for each customer, and then applies HAVING to exclude customers with an order value less than 50.

SELECT CustomerID
   MAX(OrderValue) AS  MaxOrderValue, 
   MIN(OrderValue) AS  MinOrderValue
   FROM Orders
   GROUP BY CustomerID
  HAVING  MIN(OrderValue) >= 50;


  24-WRITEQry that calculates the total sales (SUM) and counts distinct products sold in each month, and then applies HAVING to filter the months with more than 8 products sold.

  SELECT MONTH(SaleDate) AS SaleMonth,
       SUM(SalesAmount) AS TotalSales,
       COUNT(DISTINCT ProductID) AS ProductsSold
FROM Sales
GROUP BY MONTH(SaleDate)
HAVING COUNT(DISTINCT ProductID) > 8;



25-SELECT EXTRACT(YEAR FROM OrderDate) AS OrderYear,
       MIN(Quantity) AS MinOrderQuantity,
       MAX(Quantity) AS MaxOrderQuantity
FROM Orders
GROUP BY EXTRACT(YEAR FROM OrderDate)
ORDER BY OrderYear;
