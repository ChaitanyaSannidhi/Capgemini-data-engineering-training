CREATE TABLE customers (
    customer_id INT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(150),
    phone_number VARCHAR(20),
    address VARCHAR(200),
    city VARCHAR(100),
    state VARCHAR(50),
    zip_code VARCHAR(20)
);

CREATE TABLE sales (
    sale_id INT,
    customer_id INT,
    product_id INT,
    sale_date DATE,
    quantity INT,
    total_amount DOUBLE
);

INSERT INTO customers VALUES
    (1, 'John', 'Smith', 'john.smith@domain.com', '555-0001', '123 Elm St', 'Springfield', 'IL', '62701'),
    (2, 'Emma', 'Jones', 'emma.jones@webmail.com', '555-0002', '456 Oak St', 'Centerville', 'OH', '45459'),
    (3, 'Olivia', 'Brown', 'olivia.brown@outlook.com', '555-0003', '789 Pine St', 'Greenville', 'SC', '29601'),
    (4, 'Liam', 'Johnson', 'liam.johnson@mail.com', '555-0004', '321 Maple St', 'Austin', 'TX', '73301'),
    (5, 'Noah', 'Williams', 'noah.williams@mail.com', '555-0005', '654 Cedar St', 'Dallas', 'TX', '75001');

INSERT INTO sales VALUES
    (1, 1, 101, '2024-01-15', 2, 39.98),
    (2, 1, 102, '2024-01-20', 1, 29.99),
    (3, 2, 103, '2024-01-16', 1, 25.00),
    (4, 2, 104, '2024-01-22', 3, 89.97),
    (5, 3, 105, '2024-01-17', 2, 49.98),
    (6, 1, 106, '2024-01-25', 1, 19.99),
    (7, 4, 107, '2024-01-18', 2, 59.98),
    (8, 5, 108, '2024-01-19', 1, 15.00),
    (9, 5, 109, '2024-01-21', 2, 30.00),
    (10, 5, 110, '2024-01-23', 1, 20.00);


1.Daily sales value:
Select sale_date , ROUND(Sum(total_amount) , 2) as total_value
From sales
group by sale_date
order by sale_date


2. Total sales value by city:
Select city , ROUND(Sum(total_amount) , 2) as total_value
From customers c
Join sales s on c.customer_id = s.customer_id
Group by c.city
order by total_value desc;



3. Customers with more than 2 orders:
SELECT 
    c.customer_id,
    c.first_name,
    COUNT(*) AS total_orders
FROM sales s
JOIN customers c 
    ON c.customer_id = s.customer_id
GROUP BY 
    c.customer_id,
    c.first_name
HAVING COUNT(*) > 2;

4. Highest spending customer in each city:
SELECT city, customer_id, first_name, total_spend
FROM (
    SELECT 
        c.city,
        c.customer_id,
        c.first_name,
        SUM(s.total_amount) AS total_spend,
        RANK() OVER (
            PARTITION BY c.city
            ORDER BY SUM(s.total_amount) DESC
        ) AS rnk
    FROM customers c
    JOIN sales s
        ON c.customer_id = s.customer_id
    GROUP BY 
        c.city,
        c.customer_id,
        c.first_name
) t
WHERE rnk = 1;

5.Final reporting table with customer_id, city, total spent, and order count:
SELECT 
    c.customer_id,
    c.city,
    ROUND(SUM(s.total_amount), 2) AS total_spent,
    COUNT(*) AS order_count
FROM customers c
JOIN sales s
    ON c.customer_id = s.customer_id
GROUP BY c.customer_id, c.city;