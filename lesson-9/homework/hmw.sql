


CREATE TABLE TASK_9

DROP TABLE IF EXISTS Employees;

CREATE TABLE Employees(
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    HireDate DATE,
    ManagerID INT,
    FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID)
  );


INSERT INTO Employees (EmployeeID, Name, DepartmentID, Salary, HireDate, ManagerID) VALUES
(1, 'John Doe', 1, 55000.00, '2020-01-01', NULL),  
(2, 'Jane Smith', 2, 65000.00, '2019-03-15', 1),
(3, 'Mary Johnson', 3, 45000.00, '2021-05-10', 2),
(4, 'James Brown', 5, 60000.00, '2018-07-22', 1),
(5, 'Patricia Davis', 4, 70000.00, '2017-08-30', 4),
(6, 'Michael Miller', 2, 75000.00, '2020-12-12', 2),
(7, 'Linda Wilson', 3, 48000.00, '2016-11-02', 3),
(8, 'David Moore', 4, 85000.00, '2021-09-01', 5),
(9, 'Elizabeth Taylor', 1, 60000.00, '2019-05-18', 1),
(10, 'William Anderson', 2, 64000.00, '2020-04-10', 2),
(11, 'Susan Thomas', 3, 47000.00, '2017-01-25', 3),
(12, 'Joseph Jackson', 4, 78000.00, '2016-09-30', 5),
(13, 'Karen White', 1, 59000.00, '2018-06-10', 9),
(14, 'Steven Harris', 2, 71000.00, '2021-07-15', 6),
(15, 'Nancy Clark', 3, 45000.00, '2020-02-20', 7),
(16, 'George Lewis', 4, 80000.00, '2019-11-10', 8),
(17, 'Betty Lee', 5, 55000.00, '2017-04-05', 4),
(18, 'Samuel Walker', 2, 72000.00, '2021-03-22', 6),
(19, 'Helen Hall', 3, 49000.00, '2018-10-16', 7),
(20, 'Charles Allen', 4, 90000.00, '2015-08-11', 12),
(21, 'Betty Young', 1, 53000.00, '2020-05-17', 9),
(22, 'Frank King', 2, 67000.00, '2021-02-02', 10),
(23, 'Deborah Scott', 3, 47000.00, '2019-07-09', 11),
(24, 'Matthew Green', 4, 76000.00, '2021-01-15', 16),
(25, 'Sandra Adams', 1, 54000.00, '2020-06-21', 21),
(26, 'Paul Nelson', 2, 71000.00, '2018-12-03', 10),
(27, 'Margaret Carter', 3, 46000.00, '2020-08-19', 19),
(28, 'Anthony Mitchell', 4, 82000.00, '2021-04-10', 16),
(29, 'Lisa Perez', 1, 60000.00, '2021-03-05', 21),
(30, 'Christopher Roberts', 2, 69000.00, '2019-09-24', 22),
(31, 'Jessica Gonzalez', 3, 47000.00, '2017-12-13', 23),
(32, 'Brian Moore', 5, 85000.00, '2018-11-05', 17),
(33, 'Dorothy Evans', 1, 59000.00, '2019-06-11', 25),
(34, 'Matthew Carter', 2, 70000.00, '2020-01-29', 26),
(35, 'Rachel Martinez', 3, 51000.00, '2021-06-06', 27),
(36, 'Daniel Perez', 4, 83000.00, '2021-07-01', 28),
(37, 'Catherine Roberts', 1, 60000.00, '2020-09-19', 29),
(38, 'Ronald Murphy', 2, 68000.00, '2017-02-04', 30),
(39, 'Angela Jenkins', 3, 52000.00, '2018-04-23', 31),
(40, 'Gary Wright', 4, 87000.00, '2021-01-10', 36),
(41, 'Kevin Turner', 6, 55000.00, '2022-02-14', NULL), 
(42, 'Laura Phillips', 7, 62000.00, '2023-05-22', 41),
(43, 'Eric Collins', 8, 58000.00, '2020-10-30', 41),
(44, 'Megan Edwards', 9, 70000.00, '2019-11-25', 41);




1.Using Products, Suppliers table List all combinations of product names and supplier names.


 SELECT Products.ProductName, Suppliers.SupplierName
 FROM Products 
 Cross join Suppliers





 2.Using Departments, Employees table Get all combinations of departments and employees.

 SELECT Departments.DepartmentName, Employees.EmployeeID
 FROM Departments
 CROSS JOIN Employees 



 3.Using Products, Suppliers table List only the combinations where the supplier actually supplies the product. Return supplier name and product name

 SELECT Products.ProductName, Suppliers.SupplierName
 INNER JOIN Suppliers
 on Products.SupplierID = Suppliers.SupplierID 


 4.Using Orders, Customers table List customer names and their orders ID.

 SELECT Customer.CustomerName, Order.OrderID
 FROM Orders
 INNER JOIN Customer
 ON Orders.CustomerID = Customers.CustomerID;


 5.Using Courses, Students table Get all combinations of students and courses.

 SELECT Students.StudentName, Courses.CourseName
 FROM Students 
 INNER JOIN Courses 

 

 6 Using Products, Orders table Get product names and orders where product IDs match.

 SELECT p.ProductName, o.OrderID
