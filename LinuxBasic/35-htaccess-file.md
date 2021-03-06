# Cách sử dụng file .htaccess trong Apache

Mặc định trong Apache sẽ có một file tên là .htaccess. File .htaccess này có tác dụng thay đổi truy cập mà không làm ảnh hưởng đến cấu hình.

Nếu như trong Apache không có sẵn .htaccess ta cũng có thể tạo một file

Trước khi bắt đầu, ta phải cho phép Apache đọc file .htaccess. Truy cập vào file:
```
vi /etc/httpd/conf/httpd.conf

```
Tìm đến đoạn cấu hình cho thư mục /var/www/html và thay đổi cấu hình AllowOverride None thành AllowOverride All.

### 1. Cấu hình từ non-www sang www
- Redirect non-www to www:
```
RewriteEngine On
RewriteBase /
RewriteCond %{HTTP_HOST} ^zaraoder.xyz[NC]
RewriteRule ^(.*)$ http://www.zaraoder.xyz/$1 [L,R=301]
```
Như vậy bất kỳ lúc nào bạn thao tác với tên miền http://zaraoder.xyz sẽ tự động chuyển thành http://www.zaraoder.xyz

Sau đó lưu lại, sử dụng lệnh curl để kiểm tra:
```
[root@mail zaraoder]# curl -I https://zaraoder.xyz
```

![anh1](https://image.prntscr.com/image/k795nfVYRfioBWeDT8o2zg.png)

### 2. Cấu hình từ www sang non-www
- Khai báo nội dung sau vào file .htaccess
```
RewriteEngine On
RewriteBase /
RewriteCond %{HTTP_HOST} ^www.zaraoder.xyz [NC]

RewriteRule ^(.*)$ http://zaraoder.xyz/$1 [L,R=301]
```
Như vậy bất kỳ lúc nào bạn thao tác với tên miền http://www.zaraoder.xyz sẽ tự động chuyển thành http://zaraoder.xyz

Sau đó lưu lại và kiểm tra. Kết quả:
```
curl -I http://www.zaraoder.xyz
``` 
![anh2](https://image.prntscr.com/image/JwA40MOmSXWA3X1kkoSYcA.png)

Tài liệu tham khảo :

https://kienthuc.pavietnam.vn/article/Linux-Hosting/Huong-dan-Thu-thuat/Chuyen-huong-ten-mien-Redirecting-www-to-non-www-su-dung-.htaccess-va-nguoc-lai.html

https://hostpresto.com/community/tutorials/how-to-use-htaccess-with-apache/
