-- Tạo Table
CREATE TABLE myTable (
    id SERIAL PRIMARY KEY, 
    first_name VARCHAR(50) NOT NULL,
    job VARCHAR(50) NOT NULL,
    age INT NOT NULL
);

-- Tạo Data trong Table (Không dùng dấu ngoặc kép ở đây)
INSERT INTO myTable(first_name, job, age) VALUES 
('Manh', 'Doctor', 23),
('Quan', 'Teacher', 24),
('Alice', 'Doctor', 34),
('Bob', 'Engineer', 24),
('Charlie', 'Teacher', 27),
('David', 'Nurse', 22),
('Eva', 'Lawyer', 35),
('Frank', 'Scientist', 31),
('Grace', 'Artist', 32),
('Hannah', 'Musician', 39),
('Isaac', 'Writer', 40),
('Jane', 'Photographer', 32);

-- Chọn tất cả dữ liệu từ Table bằng nhiều cột
SELECT * FROM myTable;

-- Chọn vài cột từ Table
SELECT first_name, job FROM myTable;

--==============================================================================

-- Giới hạn số bản ghi

SELECT * FROM myTable LIMIT 5;

-- Nếu muốn skip n bản ghi đầu tiên, dùng OFFSET n
SELECT * FROM myTable LIMIT 5 OFFSET 5;

--==============================================================================

-- Insert Data từ bảng này qua bảng khác
CREATE TABLE myTable2 (
    id SERIAL PRIMARY KEY, 
    first_name VARCHAR(50) NOT NULL,
    job VARCHAR(50) NOT NULL
);

INSERT INTO myTable2(first_name, job)

/*
 * DISTINCT ... FROM ...: Chọn các cột theo yêu cầu từ 1 Table được chọn.
 * ORDER BY ... DESC: Sắp xếp theo cột được chọn theo chữ cái từ Z đến A.
                      Muốn theo từ A đến Z thì dùng "ASC" hoặc KHÔNG CẦN GHI "ASC".
 *
*/

SELECT DISTINCT first_name, job FROM myTable ORDER BY first_name DESC;

SELECT * FROM myTable2;

--==============================================================================

-- Xem bảng theo yêu cầu khác
SELECT * FROM myTable WHERE age >= 31 ORDER BY age;

-- Xem bảng chứa các bản ghi theo yêu cầu
SELECT * FROM myTable WHERE first_name IN ('Manh', 'Quan');

-- Xem bảng chứa các bản ghi nếu ta không nhớ rõ cụ thể
-- Ví dụ ta muốn tìm ai có tên là "Ma**", ta dùng:
SELECT * FROM myTable WHERE first_name LIKE 'Ma%';

-- Hoặc nếu ta muốn tìm ai có tên "Q*an", ta dùng:
SELECT * FROM myTable WHERE first_name LIKE 'Q_an';

-- Có các ILIKE, NOT LIKE, NOT ILIKE, tự tìm hiểu cách dùng.

--==============================================================================

-- Thêm 1 cột vào Table với DEFAULT (Mặc định => Các bản ghi có cùng nội dung)
-- Thực thi 2 dòng này trước rồi tới các dòng khác
ALTER TABLE myTable ADD married BOOLEAN DEFAULT true;
ALTER TABLE myTable ADD city TEXT DEFAULT 'Ho Chi Minh City';

SELECT * FROM myTable;

--==============================================================================

-- Đổi Data Type cho cột
ALTER TABLE myTable ALTER COLUMN city TYPE TEXT,
                    ALTER COLUMN age TYPE SMALLINT;

SELECT * FROM myTable;

--==============================================================================

-- Đổi tên cột
ALTER TABLE myTable RENAME COLUMN city TO location;

SELECT * FROM myTable;

--==============================================================================

-- Nhét dữ liệu từ nhiều cột vô 1 cột
CREATE TABLE locations (
    postal_code VARCHAR(10),
    address VARCHAR(100),
    district VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO locations (postal_code, address, district, city) VALUES
('4166', '939 Probolinggo Loop', 'Galicia', 'A Corua (La Corua)'),
('77459', '733 Mandaluyong Place', 'Asir', 'Abha');

SELECT CONCAT(
    postal_code, ', ',
    address, ', ',
    district, ', ',
    city, ', '
) AS fulladdress FROM locations; -- Sau AS là tên cột mới thỏa mãn điều kiện ta đặt

-- Hoặc dùng:
SELECT postal_code || ', ' || address || ', ' || district || ', ' || city FROM locations;

--==============================================================================

-- Đổi kiểu dữ liệu
CREATE TABLE transactions (
    transaction_date DATE,
    amount TEXT,
    fee TEXT
);

INSERT INTO transactions (transaction_date, amount, fee) VALUES ('1999-01-08', 500, 20);
INSERT INTO transactions (transaction_date, amount, fee) VALUES ('1999-01-07', 403, 30);
INSERT INTO transactions (transaction_date, amount, fee) VALUES ('1999-02-08', 3430, 30);
INSERT INTO transactions (transaction_date, amount, fee) VALUES ('1999-03-08', 5454, 40);
INSERT INTO transactions (transaction_date, amount, fee) VALUES ('1999-04-08', 1254, 10);

-- Giả sử ta muốn cộng amount + fee nhưng gặp lỗi. Trong trường hợp ta không thể điều chỉnh ở phần CREATE TABLE,
-- ta sẽ dùng CAST
SELECT transaction_date,
CAST(amount AS INT) + CAST(fee AS INT) AS net_amount
FROM transactions;
