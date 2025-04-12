1ANSWER


CREATE TABLE Employees (EmpID INT ,
Name (VARCHAR(50),
Salary (DECIMAL(10,2)
);


2ANSWER

--Single-row insert

INSERT INTO Employees (EmpID,Name,Salary)

--Multiple-row insert 
INSERT INTO Employees (EmpID,Name,Salary)VALUES (1,'Diyora',4300,00),
INSERT INTO Employees(EmpID,Name,Salary) VALUES (2,'Doniyor'2300,00),
INSERT INTO Employees (EmpID,Name,Salary)VALUES  (3,Diyorbek,1200,00),
VALUES(4,'Odina',5200.00),(5,'Shirin',4700,00),(6,'Farruh',7200,00);


3ANSWER

UPDATE Employees
SET Salary =3500,00
WHERE EmpID =1


4 ANSWER

DELETE FROM Employees
WHERE EmpID=2;

5 ANSWER

DELATE-Delates selected rows,can use WHERE,rollback possible.
TRUNCATE-Deletes all rows,faster,cannot rollback (in most systems).
DROP-Delates the whole table structure and data


6 ANSWER

ALTER TABLE Employees
MODIFY Name Varchar (100);


7 ANSWER

ALTER TABLE Employees
ADD Department VARCHAR(50);

8 ANSWER

ALTER TABLE Employees
MODIFYY Salary FLOAT;

9 ANSWER

CTEATE TABLE Departments (DepartmentID INT PRIMARY KEY,
DepartmentName Varchar(50)
);

10 ANSWER

DELETE FROM Employees;
--OR
TRUNCATE TABLE Employees;


11 ANSWER


INSERT INTO Departments (DepartmenID,DepartmentName)
SELECT DISTINCT EmpID,Department
FROM Employees
LIMIT 5;

12 ANSWER

UPDATE Employees  
SET Department = 'Managment'
WHERE Salary > 5000


13 ANSWER

DELETE FROM Employees;

14ANSWER


ALTER TABLE Employees
DROP COLUMN Department;

15 ANSWER

ALTER TABLE Employees
RENAME TO StaffMembers;

16 ANSWER

DROP TABLE Departments;


17 Answer 


CREATE TABLE Products(
ProductID INT PRIMARY KEY,
ProductName(VARCHAR(50),
Category(VARCHAR(50),
Price(DECIMAL(10,2),
Description VARCHAR(255)
);

18 ANSWER

ALTER TABLE Products
ADD CONSTRAINT chk_price CHECK(Price > 0);

19 ANSWER

ALTER TABLE Products 
ADD StockQuantity INT DEFAULT 50;

20 ANSWER
ALTER TABLE Products 
RENAME COLUMN Category TO ProductCategory;


21 ANSWER

INSERT INTO Products (ProductID, ProductName, ProductCategory, Price, Description)
VALUES 
(1, 'Laptop', 'Electronics', 1200.00, 'Gaming laptop'),
(2, 'Phone', 'Electronics', 800.00, 'Smartphone'),
(3, 'Desk', 'Furniture', 200.00, 'Wooden desk'),
(4, 'Chair', 'Furniture', 100.00, 'Office chair'),
(5, 'Pen', 'Stationery', 2.00, 'Ballpoint pen');


22 ANSWER

SELECT * INTO Products_Backup
FROM Products;

23 ANSWER

ALTER TABLE Products
RENAME TO INVENTORY 

24 ANSWER

ALTER TABLE Inventory 
ALTER COLUMN Price FLOAT;


25 ANSWER

ALTER TABLE Inventory 
ADD ProductCode INT IDENTITY (1000,1);
