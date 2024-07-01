-- Update bản ghi
UPDATE myTable2
SET first_name = 'Rename - ' || first_name 
WHERE LENGTH(first_name) = 4; -- Ta dùng dấu khác là <>, không phải !=
-- Không bắt buộc phải dùng WHERE

SELECT * FROM myTable2;

-- Update các bản ghi từ 1 cột này bằng bản ghi từ 1 cột khác
CREATE TABLE UPDATE1 (
    id SERIAL PRIMARY KEY,
    name TEXT,
    schoolID TEXT,
    school TEXT
);

INSERT INTO UPDATE1 (name, schoolID, school) VALUES
('Manh Quan', 'ID1', NULL),
('Sussy Boy', 'ID2', NULL);

CREATE TABLE UPDATE2 (
    id SERIAL PRIMARY KEY,
    schoolID TEXT,
    school TEXT
);

INSERT INTO UPDATE2 (schoolID, school) VALUES
('ID1', 'HCMUT'),
('ID2', 'Among Us');

UPDATE UPDATE1
SET school = UPDATE2.school FROM UPDATE2
WHERE UPDATE1.schoolID = UPDATE2.schoolID; 

SELECT * FROM UPDATE1; -- NULL sẽ được thay 

--==============================================================================

-- Xóa các bản ghi
DELETE FROM myTable2 WHERE id BETWEEN 1 AND 3;

SELECT * FROM myTable2;

--==============================================================================

-- Xóa các bản ghi và vẫn giữ bảng
TRUNCATE TABLE UPDATE1, UPDATE2;

--==============================================================================

-- Để xóa dữ liệu khỏi bảng chính và tất cả các bảng có tham chiếu khóa ngoại đến bảng chính, 
-- bạn sử dụng tùy chọn CASCADE như sau: TRUNCATE TABLE tên_bảng CASCADE;
-- Đọc kĩ cách sử dụng CASCADE.