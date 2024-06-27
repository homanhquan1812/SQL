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