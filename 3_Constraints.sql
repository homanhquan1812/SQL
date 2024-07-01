-- Ví dụ về UNIQUE
ALTER TABLE myTable ADD CONSTRAINT unique_id UNIQUE (id); -- unique_id là tên của Constraint (Bắt buộc phải có tên)

SELECT * FROM myTable;

--==============================================================================

-- Ví dụ về PRIMARY KEY
CREATE TABLE myTable3 (
    id SERIAL PRIMARY KEY, -- id là khóa chính
    first_name VARCHAR(50) NOT NULL,
    job VARCHAR(50) NOT NULL,
    age INT NOT NULL
);

INSERT INTO myTable3(first_name, job, age)
VALUES 
    ('Manh', 'Doctor', 23),
    ('Quan', 'Teacher', 24),
    ('Alice', 'Doctor', 34),
    ('Bob', 'Engineer', 24),
    ('Charlie', 'Teacher', 27);

SELECT * FROM myTable3;


-- Ví dụ về COMPOSITE KEY
CREATE TABLE enrollment (
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    PRIMARY KEY (student_id, course_id) -- 2 cột cùng nhau tạo thành khóa chính
);

INSERT INTO enrollment (student_id, course_id, enrollment_date) VALUES
(1, 101, '2023-01-15'),
(1, 102, '2023-01-16'),
(2, 101, '2023-01-17'),
(2, 103, '2023-01-18'),
(3, 101, '2023-01-19'),
(3, 104, '2023-01-20');

SELECT * FROM enrollment;

INSERT INTO enrollment (student_id, course_id, enrollment_date) VALUES
(1, 101, '2023-01-21'); -- Lỗi vì sự kết hợp (1, 101) đã tồn 

--==============================================================================

-- Ví dụ về FOREIGN KEY
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO departments (department_id, department_name) VALUES
(1, 'Human Resources'),
(2, 'Finance'),
(3, 'Engineering');

INSERT INTO employees (employee_id, first_name, last_name, department_id) VALUES
(101, 'John', 'Doe', 1),
(102, 'Jane', 'Smith', 2),
(103, 'Emily', 'Davis', 3);

SELECT * FROM employees;

INSERT INTO employees (employee_id, first_name, last_name, department_id) VALUES
(104, 'Michael', 'Brown', 4); -- Lỗi vì không có department_id là 4 trong bảng departments

--==============================================================================

-- Ví dụ về CHECK
CREATE TABLE employees2 (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR (50),
    last_name VARCHAR (50),
    age INT,
    candy_brought INT,
    birth_date DATE CHECK (birth_date > '1900-01-01'),
    joined_date DATE CHECK (joined_date > birth_date),
    salary NUMERIC CHECK(salary > 0)
);

INSERT INTO employees2 (first_name, last_name, age, candy_brought, birth_date, joined_date, salary)
VALUES ('John', 'Doe', 23, 50, '1972-01-01', '2015-07-01', -100000); -- Error

INSERT INTO employees2 (first_name, last_name, age, candy_brought, birth_date, joined_date, salary)
VALUES ('John', 'Doe 2', 31, 40, '1972-01-01', '2015-07-01', 100000);

-- Thêm Constraint CHECK vào
ALTER TABLE employees2 ADD CONSTRAINT age_and_candy_check CHECK ( 
	age > 30 AND candy_brought > 30
);

SELECT * FROM employees2;

-- Vẫn còn nhiều Constraint khác, tự tìm hiểu
