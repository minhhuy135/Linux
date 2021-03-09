# Tìm hiểu về Query SQL

## 1. Khái niệm chung về SQL
### 1.1 SQL là gì?
SQL là một ngôn ngữ tiêu chuẩn để truy cập cơ sở dữ liệu (database). SQL là viết tắt của cụm từ Structured Query Language (Ngôn ngữ truy vấn cấu trúc). Cho phép bạn truy cập và thao tác với database. Ngoài ra, SQL là một tiêu chuẩn ANSI (American National Standards Institute- Viện tiêu chuẩn Quốc gia Mỹ).

### 1.2 SQL có thể làm gì?

- SQL có thể thực hiện những truy vấn với một cơ sở dữ liệu

- SQL có thể lấy data từ một cơ sở dữ liệu.

- SQL có thể insert (nhập) record vào một cơ sở dữ liệu

- SQL có thể update (cập nhật) record vào một cơ sở dữ liệu

- SQL có thể delete (xóa) record khỏi một cơ sở dữ liệu

- SQL có thể tạo cơ sở dữ liệu mới

- SQL có thể tạo bảng mới trong một cơ sở dữ liệu

- SQL có thể tạo phương thức tích trữ trong một cơ sở dữ liệu

- SQL có thể tạo những cái nhìn trong một cơ sở dữ liệu

- SQL có thể thiết lập (set) quyền cho bảng, phương thức và cái nhìn.

Trong bài viết này sẽ hướng dẫn các bạn cách sử dụng SQL để truy cập và thao tác data trong MySQL.

## 2.2 Mệnh đề SQL WHERE
- Mệnh đề WHERE được dùng để lọc các bản ghi.

- Mệnh đề WHERE được dùng để trích xuất ra chỉ các bản ghi thỏa mãn tiêu chí chỉ định.

- Cú pháp:
```
SELECT column_name,column_name

FROM table_name

WHERE column_name operator value;
```
- Lưu ý: SQL đòi hỏi dấu nháy đơn bao quanh giá trị text. (Rất nhiều hệ thống cho phép dấu nháy kép). Tuy nhiên, trường số thì không cần được bao quanh bởi dấu nháy.

## 2.3 Toán tử SQL AND & OR
- Toán tử AND & OR được dùng để lọc các bản ghi dựa vào 2 điều kiện trở lên.

- Toán tử AND thể hiện một bản ghi nếu cả điều kiện thứ nhất và điều kiện thứ 2 đều đúng.

- Toán tử OR thể hiện một bản ghi nếu điều kiện thứ nhất hoặc điều kiện thứ 2 đúng.

- Cú pháp toán tử AND

```
SELECT * FROM table_name

WHERE column_name 1 operator value

AND column_name 2 operator value;
```

- Cú pháp toán tử OR SELECT * FROM table_name
WHERE column_name operator value1

OR column_name operator value2;

- Kết hợp toán tử AND & OR
Bạn có thể kết hợp AND và OR (sử dụng ngoặc đơn để thể hiện biểu thức phức tạp).

### 2.4 Câu lệnh SQL ORDER BY bằng từ khóa
- ORDER BY bằng từ khóa được dùng để sắp xếp bộ kết quả theo một hoặc nhiều cột. ORDER BY bằng từ khóa sẽ sắp xếp các bản ghi theo trình tự mặc định là tăng dần. Để sắp xếp theo trình tự giảm dần thì chúng ta sử dụng từ khóa DESC.

- Cú pháp

```
SELECT column_name, column_name

FROM table_name

ORDER BY column_name ASC|DESC, column_name ASC|DESC;
```

## 2. Các câu lệnh SQL cơ bản
### 2.1 Câu lệnh SELECT
- Câu lệnh SELECT được dùng để lựa chọn dữ liệu từ một cơ sở dữ liệu. Kết quả được lưu trong một bảng kết quả và gọi là bộ kết quả.

- Cú pháp Lựa chọn tất cả:
```
SELECT * FROM table_name;
```
- Cú pháp lựa chọn từ các cột trong một bảng:
```
SELECT column_name,column_name FROM table_name;
```
## 2.2 Mệnh đề SQL WHERE
- Mệnh đề WHERE được dùng để lọc các bản ghi.

- Mệnh đề WHERE được dùng để trích xuất ra chỉ các bản ghi thỏa mãn tiêu chí chỉ định.

- Cú pháp:

SELECT column_name,column_name

FROM table_name

WHERE column_name operator value;

- Lưu ý: SQL đòi hỏi dấu nháy đơn bao quanh giá trị text. (Rất nhiều hệ thống cho phép dấu nháy kép). Tuy nhiên, trường số thì không cần được bao quanh bởi dấu nháy.

## 2.3 Toán tử SQL AND & OR
- Toán tử AND & OR được dùng để lọc các bản ghi dựa vào 2 điều kiện trở lên.

- Toán tử AND thể hiện một bản ghi nếu cả điều kiện thứ nhất và điều kiện thứ 2 đều đúng.

- Toán tử OR thể hiện một bản ghi nếu điều kiện thứ nhất hoặc điều kiện thứ 2 đúng.

- Cú pháp toán tử AND

```
SELECT * FROM table_name

WHERE column_name 1 operator value

AND column_name 2 operator value;
```

- Cú pháp toán tử OR SELECT * FROM table_name
WHERE column_name operator value1

OR column_name operator value2;

