/*
 * 1 Database có 1 hoặc nhiều bảng, 1 bảng được xem là 1 quan hệ (Relation).
 * 1 Bảng có các bản ghi (Dòng - Row) và các trường (Cột - Column), như trong ví dụ này:
 *
 * -----------------------------
   | id | first_name | job     |
   -----------------------------
   | 1  | Manh       | Doctor  |
   -----------------------------
   | 2  | Quan       | Teacher |
   -----------------------------
 *
 * Ta có 2 bản ghi và 3 trường.
*/

/*
 * Các kiểu dữ liệu phổ biến trong SQL:
 * (Chú ý: Không phải tất cả Database đều có chung kiểu dữ liệu SQL, cần tìm hiểu kĩ)
 *
 * - TEXT: Dùng cho một chuỗi các ký tự không bị giới hạn về chiều dài.
 * - VARCHAR: Lưu trữ chuỗi các ký tự không bị giới hạn chiều dài.
              Nhưng ta có thể giới hạn chiều dài bằng cách dùng VARCHAR(n) với n là số tự nhiên > 0.
 * - CHAR: Như VARCHAR, nhưng khác ở chỗ CHAR(n), nếu độ dài < n thì sẽ lấp khoảng trống sau đó cho đến khi độ dài = n.
 * - INTEGER (hoặc INT): Lưu số nguyên, phạm vi từ -2147483648 đến 2147483647.
 * - IDENTITY(a, b): Số thứ tự, xuất phát từ a và tăng dần theo b.
 * - NUMERIC(a, b) hoặc DECIMAL(a, b): Số thập phân, a gồm các chữ số trước và sau dấu phẩy (thường a = 10),
                                       b là số chữ số cần được làm tròn sau dấu phẩy.
 * - BIT: Boolean, thường là 1 (True) hoặc 0 (False).
 * - DATETIME: Lưu ngày tháng năm, giờ phút giây (2069-06-09 06:09:00).
*/ 

-- Tạo Table
CREATE TABLE myTable (
    id INT IDENTITY(1, 1) PRIMARY KEY, 
    first_name VARCHAR(50) NOT NULL,
    job VARCHAR(50) NOT NULL,
    age INT NOT NULL
);


-- Tạo Data trong Table (Không dùng dấu ngoặc kép ở đây)
INSERT INTO myTable(first_name, job, age)
VALUES 
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

-- Chọn tất cả dữ liệu từ Table
SELECT * FROM myTable;


-- Insert Data từ bảng này qua bảng khác
CREATE TABLE myTable2 (
    id INT IDENTITY(1, 1) PRIMARY KEY, 
    first_name VARCHAR(50) NOT NULL,
    job VARCHAR(50) NOT NULL,
);

INSERT INTO myTable2

/*
 * DISTINCT ... FROM ...: Chọn các cột theo yêu cầu từ 1 Table được chọn.
 * ORDER BY ... DESC: Sắp xếp theo cột được chọn theo chữ cái từ Z đến A.
                      Muốn theo từ A đến Z thì dùng "ASC" hoặc KHÔNG CẦN GHI "ASC".
 *
*/

SELECT DISTINCT first_name, job FROM myTable ORDER BY first_name DESC;

SELECT * FROM myTable2;


-- Xem bảng theo yêu cầu khác
SELECT * FROM myTable WHERE age >= 31 ORDER BY age;


-- Thêm 1 cột vào Table
-- Thực thi 2 dòng này trước rồi tới các dòng khác
ALTER TABLE myTable ADD married VARCHAR(10);
ALTER TABLE myTable ADD city VARCHAR(255);

UPDATE myTable
SET married = CASE
    WHEN id = 1 THEN 'Yes'
    WHEN id = 2 THEN 'No'
    WHEN id = 3 THEN 'Yes'
    WHEN id = 4 THEN 'Yes'
    WHEN id = 5 THEN 'No'
    WHEN id = 6 THEN 'Yes'
    WHEN id = 7 THEN 'Yes'
    WHEN id = 8 THEN 'No'
    WHEN id = 9 THEN 'Yes'
    WHEN id = 10 THEN 'Yes'
    WHEN id = 11 THEN 'No'
    WHEN id = 12 THEN 'Yes'
    -- Add more cases as needed
    ELSE ''
    END
WHERE id BETWEEN 1 AND 12;

-- Update city column
UPDATE myTable
SET city = CASE
    WHEN id = 1 THEN 'New York'
    WHEN id = 2 THEN 'Los Angeles'
    WHEN id = 3 THEN 'Chicago'
    WHEN id = 4 THEN 'Phoenix'
    WHEN id = 5 THEN 'Houston'
    WHEN id = 6 THEN 'Dallas'
    WHEN id = 7 THEN 'Seattle'
    WHEN id = 8 THEN 'Miami'
    WHEN id = 9 THEN 'Denver'
    WHEN id = 10 THEN 'Atlanta'
    WHEN id = 11 THEN 'Ho Chi Minh City'
    WHEN id = 12 THEN 'Ha Noi'
    -- Add more cases as needed
    ELSE ''
    END
WHERE id BETWEEN 1 AND 12;

SELECT * FROM myTable;