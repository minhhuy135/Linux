# Cách sử dụng file .htaccess trong Apache

File .htaccess là file dùng để quản lý cách mà web server Apache sẽ xử lý các request của website. Các cấu hình bên trong file .htaccess sẽ được “override” các cấu hình trong “httpd.conf” của website đó, vì vậy để htaccess hoạt động được, chúng ta cần phải cho phép “AllowOverride all” tại block config của website đó.

Mặc định trong Apache sẽ có một file tên là .htaccess. File .htaccess này có tác dụng thay đổi truy cập mà không làm ảnh hưởng đến cấu hình.

Nếu như trong Apache không có sẵn .htaccess ta cũng có thể tạo một file

Trước khi bắt đầu, ta phải cho phép Apache đọc file .htaccess. Truy cập vào file:
```
vi /etc/httpd/conf/httpd.conf
```
Tìm đến đoạn cấu hình cho thư mục /var/www/html và thay đổi cấu hình AllowOverride None thành AllowOverride All.