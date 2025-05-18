1)Create a temporary table named MonthlySales to store the total quantity sold and total revenue for each product in the current month.
 
 
CREATE temporary TABLE MonthlySales (
    ProductName INT,
    TotalQuantity INT,
    TotalRevenue DECIMAL(18, 2)
);


INSERT INTO MonthlySales (ProductID, TotalQuantity, TotalRevenue)
SELECT 
    ProductID,
    SUM(Price ) AS Totalprice,
    SUM(price * UnitPrice) AS Totalprice
FROM SaleID 
WHERE 
    MONTH(SaleDate) = MONTH(CURDATE()) AND    
    YEAR(SaleDate) = YEAR(CURDATE())          
GROUP BY ProductID;

SELECT * FROM MonthlySales;

2)Create a view named vw_ProductSalesSummary that returns product info along with total sales quantity across all time.


CREATE VIEW vw_ProductSalesSummary AS
SELECT 
    p.ProductID,
    p.ProductName,
    p.Category,
    SUM(s.price) AS Totalprice
FROM Products p
JOIN SaleID  s ON p.ProductID = s.ProductID
GROUP BY p.ProductID, p.ProductName, p.Category;


3)Create a function named fn_GetTotalRevenueForProduct(@ProductID INT)
Return: total revenue for the given product ID

create function fn_GetTotalRevenueForProduct (@ProductID int)
RETURNS int
AS
BEGIN
   return @TotalRevenue = SUM(Quantity * UnitPrice)
end 
    
  select dbo.fn_GetTotalRevenueForProduct



4 Create an function fn_GetSalesByCategory(@Category VARCHAR(50))

Return: ProductName, TotalQuantity, TotalRevenue for all products in that category.


  go
  CREATE FUNCTION fn_GetSalesByCategory (@Category VARCHAR(50))
RETURNS table
AS
RETURN
( SELECT 
        P.ProductName,
        SUM(p.price) AS TotalQuantity,
        SUM(p.price * p.price) AS TotalRevenue
    FROM 
        Products P
    INNER JOIN 
      Category ON P.ProductID = p.ProductID
    INNER JOIN 
       p.Category C ON P.CategoryID = p.CategoryID
	   WHERE 
        p.Category = @Category
    GROUP BY 
        P.ProductName
);

5)You have to create a function that get one argument as input from user and the function should return 'Yes' 
if the input number is a prime number and 'No' otherwise. You can start it like this:

go
Create function dbo.fn_IsPrime (@Number INT)
Returns
as
begin
return
    DECLARE @i INT = 2;
    IF @Number < 2
        RETURN 'No';
    WHILE @i * @i <= @Number
    BEGIN
        IF @Number % @i = 0
            RETURN 'No';
        SET @i = @i + 1;
    END
    RETURN 'Yes';
END


8) Write a SQL query to find the person who has the most friends.


;with F1 as (select count (*) as NumFriends from (
select requester_id from 
friendship 
union all 
select accepter_id from Friendship
) as A
group by A.requester_id),
F2 as (select * from F1
where NumFriends in (select
max(Numfriends) from F1))
select * from F2


9)9. Create a View for Customer Order Summary.


select * from Customers
select * from Orders 

go
CREATE VIEW vw_CustomerOrderSummary AS
SELECT 
    C.customer_id,
    C.Name,
    COUNT(DISTINCT O.order_id) AS TotalOrders,
    SUM(c.amount) AS TotalQuantity,
    SUM(amount * c.amount) AS TotalRevenue
FROM 
    Customers C
INNER JOIN 
    Orders O ON C.Customer_ID = O.Customer_ID
INNER JOIN 
 o.orders ON O.Order_ID = O.Order_ID
GROUP BY 
    C.Customer_ID, C.Name;

	
	
	
10) Write an SQL statement to fill in the missing gaps. You have to write only select statement, no need to modify the table.


go
select *from gaps 

select count(testcase) as case_lar
from gaps where count(testcase)
from Gaps
with cte_gaps as (
select count(rownumber),count(testcase from gaps 
where testcase is null and 
group by rownumber) 
 
