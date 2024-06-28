-- Tạo Table
CREATE TABLE myTable (
    id SERIAL PRIMARY KEY, 
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

--==============================================================================

-- Thêm 1 cột vào Table với DEFAULT (Mặc định => Các bản ghi có cùng nội dung)
-- Thực thi 2 dòng này trước rồi tới các dòng khác
ALTER TABLE myTable ADD married BOOLEAN DEFAULT true;
ALTER TABLE myTable ADD city TEXT DEFAULT 'Ho Chi Minh City';

SELECT * FROM myTable;