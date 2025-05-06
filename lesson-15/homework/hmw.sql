 1)  Retrieve employees who earn the minimum salary in the company. Tables: employees (columns: id, name, salary)



    
 SELECT * FROM employees 
WHERE salary < 60000.00(SELECT MIN(salary) FROM employees)


  2)2) Task: Retrieve products priced above the average price. Tables: products (columns: id, product_name, price)



  Select * from products 
WHERE price > (select Avg(Price) from products)


3) Retrieve employees who work in the "Sales" department. Tables: employees (columns: id, name, department_id), departments (columns: id, department_name)




SELECT * from employees AS e
WHERE exists 
 (SELECT *
 FROM departments AS d
 WHERE e.department,id=d.id and d.department name ='sale' 


  4)Retrieve customers who have not placed any orders. Tables: customers (columns: customer_id, name), orders (columns: order_id, customer_id)


  select * from customers AS c
WHERE Not exists
  (SELECT 1
  FROM orders AS o
  WHERE o.customer_id =c.customer_id)


  5)Task: Retrieve products with the highest price in each category. Tables: products (columns: id, product_name, price, category_id)


  SELECT *
FROM products p
WHERE price = (
    SELECT MAX(price)
    FROM products
    WHERE category_id = p.category_id
);



6)ask: Retrieve employees working in the department with the highest average salary. 
Tables: employees (columns: id, name, salary, department_id), departments (columns: id, department_name)



SELECT *
FROM employees e
WHERE e.department_id = (
    SELECT department_id
    FROM employees
    GROUP BY department_id
    ORDER BY AVG(salary) DESC
    LIMIT 1
);


7)Task: Retrieve employees earning more than the average salary in their department
Tables: employees (columns: id, name, salary, department_id)


select * 
from employees e 
WHERE salary =(
SELECT MAX(salary)
FROM employees 
WHERE id=department_id)


8)Retrieve students who received the highest grade in each course.
Tables: students (columns: student_id, name), grades (columns: student_id, course_id, grade)


SELECT s.student_id, s.name, g.course_id, g.grade
FROM students s
JOIN grades g ON s.student_id = g.student_id
WHERE g.grade = (
    SELECT MAX(g2.grade)
    FROM grades g2
    WHERE g2.course_id = g.course_id
);



9)Find Third-Highest Price per Category Task: Retrieve products with the third-highest price in each category.
Tables: products (columns: id, product_name, price, category_id)



SELECT id, product_name, price, category_id
FROM (
    SELECT *, DENSE_RANK() OVER (PARTITION BY category_id ORDER BY price DESC) AS price_rank
    FROM products
) ranked_products
WHERE price_rank = 3;


10): Retrieve employees with salaries above the company average but below the maximum in their department.
Tables: employees (columns: id, name, salary, department_id)




SELECT e.id, e.name, e.salary, e.department_id
FROM employees e
WHERE e.salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department_id = e.department_id
)
AND e.salary < (
    SELECT MAX(salary)
    FROM employees
    WHERE department_id = e.department_id
);
