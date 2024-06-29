# General Knowledge
## Database
Cơ sở dữ liệu (Database): Là tập hợp các dữ liệu có tổ chức. VD: 1 trường học có thể là tập hợp các dữ liệu như: Hồ sơ sinh viên, giảng viên,...
## Relational Database
Cơ sở dữ liệu quan hệ (Relational Database): Ở đây, dữ liệu được tổ chức dưới dạng bảng. 1 bảng thường chứa hàng (Row) và cột (Column). Bảng có 1 khóa (Key) duy nhất để xác định từng hàng của bảng.
## SQL
SQL (Structured Query Language): Là 1 ngôn ngữ truy vấn dùng để tương tác với RDBMS (Relational Database Management System) - Hệ quản trị cơ sở dữ liệu quan hệ. VD về các Database dùng SQL (RDBMS): MySQL, Oracle, PostgreSQL,...

SQL còn được sử dụng để thực hiện các hoạt động CRUD trên cơ sở dữ liệu quan hệ

Ta còn có thể sử dụng SQL để tạo bảng và dữ liệu trong Database bằng các câu lệnh SQL Query -> Thường được sử dụng để truy vấn và thao tác dữ liệu trong Database.
## Columns & Rows
* 1 Database có 1 hoặc nhiều bảng, 1 bảng được xem là 1 quan hệ (Relation).
* 1 Bảng có các bản ghi (Dòng - Row) và các trường (Cột - Column), như trong ví dụ này:
  
  | id | first_name | job |
  |--|--|--|
  | 1 | Manh | Doctor |
  | 2 | Quan | Teacher |
  
  Trong ví dụ trên, ta có 2 bản ghi và 3 trường.
## Differences of Data Types among MySQL, PostgreSQL, and SQL Server
| MySQL | PostgreSQL | Microsoft SQL Server |   |
|:---:|:---:|:---:|---|
|TEXT|TEXT|TEXT|Dùng cho một chuỗi các ký tự không bị giới hạn về chiều dài.|
|VARCHAR|VARCHAR|VARCHAR|Lưu trữ chuỗi các ký tự không bị giới hạn chiều dài. Nhưng ta có thể giới hạn chiều dài bằng cách dùng VARCHAR(n) với n là số tự nhiên > 0.|
|CHAR|CHAR|CHAR|Như VARCHAR, nhưng khác ở chỗ CHAR(n), nếu độ dài < n thì sẽ lấp khoảng trống sau đó cho đến khi độ dài = n.|
|INTEGER/INT|INTEGER/INT|INTEGER/INT|Lưu số nguyên, phạm vi từ -2147483648 đến 2147483647.|
|`AUTO_INCREMENT`|`SERIAL`|`IDENTITY(a, b)`|Số thứ tự (Ở SQL Server thì số thứ tự xuất phát từ a và tăng dần theo b).|
|NUMERIC(a, b)/DECIMAL(a, b)|NUMERIC(a, b)/DECIMAL(a, b)|NUMERIC(a, b)/DECIMAL(a, b)|Số thập phân, a gồm các chữ số trước và sau dấu phẩy (thường a = 10), b là số chữ số cần được làm tròn sau dấu phẩy.|
|`BOOLEAN/BIT`|`BOOLEAN`|`BIT`|Boolean, thường là 1/True hoặc 0/False.|
|`DATETIME/TIMESTAMP`|`TIMESTAMP`|`DATETIME`|Lưu ngày tháng năm, giờ phút giây (2069-06-09 06:09:00).|

And many more.

## Constraints
Ràng buộc (Constraints) là các quy tắc được áp đặt trên dữ liệu trong bảng để đảm bảo tính toàn vẹn và nhất quán của dữ liệu, giúp ngăn chặn việc nhập dữ liệu không hợp lệ vào bảng và đảm bảo rằng các hoạt động trên dữ liệu tuân theo các quy tắc đã được xác định trước.

Các loại ràng buộc phổ biến là: <b>NOT NULL, NULL, UNIQUE, FOREIGN KEY, PRIMARY KEY, DEFAULT,...</b>

### Primary Key
Khóa chính (Primary Key) được dùng để xác định <b>DUY NHẤT</b> mỗi hàng trong một bảng. Một cột hoặc một tập hợp các cột (Composite Key) được chỉ định làm khóa chính sẽ đảm bảo rằng mỗi giá trị trong cột (hoặc kết hợp các giá trị trong các cột) là <b>duy nhất và không thể có giá trị NULL</b>. 

Composite Key thường được sử dụng nếu bạn cần nhiều cột làm khóa chính. VD: Giả sử bạn có một bảng orders với các cột <b>order_id, product_id, và quantity</b>. Trong bảng này, một <b>order_id</b> có thể xuất hiện nhiều lần (vì mỗi đơn hàng có thể chứa nhiều sản phẩm), và một <b>product_id</b> cũng có thể xuất hiện nhiều lần (vì một sản phẩm có thể có trong nhiều đơn hàng). Tuy nhiên, sự kết hợp của <b>order_id</b> và <b>product_id</b> phải là duy nhất để xác định duy nhất mỗi hàng trong bảng.

### Foreign Key
Khóa ngoại (Foreign Key) được sử dụng để thiết lập và thực thi mối quan hệ giữa các bảng. Khóa ngoại là một hoặc nhiều cột trong một bảng mà giá trị của nó phải khớp với giá trị của khóa chính trong bảng khác để duy trì tính toàn vẹn tham chiếu giữa các bảng trong cơ sở dữ liệu.

# Some tips when using Databases
* Phải có **dấu chấm phẩy ";"** cuối câu.
 * Sau khi dùng lệnh gì xong cũng phải **REFRESH** lại Database để phần mềm cập nhật lại những gì đã sửa đổi.
 * Ta có thể dùng chữ hoa hoặc chữ thường để viết lệnh (Khuyến nghị dùng **chữ hoa**).
 * Sau khi thực thi **(Execute)** lệnh SQL Query, cần **xóa ngay những dòng lệnh đã dùng trước đó**.