FROM Products p
INNER JOIN Orders o ON p.ProductID = o.ProductID;



7.Using Departments, Employees table List employees whose DepartmentID matches the department.


SELECT d.DepartmentID, e.EmployeeName
FROM Departments d
INNER JOIN Employees e
ON d.DepartmentID = e.DepartmentID;


8.Using Students, Enrollments table List student names and their enrolled course IDs.

SELECT s.StudentName, e.CourseID
FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID 


9.Using Payments, Orders table List all orders that have matching payments.


SELECT p.Payments, o.Orders
FROM p.Payments
INNER JOIN Orders o ON p.Payments = o.Orders


10.Using Orders, Products table Show orders where product price is more than 100.

SELECT o.OrderID, p.ProductName, p.Price
FROM Orders o
INNER JOIN Products p ON o.ProductID = p.ProductID
WHERE p.Price > 100 



11. Using Employees, Departments table List employee names and department names where department IDs are not equal. It means: Show all mismatched employee-department combinations.

SELECT e.EmployeeName, d.DepartmentName
FROM Employees.e
CROSS JOIN Departments d
WHERE e.DepartmentID <> d.DepartmentID;



12.Using Orders, Products table Show orders where ordered quantity is greater than stock quantity.

SELECT o.OrderID, p.ProductName
FROM Orders.o
CROSS JOIN Products.p
WHERE o.quantity > stock.q


13.Using Customers, Sales table List customer names and product IDs where sale amount is 500 or more.

SELECT c.CustomerName, p.ProductID
FROM Customer.c
INNER JOIN Products.p ON c.CustomerName = p.ProductID
WHERE SaleAmount >= 500;

14.Using Courses, Enrollments, Students table List student names and course names they’re enrolled in.

SELECT c.CourseName, s.StudentName
FROM Student.s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
INNER JOIN Courses c ON e.CourseID = c.CourseID;



15.Using Products, Suppliers table List product and supplier names where supplier name contains “Tech”.


SELECT p.ProductName, s.SupplierName
FROM Suppliers.s
INNER JOIN Products.p ON s.SupplierName
WHERE SupplierName LIKE '%Tech%';


16.Using Orders, Payments table Show orders where payment amount is less than total amount.

SELECT o.OrderID, o.TotalAmount, p.PaymentAmount
FROM Orders o
INNER JOIN Payments p ON o.OrderID = p.OrderID
WHERE p.PaymentAmount < o.TotalAmount;


17.Using Employees table List employee names with salaries greater than their manager’s salary.

SELECT e.EmployeeName, e.Salary
FROM Employee.e
INNER JOIN Employees m ON e.ManagerID = m.EmployeeID
WHERE e.Salary > m.Salary 


18.Using Products, Categories table Show products where category is either 'Electronics' or 'Furniture'.

SELECT p.ProductName, c.CategoryName
FROM Products.p
CROSS JOIN Category.c
WHERE Category IN ('Electronics', 'Furniture');




19.Using Sales, Customers table 


SELECT s.SaleID, s.SaleAmount,c.CustomerName
FROM Sales s
CROSS JOIN Customers c ON s.CustomerID = c.CustomerID
WHERE c.Country = 'USA';




20.Using Orders, Customers table List orders made by customers from 'Germany' and order total > 100.


SELECT o.OrderID, o.OrderTotal, c.CustomerName
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE c.Country = 'Germany' AND o.OrderTotal > 100;




21.Using Employees table List all pairs of employees from different departments.



SELECT e1.EmployeeName AS Employee1, e2.EmployeeName AS Employee2
FROM Employees e1
CROSS JOIN Employees e2
WHERE e1.DepartmentID <> e2.DepartmentID;



22.Using Payments, Orders, Products table List payment details where the paid amount is not equal to (Quantity × Product Price).

SELECT p.PaymentID, p.PaidAmount, o.Quantity, pr.ProductPrice
FROM Payments p
INNER JOIN Orders o ON p.OrderID = o.OrderID
INNER JOIN Products pr ON o.ProductID = pr.ProductID
WHERE p.PaidAmount <> o.Quantity * pr.ProductPrice;



23.Using Students, Enrollments, Courses table Find students who are not enrolled in any course.


SELECT s.StudentName
FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
WHERE e.StudentID IS NULL;



24.Using Employees table List employees who are managers of someone, but their salary is less than or equal to the person they manage



SELECT e.EmployeeName AS Manager, m.EmployeeName AS ManagedEmployee, e.Salary AS ManagerSalary, m.Salary AS ManagedEmployeeSalary
FROM Employees e
INNER JOIN Employees m ON e.EmployeeID = m.ManagerID
WHERE e.Salary <= m.Salary;









25.Using Orders, Payments, Customers table List customers who have made an order, but no payment has been recorded for it.

SELECT c.CustomerName, o.OrderID
FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
LEFT JOIN Payments p ON o.OrderID = p.OrderID
WHERE p.PaymentID IS NULL;
