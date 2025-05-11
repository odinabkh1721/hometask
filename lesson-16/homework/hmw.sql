1) Create a numbers table using a recursive query from 1 to 1000.

 with cte As (
  SELECT 1 AS Num
  UNION ALL 
  SELECT Num + 1 FROM cte 
  WHERE  Num < 1000)
 SELECT * FROM cte 
 OPTION (MAXRECURSION 0 ) 



 2)Write a query to find the total sales per employee using a derived table.(Sales, Employees)

 e.EmployeeID,
    e.FirstName,
    e.LastName,
    s.TotalSalary 
FROM Employees e
JOIN (
    SELECT 
        EmployeeID,
        SUM(Amount) AS TotalSalary
    FROM Salary 
    GROUP BY EmployeeID
) s ON e.EmployeeID = s.EmployeeID;             



3)Create a CTE to find the average salary of employees.(Employees)

SELECT 1 AS Num
  UNION ALL
  SELECT AVG(salary) AS AvgSalary 
  FROM Employees 
   WHERE Salary > 77000.00)
   SELECT * FROM cte 


   4)Write a query using a derived table to find the highest sales for each product.(Sales, Products)


with cte as (
select id,1 as Pos ,
Substring(String,1,1) as Ch,  String
from Example
union all 
select id, pos+1,
Substring(String,pos+1,1),String
from cte
where Pos<len(String)
)


   5)Beginning at 1, write a statement to double the number for each record, the max value you get should be less than 1000000.


   WITH cte AS (
SELECT 1 AS Num 
UNION ALL
SELECT Num*2 FROM cte
WHERE Num  < 1000000)

SELECT * FROM cte option(maxrecursion 1000)


6)Use a CTE to get the names of employees who have made more than 5 sales.(Sales, Employees)


select * from Sales 


WITH SalesCount AS (
    SELECT 
        EmployeeID ,
        COUNT(*) AS total_sales
    FROM 
        Sales
    GROUP BY 
        EmployeeID 
)
SELECT 
    e.sales   
FROM 
    SalesCount sc
JOIN 
    Employees e ON sc.EmployeeID = e.employee_id
WHERE 
    sc.total_sales > 5;


	7)Write a query using a CTE to find all products with sales greater than $500.(Sales, Products)

select * from Products 

WITH cte AS (
    SELECT 
        ProductID,
        MIN(price) AS Minprice 
    FROM 
        Sales
    GROUP BY 
        productID
)
SELECT 
    p.ProductName,
    p.price 
FROM 
    Products  ps
JOIN 
    Products p ON ps.ProductID = p.ProductID
WHERE 
    p.price  > 500;


	Medium Tasks

	1)Write a query using a derived table to find the top 5 employees by the number of orders made.(Employees, Sales)

	select top 5 e.EmployeeID,e.FirstName,e.LastName,s.num_of_sales from Employees as e
join (select EmployeeID,count(salesid)as num_of_sales from sales group by Employeeid  ) as s
on s.EmployeeID=e.employeeID
order by s.num_of_sales


2)Write a query using a derived table to find the sales per product category.(Sales, Products)

select * from sales
select p.CategoryID,sum(s.nu_of_sales)as total_sales from Products as p
join 
(select ProductID,count(salesid)as nu_of_sales from sales  group by ProductID) as s
on s.ProductID=p.ProductID
group by p.CategoryID

3)Write a script to return the factorial of each value next to it.(Numbers1)

with numbers as (
select 1 as n,
 1 as f
union all
select n+1,(n+1)*f from numbers
where n+1<10 
)
select * from numbers
where n in (select number from Numbers1)


4)This script uses recursion to split a string into rows of substrings for each character in the string.(Example)


WITH RecursiveSplit AS (
    -- Anchor: start with first character of each string
    SELECT
        Id,
        1 AS Position,
        SUBSTRING(String, 1, 1) AS Character,
        String
    FROM Example
    WHERE LEN(String) > 0

    UNION ALL

    -- Recursive part: get next character
    SELECT
        Id,
        Position + 1,
        SUBSTRING(String, Position + 1, 1),
        String
    FROM RecursiveSplit
    WHERE Position + 1 <= LEN(String)
)

-- Final output: one character per row per string
SELECT
    Id,
    Position,
    Character
FROM RecursiveSplit
ORDER BY Id, Position;


5)Use a CTE to calculate the sales difference between the current month and the previous month.(Sales)


WITH MonthlySales AS (
    SELECT 
        FORMAT(SaleDate, 'yyyy-MM') AS SaleMonth,
        SUM(SalesAmount) AS TotalSales
    FROM Sales
    GROUP BY FORMAT(SaleDate, 'yyyy-MM')
),
SalesWithDifference AS (
    SELECT 
        SaleMonth,
        TotalSales,
        LAG(TotalSales) OVER (ORDER BY SaleMonth) AS PreviousMonthSales
    FROM MonthlySales
)
SELECT 
    SaleMonth,
    TotalSales,
    PreviousMonthSales,
    TotalSales - ISNULL(PreviousMonthSales, 0) AS SalesDifference
FROM SalesWithDifference
ORDER BY SaleMonth;


7)Create a derived table to find employees with sales over $45000 in each quarter.(Sales, Employees)

SELECT 
    e.EmployeeID,
    e.FirstName,
    e.LastName
FROM Employees e
JOIN (
    SELECT 
        EmployeeID,
        DATEPART(QUARTER, SaleDate) AS Quarter,
        DATEPART(YEAR, SaleDate) AS SaleYear,
        SUM(SalesAmount) AS QuarterlySales
    FROM Sales
    GROUP BY EmployeeID, DATEPART(YEAR, SaleDate), DATEPART(QUARTER, SaleDate)
    HAVING SUM(SalesAmount) > 45000
) AS QuarterlySales
ON e.EmployeeID = QuarterlySales.EmployeeID
GROUP BY 
    e.EmployeeID, e.FirstName, e.LastName
HAVING COUNT(DISTINCT QuarterlySales.Quarter) = 4;

SELECT * FROM SALES 
