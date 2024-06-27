/*
 * Cơ sở dữ liệu (Database): Là tập hợp các dữ liệu có tổ chức. VD: 1 trường học có thể là tập hợp các dữ liệu
 * như: Hồ sơ sinh viên, giảng viên,...
 *
 * Cơ sở dữ liệu quan hệ (Relational Database): Ở đây, dữ liệu được tổ chức dưới dạng bảng. 1 bảng thường chứa
 * hàng (Row) và cột (Column). Bảng có 1 khóa (Key) duy nhất để xác định từng hàng của bảng.
 * 
 * SQL (Structured Query Language): Là 1 ngôn ngữ truy vấn dùng để tương tác với RDBMS (Relational Database
 * Management System) - Hệ quản trị cơ sở dữ liệu quan hệ. VD về các Database dùng SQL: MySQL, Oracle, PostgreSQL,...
 *
 * SQL còn được sử dụng để thực hiện các hoạt động CRUD trên cơ sở dữ liệu quan hệ.
 *
 * Ta còn có thể sử dụng SQL để tạo bảng và dữ liệu trong Database bằng các câu lệnh SQL Query -> Thường được sử dụng
 * để truy vấn và thao tác dữ liệu trong Database.
*/ 

-- Đầu tiên ta phải tạo Query để viết lệnh (Tự tìm hiểu cách tạo trong SQL Database ta dùng).

-- Tạo Database
CREATE DATABASE myDatabase;

-- Nếu ta muốn xóa database này, dùng:
DROP DATABASE myDatabase;

/*
 * Luư ý:
 * - Phải có dấu chấm phẩy ";" cuối câu.
 * - Sau khi dùng lệnh gì xong cũng phải REFRESH lại Database để phần mềm cập nhật lại những gì đã sửa đổi.
 * - Ta có thể dùng chữ hoa hoặc chữ thường để viết lệnh (Khuyến nghị dùng chữ hoa).
 * - Sau khi thực thi (Execute) lệnh SQL Query, cần xóa ngay những dòng lệnh đã dùng trước đó.
*/

-- Muốn dùng database nào trong Query, ta dùng:
USE myDatabase;
-- Lệnh này không cần thiết nếu ta dùng Query của chính Database ta đang sử dụng, không phải Query chung.

-- Ta sẽ dùng Microsoft SQL Server suốt cả bài giảng.