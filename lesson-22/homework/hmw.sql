---task 1

  go
  select 
    sale_id,
    customer_name,
    SUM(total_amount) over(order by order_date) as runningtotal 
    from sales_data


--- task 2 
	
    SELECT
  product_category,
  COUNT(sale_id) AS order_count
FROM
  sales_data
GROUP BY
  product_category
ORDER BY
  order_count DESC;


  ---task 3 

  Find the Maximum Total Amount per Product Category

  select
  product_category,
  MAX(total_amount) as total_amount
  FROM 
   sales_data 
   Group by 
   product_category 
   

   --- task 4

  Find the Minimum Price of Products per Product Category


   select
  product_category,
  MIN(total_amount) as total_amount
  FROM 
   sales_data 
   Group by 
   product_category



   ---task 5

  SELECT
    order_date,
    sale_id,
    ROUND(AVG_3_DAY, 2) AS moving_avg_3_day
FROM (
    SELECT
        order_date,
        sale_id,
        (LAG(total_amount) OVER (ORDER BY order_date) +
         sale_id +
         LEAD(total_amount) OVER (ORDER BY order_date)) / 3.0 AS AVG_3_DAY
    FROM sales_data
) AS sub
WHERE AVG_3_DAY IS NOT NULL
ORDER BY order_date;




---- task 6

Find the Total Sales per Region

go
select
 region,
SUM(total_amount) as total_amount
from Sales_data 
group by region 
ORDER BY total_amount DESC


--- task 7

select * from sales_data 

go
with cte as (
select sale_id,
customer_name,
 total_amount,
 Rank() over(order by total_amount) as rnk
 from sales_data)

 select * from cte
 where rnk = 1



 --- task 8

 select * from sales_data 

 go
 SELECT
    Customer_id,
    order_Date,
    total_amount,
    total_Amount 
  -LAG(total_Amount) OVER (
        PARTITION BY Customer_ID ORDER BY Sales_Data
    ) AS SaleDifference
FROM Sales_data;



--- task 9

select * from sales_data 


with cte as(
    SELECT 
        Product_Name,
        product_Category,
        unit_Price,
        ROW_NUMBER() OVER (PARTITION BY product_Category ORDER BY unit_Price DESC) AS rn
    FROM Products)
	select * from cte 
WHERE rn <= 3;


--- task 10 

go
SELECT 
    Region,
    Order_Date,
    total_amount,
    SUM(total_amount) OVER (
        PARTITION BY Region
        ORDER BY Order_Date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS CumulativeSales
FROM sales_data 



--- task 11

SELECT 
    product_category
    Order_Date,
   total_amount,
    SUM(total_amount) OVER (
        PARTITION BY product_Category
        ORDER BY Order_Date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS CumulativeRevenue
FROM Sales_data 


--- task 15

SELECT 
    Customer_ID
FROM 
    Sales_data 
GROUP BY 
    Customer_ID
HAVING 
    COUNT(DISTINCT Product_Category) > 1;


--- task 16

SELECT 
    Customer_ID,
    Region,
    SUM(total_Amount) AS TotalSpending
FROM 
   sales_data 
JOIN 
    Sales s ON Customer_ID = Customer_ID
GROUP BY 
    c.Customer_ID, c.Region
HAVING 
    SUM(s.total_Amount) > (
        SELECT AVG(region_spending)
        FROM (
            SELECT 
                Region,
                SUM(s2.total_sAmount) AS region_spending
            FROM 
                Customers c2
            JOIN 
                Sales s2 ON c2.Customer_ID = s2.Customer_ID
            GROUP BY 
                c2.Customer_ID, c2.Region
        ) AS regional_totals
        WHERE regional_totals.Region = c.Region
    );


	--- task 17 

	SELECT 
    Customer_ID,
    Region,
    SUM(Total_Amount) AS TotalSpending,
    RANK() OVER (
        PARTITION BY Region
        ORDER BY SUM(Total_Amount) DESC
    ) AS SpendingRank
FROM sales_data 
GROUP BY 
    Customer_ID, Region;



	--- task 18 

	SELECT 
    Customer_ID,
    Order_Date,
    Total_Amount,
    SUM(Total_Amount) OVER (
        PARTITION BY Customer_ID
        ORDER BY Order_Date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS Cumulative_Sales
FROM 
    Sales_data 



	--- task 19 
	

	WITH MonthlySales AS (
    SELECT 
        DATE_TRUNC('month', Order_Date) AS Month,
        SUM(Total_Amount) AS MonthlySales
    FROM 
        Sales
    GROUP BY 
        DATE_TRUNC('month', Order_Date)
)

SELECT 
    Month,
    MonthlySales,
    LAG(MonthlySales) OVER (ORDER BY Month) AS PreviousMonthSales,
    ROUND(
        (MonthlySales - LAG(MonthlySales) OVER (ORDER BY Month)) 
        / NULLIF(LAG(MonthlySales) OVER (ORDER BY Month), 0) * 100, 2
    ) AS Growth_Rate_Percent
FROM 
    MonthlySales
ORDER BY 
    Month;


	--- task 23
 
WITH ranked_cte AS (
    SELECT *,
           DENSE_RANK() OVER (PARTITION BY id ORDER BY cost) AS rn
    FROM thesumpuzzle
),
cte_x AS (
    SELECT 
        id,
        SUM(cost) AS summed
    FROM thesumpuzzle
    GROUP BY id
)

SELECT 
    r.id,
    x.summed,
    SUM(r.quantity) AS total_quantity
FROM ranked_cte r
JOIN cte_x x ON r.id = x.id
WHERE r.rn = 1
GROUP BY r.id, x.summed
ORDER BY r.id;
