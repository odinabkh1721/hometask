CREATE DATABASE Products

CREATE TABLE Products ( ProductID INT PRIMARY KEY, ProductName VARCHAR(100), Price DECIMAL(10, 2), Category VARCHAR(50), StockQuantity INT )




INSERT INTO Products VALUES (1, 'Laptop', 1200.00, 'Electronics', 30), (2, 'Smartphone', 800.00, 'Electronics', 50), (3, 'Tablet', 400.00, 'Electronics', 40), (4, 'Monitor', 250.00, 'Electronics', 60), (5, 'Keyboard', 50.00, 'Accessories', 100), (6, 'Mouse', 30.00, 'Accessories', 120), (7, 'Chair', 150.00, 'Furniture', 80), (8, 'Desk', 200.00, 'Furniture', 75), (9, 'Pen', 5.00, 'Stationery', 300), (10, 'Notebook', 10.00, 'Stationery', 500), (11, 'Printer', 180.00, 'Electronics', 25), (12, 'Camera', 500.00, 'Electronics', 40), (13, 'Flashlight', 25.00, 'Tools', 200), (14, 'Shirt', 30.00, 'Clothing', 150), (15, 'Jeans', 45.00, 'Clothing', 120), (16, 'Jacket', 80.00, 'Clothing', 70), (17, 'Shoes', 60.00, 'Clothing', 100), (18, 'Hat', 20.00, 'Accessories', 50), (19, 'Socks', 10.00, 'Clothing', 200), (20, 'T-Shirt', 25.00, 'Clothing', 150), (21, 'Lamp', 60.00, 'Furniture', 40), (22, 'Coffee Table', 100.00, 'Furniture', 35), (23, 'Book', 15.00, 'Stationery', 250), (24, 'Rug', 90.00, 'Furniture', 60), (25, 'Cup', 5.00, 'Accessories', 500), (26, 'Bag', 25.00, 'Accessories', 300), (27, 'Couch', 450.00, 'Furniture', 15), (28, 'Fridge', 600.00, 'Electronics', 20), (29, 'Stove', 500.00, 'Electronics', 15), (30, 'Microwave', 120.00, 'Electronics', 25), (31, 'Air Conditioner', 350.00, 'Electronics', 10), (32, 'Washing Machine', 450.00, 'Electronics', 15), (33, 'Dryer', 400.00, 'Electronics', 10), (34, 'Hair Dryer', 30.00, 'Accessories', 100), (35, 'Iron', 40.00, 'Electronics', 50), (36, 'Coffee Maker', 50.00, 'Electronics', 60), (37, 'Blender', 35.00, 'Electronics', 40), (38, 'Juicer', 55.00, 'Electronics', 30), (39, 'Toaster', 40.00, 'Electronics', 70), (40, 'Dishwasher', 500.00, 'Electronics', 20);


1- Using Products table, find the total number of products available in each category.

SELECT Category, COUNT(*) AS ProductName
FROM Products
GROUP BY Category 


2-Using Products table, get the average price of products in the 'Electronics' category.

SELECT AVG(Price) AS AvgPrice
FROM Products
WHERE Category = 'Electronics' 


3 Using Customers table, list all customers from cities that start with 'L'.

 SELECT *
FROM Customers
WHERE CityName LIKE 'L%'

4- Using Products table, get all product names that end with 'er'.

SELECT * 
FROM Products
WHERE ProductName LIKE '%er' 

5- Using Customers table, list all customers from countries ending in 'A'.

SELECT * 
FROM Customers
WHERE Country LIKE '%A'


6- Using Products table, show the highest price among all products.

SELECT max(Price) AS HighestPrice
FROM Products

7- Using Products table, use IIF to label stock as 'Low Stock' if quantity < 30, else 'Sufficient'.

SELECT ProductName, 
       IIF(quantity < 30, 'Low Stock', 'Sufficient') AS StockStatus
FROM Products;

8 - Using Customers table, find the total number of customers in each country.

SELECT Country, COUNT(CustomerID) AS TotalCustomers
FROM Customers
GROUP BY Country;

9-Using Orders table, find the minimum and maximum quantity ordered.

SELECT min (Quantity) AS MinQuantity
       max (Quantity) AS MaxQuantity
  FROM OrderDetails 



  CREATE TABLE Products_Discounted ( ProductID INT PRIMARY KEY, ProductName VARCHAR(100), Price DECIMAL(10, 2), Category VARCHAR(50), StockQuantity INT );