- Kết hợp toán tử AND & OR
Bạn có thể kết hợp AND và OR (sử dụng ngoặc đơn để thể hiện biểu thức phức tạp).

## 2.4 Câu lệnh SQL ORDER BY bằng từ khóa
- ORDER BY bằng từ khóa được dùng để sắp xếp bộ kết quả theo một hoặc nhiều cột. ORDER BY bằng từ khóa sẽ sắp xếp các bản ghi theo trình tự mặc định là tăng dần. Để sắp xếp theo trình tự giảm dần thì chúng ta sử dụng từ khóa DESC.

- Cú pháp

```
SELECT column_name, column_name

FROM table_name

ORDER BY column_name ASC|DESC, column_name ASC|DESC;
```
## 2.5 Câu lệnh INSERT INTO của SQL
- Câu lệnh INSERT INTO của SQL dùng để cho bản ghi mới vào trong một bảng.

- Có thể viết câu lệnh INSERT INTO bằng 2 cách.

  - Cách 1: Chỉ chỉ định giá trị, không chỉ định tên cột sẽ insert.
```
INSERT INTO table_name

VALUES (value1,value2,value3,...);
```
  - Cách 2: Chỉ định cả tên cột và giá trị sẽ insert.

```
INSERT INTO table_name (column1,column2,column3,...)

VALUES (value1,value2,value3,...);
```
## 2.6 Câu lệnh UPDATE
- Câu lệnh UPDATE được dùng để cập nhật bản ghi đã có trong một bảng.

- Cú pháp :

```
UPDATE table_name

SET column1=value1,column2=value2,...
```

## 2.7 Lệnh DELETE
- Được sử dụng để xóa hoàn toàn các bản ghi, nó có thể khá nguy hiểm nếu bị lạm dụng. Cú pháp của lệnh này khá đơn giản:

- Cú pháp
```
DELETE FROM table_name;
```
Câu lệnh trên sẽ xóa mọi thứ từ bảng . Nếu chỉ muốn xóa những bản ghi nhất định hãy sử dụng thêm WHERE:
```
 DELETE FROM table_name WHERE name = 'Joe'; 
 ```
## 2.8 CREATE TABLE
- Lệnh này được sử dụng để tạo bảng, và đây là cú pháp của nó:
```
CREATE TABLE people (
   name TEXT,
   age, INTEGER,
   PRIMARY KEY(name)
 );
 ```

Chú ý cách các tên cột, ràng buộc nằm trong ngoặc và gán kiểu dữ liệu cho cột được viết như thế nào. Khóa chính cũng cần được chỉ định, đây là yêu cầu đầu tiên của một thiết kế database chuẩn.

# 3. Câu lệnh SQL cơ bản sử dụng máy chủ cơ sở dữ liệu MariaDB

Đăng nhập vào MariaDB với tài khoản root
```
 mysql -u root -p 
```
Hiển thị toàn bộ users:
```
select user,host from mysql.user; 
```
![anh1](https://image.prntscr.com/image/dh35PJe3RumKAZOj0xQGfg.png)

- Xóa null user:
```
 DELETE FROM mysql.user WHERE user = ' '; 
```
- Xóa tất cả user mà không phải root:
```
DELETE FROM mysql.user WHERE NOT (host="localhost" AND user="root"); 
```

Đổi tên tài khoản root (giúp bảo mật):
```
UPDATE mysql.user SET user="mydbadmin" WHERE user="root"; 
```
![anh2](https://image.prntscr.com/image/ImB47on8SBa_l0bh0nzkbQ.png)

Tạo 1 user mới
```
create user 'user'@'hostname' identified by 'password'; 
```

- Tạo 1 user mới
```
 create user 'user'@'hostname' identified by 'password';
``` 
Gán full quyền cho user vừa tạo
```
 GRANT ALL PRIVILEGES ON *.* TO  'user'@'hostname';
```
Hiển thị các đặc quyền của user:
```
 SHOW GRANTS FOR 'user'@'hostname'; 
```

![anh3](https://image.prntscr.com/image/IXdjb_SDRKa5rpn7FbkPfw.png)

# Tạo database

```
 create database [database_name];
```
Ví dụ: create database test;

Xem danh sách database hiện có:
```
 show databases; 
```
![anh4](https://image.prntscr.com/image/y2U9ZphwQiKWEbK_ubxcUg.png)

- Truy cập vào cơ sở dữ liệu
```
 use  [database_name]; 
```

Ví dụ: tạo bảng có tên là sinhvien với các trường mssv,ho,ten,tuoi,diemthi trong database test
```
use testdb;
 create table sinhvien(
  mssv int not null auto_increment,
  ho varchar(255) not null,
  ten varchar(255) not null,
  tuoi int not null,
  diemthi float(4,2) not null,
  primary key (mssv)
  ); 
```
![anh5](https://image.prntscr.com/image/cJ_wScfMQmWAFy173WWIbQ.png)

Hiển thị toàn bộ table hiện có
```
 show tables; 
```

Xem thông tin trên bảng
```
 describe  [table_name]; 
```
![anh6](https://image.prntscr.com/image/rHlYz--KToyaDS6gow0-yQ.png)

Xóa bảng:
```
drop table  [table_name]; 

```
Tài liệu tìm hiểu :

https://news.cloud365.vn/thao-tac-quan-tri-mariadb-tren-centos-7/

https://quantrimang.com/13-cau-lenh-sql-quan-trong-programmer-nao-cung-can-biet-136595
