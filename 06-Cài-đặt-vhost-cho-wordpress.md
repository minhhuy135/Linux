# Cài vhost thay đổi tên ip thành tên miền

Khi ta cấu hình LAMP Song
![anh1](https://image.prntscr.com/image/Dd1kj51ZTguA0NCYdIkoqQ.png)

## 1. Cấu hình Virtual Host

- Tạo Folder chứa code cho 1 website huydm.local(với tuỳ chọn-p cho phép ta tạo ra những thư mục con lồng trong nó)

```
sudo mkdir -p /var/www/huydm
```
Chỉnh sửa quyền truy cập sao cho quyền đọc được chấp nhận với tất cả các file và thư mục bên trong /var/www
```
sudo chmod -R 755 /var/www
```
Tạo ra file index.html đơn giản cho 1 website để kiểm thử hoạt động của Virtual host.
```
# touch /var/www/web1/index.html

# echo "<center><h1>This is website huydm.local</h1></center>" > /var/www/huydm/index.html
```
Tạo 2 thư mục lưu trữ File cấu hình Virtual host cho apache:
```
# sudo mkdir /etc/httpd/sites-available

# sudo mkdir /etc/httpd/sites-enabled
```
Trong đó:

- sites-available chứa các cấu hình Virtual host có trên hệ thống.
- sites-enabled chứa các cấu hình Virtual host được kích hoạt để chạy.

Cấu Apache nhận cấu hình những virtual host trongsites-enabled .
```
vi /etc/httpd/conf/httpd.conf
```
Thêm dòng sau vào cuối file:
```
IncludeOptional sites-enabled/*.conf
```
![anh2](https://image.prntscr.com/image/YZRpruFfQFCJUt62EVtM3Q.png)

Lưu lại và thoát.

Tạo File Virtual host cho huydm.local :
```
vi /etc/httpd/sites-available/huydm.local.conf
```
Thêm nội dung sau vào file:
```
<VirtualHost *:80>
       ServerAdmin admin@huydm.local
       ServerName huydm.local
       ServerAlias www.huydm.local
       DocumentRoot /var/www/huydm
       DirectoryIndex index.php index.html
       ErrorLog /var/www/huydm/error.log
       CustomLog /var/www/huydm/requests.log combined
</VirtualHost>

```
Lưu lại và thoát.

Trong đó:

- ServerAdmin khai báo email của quản trị viên.
- ServerName khai báo domain mà website sẽ lắng nghe.
- ServerAlias  (tuỳ chọn) khai báo Alias của domain, thương là www.
- DirectoryIndex loại file sẽ được tìm đến để khởi chạy.
- DocumentRoot khai báo đường dẫn chứa code của website.
- ErrorLog và CustomLog khai báo đường dẫn lưu file log của website.

1. Access log

Có chức năng ghi lại những lần sử dụng, truy cập đến web site của mình
2. Error log

 Ghi lại các cảnh báo các lỗi xảy ra với dịch vụ liên quan đến web sever.

Kích hoạt Virtual host

Như đã để cập ở trên, Apache sẽ chỉ nhận những cấu hình Virtual host trong thư mục sites-enabled. vì vậy ta sẽ tạo một liên kết ( symbolic link) vào thư mục sites-enabled  của mỗi virtual host:
```
sudo ln -s /etc/httpd/sites-available/huydm.local.conf /etc/httpd/sites-enabled/huydm.local.conf
```
Restart Apache để lưu thay đổi.
```
service httpd restart
```
Lỗi :

![anh5](https://image.prntscr.com/image/huJyVfmFTQuzMV-TavJ13w.png)

kiểm tra apache ta thấy bị tắt

![anh7](https://image.prntscr.com/image/K7obWVw_Q4y3M6KT7_KtQg.png)

( `Kiểm tra Trạng thái SELinux` )

Để xem trạng thái SELinux hiện tại và chính sách SELinux đang được sử dụng trên hệ thống của bạn, hãy sử dụng sestatus lệnh:
```
# sestatus
```
![anh6](https://image.prntscr.com/image/75W0eZTrQiSPeN3TZ6AHGQ.png)

Tắt SELinux
```
sudo setenforce 0
```
Tuy nhiên chỉ thay đổi được thời gian chạy hiện tại

Để tắt vĩnh viễn SELinux trên hệ thống CentOS 7 của bạn, hãy làm theo các bước bên dưới:

Mở /etc/selinux/config tệp và đặt SELINUXmod thành disabled:


![anh9](https://image.prntscr.com/image/l4SdQJu0TiS5IQ7sT87sRw.png)

Lưu tệp và khởi động lại hệ thống CentOS của bạn bằng:
```
# shutdown -r now
```
Khởi động lại httpd
```
service httpd start
```
Khi hệ thống khởi động, hãy xác minh thay đổi bằng lệnh: sestatus

![anh10](https://image.prntscr.com/image/5uQ0N6XTSvOlvfU2xWIyzQ.png)

Kiểm tra hoạt động

Trên trình duyệt web của User, bạn vào huydm.local để kiểm tra 

Nếu ra nội dung như ta setup ban đầu thì đã thành công.

![anh3](https://image.prntscr.com/image/KGlqPzuZQ5i_taWhEjFgCg.png)

## 2. Cài đặt WordPress

Bước 1: Chuẩn bị.
Trước khi tiến hành cài đặt WordPress, bạn phải cài đặt bộ LAMP trên máy của bạn.

Bước 2: Tạo cơ sở dữ liệu và tài khoản cho WordPress

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
 GRANT ALL PRIVILEGES ON wordpress.* TO user@localhost IDENTIFIED BY 'pass';
 ```

Sau đó xác thực lại những thay đổi về quyền:
```

FLUSH PRIVILEGES;
```
Sau khi hoàn tất, thoát khỏi mariadb:

exit
Bước 3: Tải và cài đặt WordPress
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
Lưu ý: Bạn cần để ý tới thư mục đang lưu trữ file wordpress đang được tải xuống. Ở đây mình lưu tại thư mục /root.

Tiến hành giải nén file latest.tar.gz:
```
tar xvfz latest.tar.gz
```

Lưu ý: giải nén sẽ ra thư mục wordpress có đường dẫn /root/wordpress.

Copy các file trong thư mục WordPress tới đường dẫn /var/www/huydm như sau:
```
cp -Rvf /root/wordpress/* /var/www/huydm
```
Bước 4: Cấu hình WordPress

Ta di chuyển đường dẫn tới thư mục chứa các file cài đặt WordPress như sau:
```
cd /var/www/huydm
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

Bước 5: Hoàn tất phần cài đặt giao diện
Trên trình duyệt, gõ địa chỉ ip server trên thành url, trình duyệt sẽ xuất hiện như sau:

Bạn cần tiến hành phân quyền thư mục wordpress cho user apache để cho user này được phép tạo các thư mục và lưu các tệp tải lên. Trên của sổ terminal, ta gõ lệnh như sau:
```
#chown -R apache:apache /var/www/html/*

#chmod -R 755 /var/www/html/*

```

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
