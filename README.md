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
* 1 Database có 1 hoặc nhiều bảng, 1 bảng được xem là 1 `quan hệ` (Relation).
* 1 Bảng có các `bản ghi` (Row) và các `trường` (Column), như trong ví dụ này:
  
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

## Data Normalization
Chuẩn hóa dữ liệu (Data Normalization) là quá trình tổ chức dữ liệu trong cơ sở dữ liệu để giảm thiểu sự dư thừa và phụ thuộc không cần thiết.

Có 4 mức chuẩn hóa phổ biến: `First Normal Form (1NF)`, `Second Normal Form (2NF)`, `Third Normal Form (3NF)`, `BCNF (Boyce – Codd Normal Form)`; mỗi mức độ chuẩn hóa nên được thực hiện <b>theo thứ tự tăng dần</b>.

### First Normal Form (1NF)
Đảm bảo rằng tất cả các cột trong bảng đều chứa các giá trị nguyên tố (atomic values), nghĩa là mỗi cột chỉ chứa một giá trị đơn lẻ cho mỗi hàng.

| id | name | subject |
|--|--|--|
| 1 | John | Math, Science, Literature |
| 2 | Alice | English, History, Spanish |

Sau khi được chuẩn hoá 1NF thì sẽ được: 
| id | name | subject |
|--|--|--|
| 1 | John | Math |
| 1 | John | Science |
| 1 | John | Literature |
| 2 | Alice | English |
| 2 | Alice | History |
| 2 | Alice | Spanish |

### Second Normal Form (2NF)
Loại bỏ các phụ thuộc một phần vào khóa chính, tức là mỗi cột không phải khóa chính chỉ phụ thuộc vào toàn bộ khóa chính. Phải đạt được 1NF trước khi tới 2NF.

Ví dụ ta có bảng sau:

| id | name | subject | subject_id |
|--|--|--|--|
| 1 | John | Math | S1 |
| 1 | John | Science | S2 |
| 1 | John | Literature | S3 |
| 2 | Alice | English | S4 |
| 2 | Alice | History | S5 |
| 2 | Alice | Spanish | S6 |

Chúng ta tạo ra thêm các bảng để loại bỏ các phụ thuộc một phần và đảm bảo rằng các thuộc tính chỉ phụ thuộc vào khóa chính:

Bảng <b>Students</b>:
| `id` | name |
|--|--|
| 1 | John |
| 2 | Alice |

Bảng <b>Subjects</b>:
| `subject_id` | subject |
|--|--|
| S1 | Math |
| S2 | Science |
| S3 | Literature |
| S4 | Alice |
| S5 | English |
| S6 | Spanish |

Bảng <b>Students_Subjects</b>:
| `id` | `subject_id` |
|--|--|
| 1 | S1 |
| 1 | S2 |
| 1 | S3 |
| 2 | S4 |
| 2 | S5 |
| 2 | S6 |

Bảng <b>Student_Subjects</b> đóng vai trò như một bảng liên kết giữa hai bảng chính là <b>Students</b> và <b>Subjects</b>.

### Third Normal Form (3NF)
Loại bỏ các phụ thuộc bắc cầu (transitive dependencies), nghĩa là các cột không phải khóa chính không phụ thuộc vào các cột không phải khóa chính khác.

Ví dụ, ta có bảng sau:

| id | first_name | last_name | subject | subject_id |
|--|--|--|--|--|
| 1 | John | Doe | Math | S1 |
| 1 | John | Doe | Science | S2 |
| 1 | John | Doe | Literature | S3 |
| 2 | Alice | Heard | English | S4 |
| 2 | Alice | Heard | History | S5 |
| 2 | Alice | Heard | Spanish | S6 |

Bảng <b>Students</b>:
| id | first_name | last_name |
|--|--|--|
| 1 | John | Doe |
| 2 | Alice | Heard |

Bảng <b>Subjects</b>:
| `subject_id` | subject |
|--|--|
| S1 | Math |
| S2 | Science |
| S3 | Literature |
| S4 | Alice |
| S5 | English |
| S6 | Spanish |

Bảng <b>Students_Subjects</b>:
| `id` | `subject_id` |
|--|--|
| 1 | S1 |
| 1 | S2 |
| 1 | S3 |
| 2 | S4 |
| 2 | S5 |
| 2 | S6 |

Bảng <b>Student_Subjects</b> đóng vai trò như một bảng liên kết giữa hai bảng chính là <b>Students</b> và <b>Subjects</b>.

### BCNF (Boyce – Codd Normal Form)
Dạng chuẩn Boyce–Codd (hoặc BCNF hoặc 3.5NF) khá giống 3NF (Tự tìm hiểu kĩ).


## Join
Join được dùng để kết hợp các hàng (rows) từ hai hoặc nhiều bảng dựa trên một điều kiện chung, giúp bạn truy vấn và lấy dữ liệu từ nhiều bảng mà có liên quan đến nhau thông qua các khóa chính (primary keys) và khóa ngoại (foreign keys).
### Inner Join
Inner Join được dùng để trả về tất cả các hàng khi có ít nhất một giá trị ở cả hai bảng.

![image](https://github.com/homanhquan1812/SQL/assets/130955957/d5a27f6a-7b16-4216-af5c-7ca3a0a23b4f)
### Left Join (Left Outer Join)
Left Join được dùng để trả lại tất cả các dòng từ bảng bên trái, và các dòng đúng với điều kiện từ bảng bên phải.

![image](https://github.com/homanhquan1812/SQL/assets/130955957/7c19e76f-b48e-4955-abca-5638bf5ea526)
### Right Join (Right Outer Join)
Right Join được dùng để trả lại tất cả các hàng từ bảng bên phải, và các dòng thỏa mãn điều kiện từ bảng bên trái.

![image](https://github.com/homanhquan1812/SQL/assets/130955957/b66d14a3-d113-4936-aa39-efb3e5c93dce)

### Outer Join (Full Outer Join)
Outer Join được dùng để trả về tất cả các dòng đúng với 1 trong các bảng.

![image](https://github.com/homanhquan1812/SQL/assets/130955957/96afea03-def7-4445-8e6c-3f27176ae58e)

# Some tips when using Databases
* Phải có **dấu chấm phẩy ";"** cuối câu.
 * Sau khi dùng lệnh gì xong cũng phải **REFRESH** lại Database để phần mềm cập nhật lại những gì đã sửa đổi.
 * Ta có thể dùng chữ hoa hoặc chữ thường để viết lệnh (Khuyến nghị dùng **chữ hoa**).
 * Sau khi thực thi **(Execute)** lệnh SQL Query, cần **xóa ngay những dòng lệnh đã dùng trước đó**.
