1Return: OrderID, CustomerName, OrderDate
Task: Show all orders placed after 2022 along with the names of the customers who placed them.
Tables Used: Orders, Customers

SELECT 
    o.OrderID,
    c.CustomerID ,
    o.OrderDate
FROM 
    Orders o
JOIN 
    Customers c ON o.CustomerID = c.CustomerID
WHERE 
    o.OrderDate > '2022-12-31' 



2)Return: EmployeeName, DepartmentName
Task: Display the names of employees who work in either the Sales or Marketing department.
Tables Used: Employees, Departments



SELECT 
    e.EmployeeID,
    d.DepartmentName
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName IN ('Sales', 'Marketing');




3)Return: DepartmentName, MaxSalary
Task: Show the highest salary for each department.
Tables Used: Departments, Employees


  SELECT 
    d.Departmentname,
    MAX(e.salary) AS highest_salary
FROM 
    employees e
JOIN 
    departments d ON e.DepartmentID = d.DepartmentID
GROUP BY 
    e.name;


	4)Return: CustomerName, OrderID, OrderDate
Task: List all customers from the USA who placed orders in the year 2023.
Tables Used: Customers, Orders


select 
  c.CustomerID ,
  o.orderID,
  c.country 
from Customers c
join 
 orders o on c.CustomerID  = o.CustomerID  
 where
  c.country = 'USA'
  AND YEAR(o.OrderDate) = 2023


  5)Return: CustomerName, TotalOrders
Task: Show how many orders each customer has placed.
Tables Used: Orders , Customers



SELECT
 c.CustomerID ,
  COUNT(o.OrderID) AS TotalOrders
FROM
  Customers c
JOIN
  Orders o ON c.CustomerID = o.CustomerID
GROUP BY
  c.FirstName




  6)Return: ProductName, SupplierName
Task: Display the names of products that are supplied by either Gadget Supplies or Clothing Mart.
Tables Used: Products, Suppliers


SELECT 
    p.ProductName,
    s.SupplierName
FROM 
    Products p
JOIN 
    Suppliers s ON p.SupplierID = s.SupplierID
WHERE 
    s.SupplierName IN ('Gadget Supplies', 'Clothing Mart');


	8)Return: CustomerName, OrderTotal
Task: Show the customers who have placed an order where the total amount is greater than 500.
Tables Used: Orders, Customers

select * from customers
select * from orders 



SELECT 
    c.FirstName,
    o.TotalAmount
FROM 
    Customers c
JOIN 
    Orders o ON c.CustomerID = o.CustomerID
WHERE 
    o.TotalAmount > 500;


	9)Return: ProductName, SaleDate, SaleAmount
Task: List product sales where the sale was made in 2022 or the sale amount exceeded 400.
Tables Used: Products, Sales




select * from sales 
select * from products 

SELECT 
    p.ProductName,
    s.SaleDate,
    s.SaleAmount
FROM 
    Sales s
JOIN 
    Products p ON s.ProductID = p.ProductID
WHERE 
    YEAR(s.SaleDate) = 2022
    OR s.SaleAmount > 400;

	10)Return: ProductName, TotalSalesAmount
Task: Display each product along with the total amount it has been sold for.
Tables Used: Sales, Products


SELECT 
    p.ProductName,
    SUM(s.SaleAmount) AS TotalSalesAmount
FROM 
    Products p
JOIN 
    Sales s ON p.ProductID = s.ProductID
GROUP BY 
    p.ProductName;

	11)Return: EmployeeName, DepartmentName, Salary
Task: Show the employees who work in the HR department and earn a salary greater than 60000.
Tables Used: Employees, Departments


select 
  e.EmployeeName 
  d.DepartmentName
  e.Salary
  FROM Employees e
  JOIN 
  departments d ON e.DepartmentID = d.DepartmentID
WHERE 
    d.DepartmentName = 'HR'
	  AND e.Salary > 60000;


12)Return: ProductName, SaleDate, StockQuantity
Task: List the products that were sold in 2023 and had more than 100 units in stock at the time.
Tables Used: Products, Sales


SELECT 
    p.ProductName,
    s.SaleDate,
    p.StockQuantity
FROM 
    Sales s
JOIN 
    Products p ON s.ProductID = p.ProductID
WHERE 
    YEAR(s.SaleDate) = 2023
    AND s.StockQuantity > 100;
 

 13)Return: EmployeeName, DepartmentName, HireDate
Task: Show employees who either work in the Sales department or were hired after 2020.
Tables Used: Employees, Departments

select * from Employees 
select * from Departments 


SELECT 
    e.EmployeeID,
    d.DepartmentName,
    e.HireDate
FROM 
    Employees e
JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID
WHERE 
    d.DepartmentName = 'Sales'
    OR e.HireDate > '2020-01-01';


