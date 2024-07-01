/*
 * GROUP BY được sử dụng để gộp các hàng có cùng giá trị trong một hoặc nhiều cột lại với nhau. 
 * Thường thì GROUP BY được sử dụng kết hợp với các hàm tổng hợp như COUNT, SUM, AVG, MAX, MIN.
*/

-- Ví dụ trong 2 Table "customers" và "orders", ta đếm số đơn hàng mà từng khách hàng đã đặt
SELECT customers.customer_id, customers.customer_name, COUNT(orders.order_id) AS order_count
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id, customers.customer_name;

/*
 * HAVING: Như WHERE, được sử dụng để lọc kết quả theo điều kiện.
*/
SELECT customers.customer_id, customers.customer_name, COUNT(orders.order_id) AS order_count
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id, customers.customer_name
HAVING COUNT(orders.order_id) > 1;