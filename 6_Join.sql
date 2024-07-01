CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255)
);

INSERT INTO customers (customer_id, customer_name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'Mary'),
(5, 'John'),
(6, 'Eva');

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE
    -- FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders (order_id, customer_id, order_date) VALUES
(101, 1, '2023-06-01'),
(102, 2, '2023-06-03'),
(103, 1, '2023-06-04'),
(104, 3, '2023-06-11'),
(105, 2, '2023-06-23'),
(106, 4, '2023-06-24'),
(107, 7, '2023-06-25'),
(108, 8, '2023-06-26');

-- INNER JOIN
SELECT customers.customer_id, customers.customer_name, orders.order_date, orders.order_id
FROM customers INNER JOIN orders ON customers.customer_id = orders.customer_id; -- 2 tên bảng có thể đổi chỗ cho nhau

--==============================================================================

-- LEFT JOIN
SELECT customers.customer_id, customers.customer_name, orders.order_date, orders.order_id
FROM customers LEFT JOIN orders ON customers.customer_id = orders.customer_id; 
-- Do còn John và Eva ở bảng customers nên trả về NULL, nếu đổi vị trí 2 bảng cho nhau thì ra kết quả khác.

--==============================================================================

-- RIGHT JOIN
SELECT customers.customer_id, customers.customer_name, orders.order_date, orders.order_id
FROM customers RIGHT JOIN orders ON customers.customer_id = orders.customer_id; 

--==============================================================================

-- FULL JOIN
SELECT customers.customer_id, customers.customer_name, orders.order_date, orders.order_id
FROM customers FULL JOIN orders ON customers.customer_id = orders.customer_id; 