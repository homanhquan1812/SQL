-- Tạo bảng customers_PF
CREATE TABLE customers_PF (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255)
);

-- Tạo bảng orders_PF
CREATE TABLE orders_PF (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers_PF(customer_id)
);

-- Chèn dữ liệu vào bảng customers_PF
INSERT INTO customers_PF (customer_id, customer_name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie');

-- Chèn dữ liệu vào bảng orders_PF
INSERT INTO orders_PF (order_id, customer_id, order_date) VALUES
(101, 1, '2023-06-01'),
(102, 2, '2023-06-03'),
(103, 1, '2023-06-04');

SELECT * FROM orders_PF;