---task 1


select * from #RegionSales;

select distinct T2.Distributor,T1.region,isnull(A.Sales,0) as Sales from #RegionSales as T1
cross join  (select distinct Distributor from #RegionSales) as T2
left join #RegionSales as A on A.Region = T1.Region and A.Distributor = T2.Distributor


--- task 2

drop table Employee

CREATE TABLE Employee (id INT, name VARCHAR(255), department VARCHAR(255), managerId INT);
TRUNCATE TABLE Employee;
INSERT INTO Employee VALUES
(101, 'John', 'A', NULL), (102, 'Dan', 'A', 101), (103, 'James', 'A', 101),
(104, 'Amy', 'A', 101), (105, 'Anne', 'A', 101), (106, 'Ron', 'B', 101);

select man_name from (
select Employee.name as emp_name ,Manager.name as man_name
from Employee as Manager 
right join Employee as Employee on Employee.ManagerId = Manager.Id ) as A
group by man_name
having count(emp_name) = 5


---task 3


with cte as (
select product_name,unit from products as p
Join orders as o on p.product_id = o.product_id 
where year(o.order_date) = 2020 and month(order_date)=2)
select product_name, SUM(unit) as unit from cte
Group by product_name
Having SUM(unit) >=100


---task 4

select Vendor from orders o1
where o1.Count = (select MAX(Count) as OrderCount from orders as o2 where o1.customerID =o2.customerID )


---task 5

DECLARE @Check_Prime INT = 91;
SET @Check_Prime = 91  
DECLARE @i INT = 2
DECLARE @IsPrime BIT = 1
WHILE @i <= SQRT(@Check_Prime)
BEGIN
    IF @Check_Prime % @i = 0
    BEGIN
        SET @IsPrime = 0
        BREAK
    END
    SET @i = @i + 1
END
IF @Check_Prime <= 1
    PRINT 'This number is not prime'
ELSE IF @IsPrime = 1
    PRINT 'This number is prime'
ELSE
    PRINT 'This number is not prime'


--task 6
go
SELECT DISTINCT(Locations) AS Total_Locations
FROM device
SELECT TOP 1 no_of_location ,MAX(signal_location) AS Total_Signals
FROM Signals
GROUP BY Locations
ORDER BY Total_Signals DESC;
SELECT Device_ID, SUM(Signal_location) AS Total_Signals
FROM Signals
GROUP BY Device_ID;

--task 7 
GO
SELECT EmpID, EmpName, Salary
FROM Employee E
WHERE Salary > (
    SELECT AVG(Salary) as AvgSalary
    FROM Employee
    WHERE DeptID = E.DeptID
);

---8task

You are part of an office lottery pool where you keep a table of the winning lottery numbers along with a table of each ticket’s chosen numbers.
If a ticket has some but not all the winning numbers, you win $10. 
If a ticket has all the winning numbers, you win $100. Calculate the total winnings for today’s drawing.

go
WITH WinningCount AS (
    SELECT COUNT(*) AS TotalWinningNumbers
    FROM Numbers 
),
MatchedNumbers AS (
    SELECT T.TicketID, COUNT(*) AS MatchCount
    FROM Tickets T
    JOIN WinningNumbers W ON T.Number = W.Number
    GROUP BY T.TicketID
),
TicketWinnings AS (
    SELECT 
        M.TicketID,
        CASE 
            WHEN M.MatchCount = W.TotalWinningNumbers THEN 100
            ELSE 10
        END AS Prize
    FROM MatchedNumbers M, WinningCount W
)
SELEC SUM(Prize) AS TotalWinnings
FROM TicketWinnings;


--task 9

WITH device_usage AS (
    SELECT
        user_id,
        DATE(spend_date) AS purchase_date,
        COUNT(DISTINCT CASE WHEN Platform  = 'mobile' THEN 'mobile' END) AS used_mobile,
        COUNT(DISTINCT CASE WHEN Platform = 'desktop' THEN 'desktop' END) AS used_desktop,
        SUM(amount) AS total_spent
    FROM Spending
    GROUP BY user_id, DATE(purchase_date)
),
labeled_usage AS (
    SELECT
        purchase_date,
        user_id,
        total_spent,
        CASE 
            WHEN used_mobile = 1 AND used_desktop = 0 THEN 'Mobile Only'
            WHEN used_mobile = 0 AND used_desktop = 1 THEN 'Desktop Only'
            WHEN used_mobile = 1 AND used_desktop = 1 THEN 'Both'
            ELSE 'Unknown'
        END AS usage_type
    FROM device_usage
)
SELECT
    purchase_date,
    usage_type,
    COUNT(DISTINCT user_id) AS total_users,
    SUM(total_spent) AS total_amount_spent
FROM labeled_usage
WHERE usage_type IN ('Mobile Only', 'Desktop Only', 'Both')
GROUP BY purchase_date, usage_type
ORDER BY purchase_date, usage_type;
``

---task 10 

DROP TABLE IF EXISTS Grouped;
CREATE TABLE Grouped
(
  Product  VARCHAR(100) PRIMARY KEY,
  Quantity INTEGER NOT NULL
);
INSERT INTO Grouped (Product, Quantity) VALUES
('Pencil', 3), ('Eraser', 4), ('Notebook', 2);

select * from Grouped 

go
WITH de_Grouped AS (
  SELECT Product, Quantity, 1 AS n
  FROM Grouped
  WHERE Quantity > 0
  UNION ALL
  SELECT Product, Quantity, n + 1
  FROM De_Grouped
  WHERE n + 1 <= Quantity
)
SELECT Product
FROM De_Grouped
ORDER BY Product;