10Using Orders and Invoices tables, list customer IDs who placed orders in 2023 (using EXCEPT) to find those who did not have invoices.


  INSERT INTO Products_Discounted VALUES (1, 'Gaming Laptop', 950.00, 'Electronics', 25), (2, 'High-End Smartphone', 750.00, 'Electronics', 45), (3, 'Convertible Tablet', 350.00, 'Electronics', 35), (4, 'Ultra-Wide Monitor', 220.00, 'Electronics', 55), (5, 'Mechanical Keyboard', 45.00, 'Accessories', 90), (6, 'Wireless Mouse', 25.00, 'Accessories', 110), (7, 'Ergonomic Chair', 130.00, 'Furniture', 75), (8, 'Standing Desk', 190.00, 'Furniture', 70), (9, 'Luxury Pen', 4.50, 'Stationery', 280), (10, 'Leather Notebook', 9.00, 'Stationery', 480), (11, 'Laser Printer', 160.00, 'Electronics', 20), (12, 'DSLR Camera', 480.00, 'Electronics', 35), (13, 'LED Flashlight', 20.00, 'Tools', 190), (14, 'Designer Shirt', 28.00, 'Clothing', 140), (15, 'Slim Fit Jeans', 40.00, 'Clothing', 110), (16, 'Winter Jacket', 70.00, 'Clothing', 60), (17, 'Running Shoes', 55.00, 'Clothing', 90), (18, 'Wool Hat', 18.00, 'Accessories', 45), (19, 'Thermal Socks', 9.00, 'Clothing', 180), (20, 'Graphic T-Shirt', 22.00, 'Clothing', 140), (21, 'Desk Lamp', 55.00, 'Furniture', 35), (22, 'Marble Coffee Table', 95.00, 'Furniture', 30), (23, 'Hardcover Book', 13.00, 'Stationery', 230), (24, 'Persian Rug', 85.00, 'Furniture', 50), (25, 'Glass Cup', 4.50, 'Accessories', 470), (26, 'Leather Bag', 22.00, 'Accessories', 270), (27, 'Recliner Couch', 420.00, 'Furniture', 10), (28, 'Smart Fridge', 570.00, 'Electronics', 15), (29, 'Gas Stove', 460.00, 'Electronics', 12), (30, 'Compact Microwave', 100.00, 'Electronics', 20), (31, 'Split Air Conditioner', 320.00, 'Electronics', 8), (32, 'Front-Load Washing Machine', 410.00, 'Electronics', 12), (33, 'High-Efficiency Dryer', 370.00, 'Electronics', 8), (34, 'Ionic Hair Dryer', 27.00, 'Accessories', 90), (35, 'Steam Iron', 38.00, 'Electronics', 45), (36, 'Espresso Maker', 45.00, 'Electronics', 55), (37, 'Portable Blender', 32.00, 'Electronics', 35), (38, 'Cold Press Juicer', 50.00, 'Electronics', 28), (39, 'Smart Toaster', 36.00, 'Electronics', 65), (40, 'Compact Dishwasher', 470.00, 'Electronics', 18);


  SELECT DISTINCT.CustomerID
FROM Orders.o
WHERE YEAR(.OrderDate) = 2023

11- Using Products and Products_Discounted table, Combine all product names from Products and Products_Discounted including duplicates.


SELECT ProductName FROM Products
UNION ALL
SELECT ProductName FROM Products_Discounted;


12- Using Products and Products_Discounted table, Combine all product names from Products and Products_Discounted without duplicates. 

SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discounted;

13- Using Orders table, find the average order amount by year.

SELECT YEAR(OrderDate) AS OrderDate, AVG(Sum) AS AvgSum
FROM Orders
GROUP BY YEAR(OrderDate)
ORDER BY OrderYear 


14-Using Products table, use CASE to group products based on price: 'Low' (<100), 'Mid' (100-500), 'High' (>500). Return productname and pricegroup

 SELECT ProductName,
       CASE
           WHEN Price < 100 THEN 'Low'
           WHEN Price BETWEEN 100 AND 500 THEN 'Mid'
           WHEN Price > 500 THEN 'High'
           ELSE 'Unknown'
       END AS PriceGroup
FROM Products;

15 - Using Customers table, list all unique cities where customers live, sorted alphabetically.

SELECT DISTINCT City 
FROM Customer 
ORDER BY City 

16- Using Sales table, find total sales per product Id.

SELECT ProductID, SUM(Quantity) AS TotalSales
FROM Sales
GROUP BY ProductID;

17- Using Products table, use wildcard to find products that contain 'oo' in the name. Return productname.

SELECT ProductName
FROM Products
WHERE ProductName LIKE '%oo%';


18-Using Products and Products_Discounted tables, compare product IDs using INTERSECT.

SELECT ProductID
FROM Products
INTERSECT
SELECT ProductID
FROM Products_Discounted;


19- Using Invoices table, show top 3 customers with the highest total invoice amount. Return CustomerID and Totalspent. 

SELECT CustomerID, SUM(TotalAmount) AS TotalSpent
FROM Invoices
GROUP BY CustomerID
ORDER BY TotalSpent DESC
LIMIT 3

20 -  Find product ID and productname that are present in Products but not in Products_Discounted. 


SELECT p.ProductID, p.ProductName
FROM Products p
LEFT JOIN Products_Discounted pd ON p.ProductID = pd.ProductID
WHERE pd.ProductID IS NULL;


21-Using Products and Sales tables, list product names and the number of times each has been sold. (Research for Joins)


SELECT p.ProductName, COUNT(s.ProductID) AS TimesSold
FROM Products p
LEFT JOIN Sales s ON p.ProductID = s.ProductID
GROUP BY p.ProductName
ORDER BY TimesSold DESC;


22-  Using Orders table, find top 5 products (by ProductID) with the highest order quantities.

SELECT ProductID, SUM(Quantity) AS TotalQuantity
FROM Orders
GROUP BY ProductID
ORDER BY TotalQuantity DESC
LIMIT 5;
