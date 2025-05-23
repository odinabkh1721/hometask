create database lesson_21
use  lesson_21

---task 1

	GO
WITH cte AS (
    SELECT SaleID,
	  SaleDate,
  ROW_NUMBER() OVER (ORDER BY SaleDate DESC) AS Rn
    FROM ProductSales)
SELECT * 
FROM cte
WHERE Rn = 1;


---task 2

GO
WITH CTE AS (
 SELECT
     SaleID,
	 SaleAmount,
    RANK()OVER(ORDER BY SaleAmount DESC) as rnk

 FROM ProductSales )

 select * 
 from CTE 
 where rnk = 1 


 ---task 3 

go 
	WITH CTE AS (
    SELECT 
        CustomerID,
        SaleID,
        SaleAmount,
        ROW_NUMBER() OVER (
            PARTITION BY CustomerID 
            ORDER BY SaleAmount DESC
        ) AS rn
    FROM ProductSales  
)
SELECT 
    CustomerID,
    SaleID,
    SaleAmount
FROM CTE
WHERE rn = 1;


---task 4

 go
 SELECT 
    SaleID,
    SaleDate,
    SaleAmount,
    LEAD(SaleAmount) OVER (ORDER BY SaleDate) AS NextSaleAmount
FROM ProductSales 


---task 5

SELECT 
    SaleID,
    SaleDate,
    SaleAmount,
    LAG(SaleAmount) OVER (ORDER BY SaleDate) AS PreviousSaleAmount
FROM 
 productSales 


 ---task 6 

 SELECT 
    saleid,
    saledate,
    saleamount,
    LAG(saleamount) OVER (ORDER BY saledate) AS previousSalesamount
FROM 
    ProductSales 
WHERE 
    salesamount > LAG(saleamount) OVER (ORDER BY saledate);



	---task 7

	WITH cte AS (
    SELECT 
        SaleID,
        ProductName,
        SaleAmount,
        LAG(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleID) AS PreviousSaleAmount
    FROM ProductSales
)
SELECT 
    SaleID,
    ProductName,
    SaleAmount,
    PreviousSaleAmount,
    SaleAmount - PreviousSaleAmount AS DifferenceFromPrevious
FROM cte;


---task 8 

SELECT 
    SaleID,
    ProductName,
    SaleAmount,
    LEAD(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleID) AS NextSaleAmount,
    CASE 
        WHEN SaleAmount = 0 THEN NULL
        ELSE ROUND(((LEAD(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleID) - SaleAmount) / SaleAmount) * 100, 2)
    END AS PercentageChangeToNext
FROM ProductSales;


----task 9 
select * from ProductSales 

SELECT 
    SaleID,
    ProductName,
    SaleAmount,
    LAG(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleID) AS PreviousSaleAmount,
    CASE 
        WHEN LAG(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleID) = 0 THEN NULL
        ELSE ROUND(SaleAmount / LAG(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleID), 2)
    END AS SaleAmountRatio
FROM ProductSales;



--- task 10

select * from ProductSales 

SELECT 
    SaleID,
    ProductName,
    SaleAmount,
    FIRST_VALUE(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleID) AS FirstSaleAmount,
    SaleAmount - FIRST_VALUE(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleID) AS DifferenceFromFirst
FROM ProductSales;


--- task 11

WITH SalesWithLag AS (
    SELECT 
        SaleID,
        ProductName,
        SaleAmount,
        LAG(SaleAmount) OVER (PARTITION BY ProductName ORDER BY SaleID) AS PreviousSaleAmount
    FROM ProductSales
),
Flagged AS (
    SELECT *,
           CASE 
               WHEN PreviousSaleAmount



	--- task 12

	SELECT 
    SaleID,
    ProductName,
    SaleAmount,
    SUM(SaleAmount) OVER (
        PARTITION BY ProductName 
        ORDER BY SaleID 
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS ClosingBalance
FROM ProductSales;


--- task 13
select * from ProductSales 


SELECT 
    SaleID,
    ProductName,
    SaleAmount,
    AVG(SaleAmount) OVER (
        PARTITION BY ProductName 
        ORDER BY SaleID 
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS MovingAverageLast3
FROM ProductSales;


---task 14

SELECT 
    SaleID,
    ProductName,
    SaleAmount,
    AVG(SaleAmount) OVER (PARTITION BY ProductName) AS AverageSaleAmount,
    SaleAmount - AVG(SaleAmount) OVER (PARTITION BY ProductName) AS DifferenceFromAverage
FROM ProductSales 


--- task 15

select * from Employees1 

WITH Salary AS (
    SELECT 
        EmployeeID,
        Name,
        Salary,
        RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
    FROM Employees1
),
DuplicateRanks AS (
    SELECT Salary
    FROM Salary
    GROUP BY Salary
    HAVING COUNT(*) > 1
)
SELECT r.*
FROM Salary r
JOIN DuplicateRanks d ON r.Salary = d.Salary
ORDER BY r.SalaryRank, r.Salary DESC;
