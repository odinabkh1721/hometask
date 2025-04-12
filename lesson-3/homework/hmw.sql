1 ANSWER 

BULK INSERT TableName
from 'file_path'
WITH (
FIELDTERMINATOR = ' ' ,
ROWTERMINATOR = ' \n',
FIRSTROW = 2 
) ;

2 ANSWER
.csv (Comma _ sepparated Values)
.txt (Text File)
.xls/xlsx(Exel files)
.xml(Extensible Markup Language)

3 ANSWER

CREATE TABLE Products (
ProductID INT PRIMARY KEY,
ProductName VARCHAR(50),
Price DECIMAL(10,2),
);

4 ANSWER

INSERT INTO Products (ProductID,ProductName,Price) VALUES (1, 'Apple',0.90);
INSERT INTO Products (ProductID,ProductName,Price) VALUES (2,'Bana', 0.59)
INSERT INTO Products (ProductID,ProductName,Price) VALUES (3,'Orange',1,25)

 5 ANSWER 

--NULL- Qiymat yoligini bildiradi.
For example; Price DECIMAL(10,2) NULL

--NOT NULL- Qiymati majburiy 
For example; ProductName VARCHAR ( 50N) NOT NULL

6 ANSWER

ALTER TABLE Products 
ADD CONSTRAINT UQ_ProductName UNIQUE (ProductName);

7ANSWER 

--This query selects all products with price above 1.00
SELECT * FROM Products 
WHERE Price > 1.00;

8 ANSWER 

CREATE TABLE Categories (
CategoryID INT PRIMARY KEY,
CategoryName VARCHAR(50) UNIQUE
);

9 ANSWER

IDENTITY- Bu ustun uchun avtomatik tarzda unikal qiymat (odatda inkremental ) yaratadi.
For examle: ProductID INT IDENTIFY(1,1)-har bir yozuvda qiymat avtomatik oshadi.


10 ANSWER

BULK INSERT Products 
FROM 'C:\Data \products .text'
WITH(
FIELDTERMINATOR=',',
ROWTERMINATOR ='\n',
FIRSTROW = 2 
);


11 ANSWER

ALTER TABLE Products 
ADD CategoryID INT,
CONSTRAINT FK_Category FOREIGN KEY (CATEGORY ID)
REFERANCES Categories( CategoryID);


12 ANSWER

: PRIMARY KEY- Unikal + NOT NULL,faqat 
bitta bolishi mumkin.
:UNIQUE- Faqat unikal ,lekin NULL bolishi mumkin ,bir nechta ustunda 
bolishi mumkin.


13 ANSWER 

ALTER TABLE Products 
ADD CONSTRAINT CHK_Price CHECK (Price > 0);


14 ANSWER


ALTER TABLE Products
ADD Stock INT NOT NULL;


15 ANSWER

SELECT ProductName, ISNULL (Stock,0) AS Stock
FROM Products;


16 ANSWER 

A FOREIGN KEY constraint in SQL Server is used to establish and enforce a link between data
in two tables.It ensures referential integrity by making sure that the 
value in one table matches a value in another table.


17 ANSWER 

CREATE TABLE Customers (
CustomerID PRIMARY KEY,
Name VARCHAR (100),
Age INT CHECK (Age>=18)
);

18 ANSWER

CREATE TABLE SampleTable (
ID INT IDENTITY (100,10) PRIMARY KEY,
Description VARCHAR(100)
);

19 ANSWER 

CREATE TABLE OrderDetails (
OrderID INT,
ProductID INT,
Quantity INT,
PRIMARY KEY (OrderID, ProductID)
);

20 ANSWER

-- COALESCE example
SELECT COALESCE(NULL, NULL, 'DefaultValue') AS Result;  -- returns 'DefaultValue'

-- ISNULL example
SELECT ISNULL(NULL, 'Default') AS Result;  -- returns 'Default'


21 ANSWER 

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE
);

22 ANSWER

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
22 ANSWER

CREATE TABLE Orders (
OrderID INT PRIMARY KEY,
CustomerID INT,
FOREIGN KEY (CustomerID) REFERENCES Customer,
ON DELETE CASCADE
ON UPDATE CASCADE);
