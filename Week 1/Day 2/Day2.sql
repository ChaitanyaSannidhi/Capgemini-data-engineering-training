CREATE TABLE Employee (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
department VARCHAR(50),
salary DECIMAL(10, 2),
joining_date DATE
);

INSERT INTO Employee (emp_id, emp_name, department, salary, joining_date) VALUES
(1, 'Karthik', 'HR', 60000.00, '2021-01-15'),
(2, 'Pratik', 'Finance', 70000.00, '2021-03-10'),
(3, 'Veer', 'HR', 55000.00, '2021-06-20'),
(4, 'Priya', 'Finance', 80000.00, '2022-01-05'),
(5, 'Ajay', 'Engineering', 75000.00, '2020-11-01'),
(6, 'Vijay', 'Engineering', 78000.00, '2019-05-22'),
(7, 'Veena', 'HR', 62000.00, '2023-03-12'),
(8, 'Meena', 'Marketing', 65000.00, '2022-08-18');


CREATE TABLE Sales (
sales_id INT PRIMARY KEY,
emp_id INT,
product VARCHAR(50),
amount DECIMAL(10, 2),
sale_date DATE
);

INSERT INTO Sales (sales_id, emp_id, product, amount, sale_date) VALUES
(1, 1, 'Laptop', 50000.00, '2023-01-15'),
(2, 2, 'Mobile', 30000.00, '2023-02-18'),
(3, 3, 'Tablet', 20000.00, '2023-02-25'),
(4, 4, 'Laptop', 45000.00, '2023-03-05'),
(5, 5, 'Mobile', 35000.00, '2023-03-12'),
(6, 6, 'Tablet', 25000.00, '2023-03-20'),
(7, 7, 'Laptop', 60000.00, '2023-04-01'),
(8, 8, 'Mobile', 40000.00, '2023-04-10');

-- 1. Find the total salary for each department in the Employee table
Select department , Sum(Salary) as Salary_Amount
From Employee
Group by department

-- 2. Count the number of employees in each department.
Select department , Count(emp_id) as Employee_Count
From Employee
Group by department

-- 3. Calculate the average salary of employees in each department.
Select department , Avg(salary) as Average_Salary
From Employee
Group by department

-- 4. Find the maximum salary in each department.
Select department , Max(salary)
From Employee
Group by department

-- 5 Find the minimum salary in each department.
Select department , Min(salary)
From Employee
Group by department

-- 6. Find the total salary for departments where the total salary exceeds 100,000
Select department , Sum(salary) as Total_salary
From Employee
Group by department
Having Total_salary > 100000

-- 7. Count the number of employees in departments with more than 2 employees
Select department , Count(emp_id) as Employee_Count
From Employee
Group by department
Having Employee_count > 2

-- 8. Calculate the average salary for employees who joined after 2021-01-01, grouped by department.

Select department , Avg(salary) as Average_Salary
From Employee
Where joining_date > '2021-01-01'
Group by department

-- 9. Find the departments where the maximum salary is greater than 75,000.

Select department , Max(salary) as Max_Salary
From Employee
Group by department
Having Max_salary > 75000

-- 10. List the departments where the total salary is less than 150,000.

Select department , Sum(salary) as Total_Salary
From Employee
Group by department
Having Total_salary > 150000

-- 11. Find the total number of employees grouped by department, but only include departments with more than 1 employee.

Select department , Count(emp_id) as Total_Employee
From Employee
Group by department

-- 12. Calculate the total salary of each department and show only those where the total exceeds 125,000.

Select department , Sum(salary) as Total_Salary
From Employee
Group by department
having Total_Salary > 125000

-- 13. Count the number of employees in each department, but include only departments with more than 2 employees.

Select department , Count(emp_id) as Total_Employees
From Employee
Group by department
having Total_Employees > 2

-- 14. Find the average salary in each department where the average salary is above 60,000.

Select department , Avg(salary) as Average_Salary
From Employee
Group by department
having Average_Salary > 60000

-- 15. Show departments where the sum of salaries is between 100,000 and 200,000.

Select department , Sum(salary) as Total_Salary
From Employee
Group by department
having Total_Salary > 100000 and Total_Salary < 200000

-- 16. Find the total sales amount for each employee

Select e.emp_name , Sum(s.amount) as Total_Sales
From Employee e
Join Sales s on e.emp_id = s.emp_id
Group by emp_name
Order by Total_Sales desc

-- 17. List the number of sales made by each employee.

Select e.emp_name , Count(s.sales_id)
From Employee e
Join Sales s on e.emp_id = s.emp_id
Group by e.emp_id

-- 18. Find the total sales amount grouped by product.

Select s.product , Sum(s.amount)
From Employee e
Join Sales s on e.emp_id = s.emp_id
Group by s.product

-- 19. Calculate the average sales amount grouped by product.

Select s.product , Round(Avg(s.amount),2)
From Employee e
Join Sales s on e.emp_id = s.emp_id
Group by s.product

-- 20. Find employees who have made more than 2 sales, grouped by their names.

Select e.emp_name , Count(s.sales_id) as total_count
From Employee e
Join Sales s on e.emp_id = s.emp_id
Group by e.emp_name
Having total_count >= 2

-- 21. Calculate the total salary and total sales amount for each employee.

Select e.emp_name ,Sum(distinct e.salary) as Total_Salary , Sum(s.amount) as Total_Sales
From Employee e
Join Sales s on e.emp_id = s.emp_id
Group by e.emp_name

-- 22. Count the number of unique products sold by each employee.

Select e.emp_name , Count(Distinct s.product) as Unique_Products
From Employee e
Join Sales s on e.emp_id = s.emp_id
Group by e.emp_name

-- 23. Find the highest sales amount made by each employee.

Select e.emp_name , Max(s.amount) as Highest_Sale_Amount
From Employee e
Join Sales s on e.emp_id = s.emp_id
Group by e.emp_name

-- 24. Calculate the total sales amount grouped by product and filtered by products where the total exceeds 50,000.

Select  s.product, Sum(s.amount) as Amount
From Employee e
Join Sales s on e.emp_id = s.emp_id
Group by s.product
Having Amount > 50000

-- 25. Find the departments with the highest average sales amount..

Select e.department , Avg(s.amount) as Amount
From Employee e
Join Sales s on e.emp_id = s.emp_id
Group by e.department
Order by Amount desc
Limit 1

-- 26. Find the department with the highest total sales amount.

Select e.department , Sum(s.amount) as Amount
From Employee e
Join Sales s on e.emp_id = s.emp_id
Group by e.department
Order by Amount desc
Limit 1

-- 27. Show the top 3 employees with the highest total sales amount, grouped by employee names.


Select e.emp_name , Sum(s.amount) as Amount
From Employee e
Join Sales s on e.emp_id = s.emp_id
Group by e.emp_name
Order by Amount desc
Limit 3

-- 28. Calculate the total number of employees and the average salary, grouped by the year of joining.

Select Year(joining_date) as Year_of_Joining , Count(emp_name) as No_of_Employees , Avg(salary) as Average_Salary
From Employee
Group by Year(joining_date)

-- 29 Find the total sales amount for each department (using a join between Employee and Sales)

Select e.Department , Sum(s.amount) as Total_Sales
From Employee e
Join Sales s on s.emp_id = e.emp_id
Group by e.Department

-- 30. Show employees who have not made any sales, grouped by their department

Select e.emp_name , Sum(s.amount) as Total_Sales , Count(s.product) as Count
From Employee e
Join Sales s on s.emp_id = e.emp_id
Group by e.emp_name
Having Count = 0


