-- 1. Retrieve the names of employees and their corresponding managers from the "employees" table, ensuring that even employees without managers are included.

SELECT 
    e.emp_name AS employee_name,
    m.emp_name AS manager_name
FROM employees e
LEFT JOIN employees m
    ON e.manager_id = m.emp_id;

-- 2. Display all employees and their corresponding departments from the "employees" and "departments" tables, showing employees even if they don't belong to any department.

