WordPress là một hệ thống quản lí nội dung miễn phí và mã nguồn mở phổ biến Bài viết này sẽ hướng dẫn bạn cách cài đặt WordPress trên máy CentOS.

1. Tổng quan
WordPress là một hệ thống quản lí nội dung miễn phí và mã nguồn mở xây dựng dựa trên PHP và MySQL. Được phát hành vào năm 2003, đến nay WordPress đã trở thành một trong những hệ thống quản lí website phổ biến nhất thế giới 

![anh1](https://image.prntscr.com/image/Kklyw8BGQ7OU7nrMkW1efA.png)

2. Các bước cài đặt

## Bước 1: Chuẩn bị.

Trước khi tiến hành cài đặt WordPress, bạn phải cài đặt bộ LAMP trên máy của bạn.

## Bước 2: Tạo cơ sở dữ liệu và tài khoản cho WordPress

Ở bước chuẩn bị, mình đã cài mariadb cho cơ sở dũ liệu. Bạn cũng có thể thao tác tương tự với MySQL. Đầu tiên, ta cần đăng nhập vào tài khoản root của cơ sở dữ liệu bằng câu lệnh

```
mysql -u root -p
```
Bạn cần nhập password mà bạn đã thiết lập lúc cài đặt mariadb. Khi nhập xong, terminal sẽ chuyển sang mariadb.

Tiếp theo bạn sẽ tạo cơ sở dữ liệu cho wordpress. Bạn có thể sử dụng một cái tên bất kì. Trong bài, mình sẽ đặt tên là wordpress.
```
CREATE DATABASE wordpress;
```
Bạn cần tạo một tài khoản riêng để quản lí cơ sở dữ liệu cho WordPress. Trong bài mình sẽ đặt tên cho tài khoản là user và mật khẩu là pass, như sau:
```
CREATE USER user@localhost IDENTIFIED BY 'pass';
```
Tiến hành cấp quyền quản lí cơ sở dữ liệu wordpress cho user mới tạo.
```
# GRANT ALL PRIVILEGES ON wordpress.* TO user@localhost IDENTIFIED BY 'pass';
```
Sau đó xác thực lại những thay đổi về quyền:
```
FLUSH PRIVILEGES;
```
Sau khi hoàn tất, thoát khỏi mariadb:
```
exit
```

# Bước 3: Tải và cài đặt WordPress
Trước khi bắt đầu tiến hành cài gói hỗ trợ php-gd:
```
yum -y install php-gd
```
Tiến hành tải wget.
```

yum install wget 
```
Tiến hành tải xuống WordPress với phiên bản mới nhất.
```
wget http://wordpress.org/latest.tar.gz
```
`Lưu ý: Bạn cần để ý tới thư mục đang lưu trữ file wordpress đang được tải xuống. Ở đây mình lưu tại thư mục /root.`

Tiến hành giải nén file latest.tar.gz:
```
tar xvfz latest.tar.gz
```
`Lưu ý: giải nén sẽ ra thư mục wordpress có đường dẫn /root/wordpress.`

Copy các file trong thư mục WordPress tới đường dẫn /var/www/html như sau:
```
cp -Rvf /root/wordpress/* /var/www/html
```
Bước 4: Cấu hình WordPress

Ta di chuyển đường dẫn tới thư mục chứa các file cài đặt WordPress như sau:
```
cd /var/www/html
```
File cấu hình wordpress là wp-config.php. Tuy nhiên tại đây chỉ có file wp-config-sample.php. Tiến hành copy lại file cấu hình như sau:
```
cp wp-config-sample.php wp-config.php
```
Mở file config với vi để sửa:
```
vi wp-config.php
```
Trong file này, ta tìm tới dòng như hình dưới đây.

![anh2](https://image.prntscr.com/image/4Dk_xVFPRcKGOYHuhIF1MA.png)

Tiến hành thay đổi thông tin cơ sở dũ liệu, tài khoản, mật khẩu như đã thiết lập ở bước 2. Ví dụ như sau:

![anh3](https://image.prntscr.com/image/KpIL0H3ETKScmav6r_dkHQ.png)

`Gõ ESC -> :wq để lưu và thoát khỏi chế độ chỉnh sửa.`

## Bước 5: Hoàn tất phần cài đặt giao diện

Trên trình duyệt, gõ địa chỉ ip server trên thành url, trình duyệt sẽ xuất hiện như sau:

Bạn cần tiến hành phân quyền thư mục wordpress cho user apache để cho user này được phép tạo các thư mục và lưu các tệp tải lên. Trên của sổ terminal, ta gõ lệnh như sau:

```
#chown -R apache:apache /var/www/html/*
#chmod -R 755 /var/www/html/*
```
Như vậy là bạn đã có thể tiến hành upload ảnh và đăng bài viết lên trang wordpress của bạn.

# II. Tăng dung lượng file upload trong WordPress

Sửa file php.ini

Ta kiểm tra file php.ini gốc ở đâu

![anh4](https://image.prntscr.com/image/JLRfnDCoQxmnqD73auv44Q.png) 

khi ta đã biết đường dẫn ta vào file /etc/php.ini

![anh5](https://image.prntscr.com/image/GbTlO3fPR_GrazraW-Cndg.png)

*note
``` 
upload_max_filesize = 64M
post_max_size = 64M
max_execution_time = 300
```
![anh6](https://image.prntscr.com/image/NB-ECuunTyCnAektO3WWxQ.png)
