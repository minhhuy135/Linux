# Log các câu query chậm trên MySQL
## 1. Giới Thiệu

MySQL cho phép chúng ta có thể log lại các câu truy vấn tốn nhiều thời gian để thực hiện. Việc chạy một câu query tốn nhiều thời gian có thể do nguyên nhân dữ liệu lấy ra quá lớn. Tuy nhiên trong một số trường hợp khác thì việc chậm này đến từ nguyên nhân từ người viết câu query không thực hiện việc tối ưu hoá. Ví dụ như khi câu query truy vấn tìm kiếm từ bảng không được index hoặc sử dụng query lồng (nested query), thực hiện việc join nhiều bảng... Trên thực tế thì nguyên nhân thứ hai diễn ra rất phổ biến do khi phát triển ứng dụng thì các developer lại thường chính là những người viết các câu query SQL và không phải developer nào cũng rành về database. Do đó việc log các query chậm sẽ giúp chúng ta có thể kiểm tra và tìm nguyên nhân của việc query chạy chậm.

## 2. Cài đặt
Cài đặt trong file config của MySQL server. Cách này có ưu điểm ở chỗ bạn chỉ cần config một lần sau đó MySQL sẽ tự động log các query chậm tuy nhiên sẽ đòi hỏi bạn cần restart lại server. Chạy câu lệnh SQL sử dụng MySQL client. Cách này có ưu điểm là bạn không cần restart lại MySQL server nhưng lại có nhược điểm là chỉ áp dụng với session kết nối tới MySQL server hiện tại từ client nếu client này kết thúc session thì việc log query chậm cũng sẽ kết thúc.

### Các bước thực hiện
- Bước 1: Đăng nhập vào SSH bằng quyền root

- Bước 2: Chỉnh sửa cấu hình
Ta chỉnh cấu hình tại file /etc/my.cnf để bật chế độ Slow Query.
```
vi /etc/my.cnf
```

Thêm cấu hình sau vào file:
```
slow-query-log = 1
slow-query-log-file = /var/log/mysql/mysql-slow.log
long_query_time = 1
log-queries-not-using-indexes
```

Ý nghĩa của từng thiết lập phía trên:

- sql-query-log=1: Kích hoạt tính năng log các truy vấn chậm
- slow-query-log-file=...: Thiết lập vị trí file log.
- long_query_time=1: Quy định mốc thời gian mà ở đó một query được coi là chậm.
- log-queries-not-using-indexes: Log tất cả các query chậm không sử dụng index ngay cả khi query này không vượt quá mốc log_query_time ở trên.

## Bước 3: Tạo file log và gán quyền cho user mysql
Với việc cấu hình trên, ta phải tạo file log tại đường dẫn /var/log/mysql/slow-query.log mới có thể thành công được. Sau đó gán quyền truy cập cho user mysql
```
touch /var/log/slow-query.log
chown mysql:mysql /var/log/slow-query.log
```
## Bước 4: Khởi động lại MySQL hoặc MariaDB
```
sudo /etc/init.d/mysql restart
hoặc
sudo systemctl restart mysql
hoặc
sudo systemctl restart mysqld
```

### Kiểm tra log slow query
Hiển thị tất cả các bản ghi Slow query, ta sử dụng lệnh mysqldumpslow:
mysqldumpslow -a /var/log/slow-query.log

![anh1](https://image.prntscr.com/image/MMs-yAxYQhCoQ4DSdYryZw.png)

Xem slow query log:
sudo tail -f /var/log/mysql/mysql-slow.log
![anh2](https://image.prntscr.com/image/0SXQQ6dATAGHCCXxX_UJcw.png)

Tài liệu tham khảo

https://viblo.asia/p/log-cac-cau-query-cham-tren-mysql-V3m5WbJylO7

https://viblo.asia/p/log-cac-cau-query-cham-tren-mysql-V3m5WbJylO7