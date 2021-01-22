# Cách cài đặt ngăn xếp Linux, Nginx, MySQL, PHP (LEMP) trên CentOS 7

![anh2](https://image.prntscr.com/image/IeW3rOUkRq_zg55Kb54DEA.png)

## 1. Cài đặt Nginx
```
sudo yum install nginx
```
Sau khi cài đặt xong,khởi động nginx
```
sudo systemctl start nginx

sudo systemctl enable nginx
```
Tiêu đề tiếp theo để tìm hiểu địa chỉ IP công cộng của bạn là gì nếu bạn không có thông tin này đã sẵn sàng):

![anh3](https://image.prntscr.com/image/947eIZZQTru3NflO_qptqw.png)

Cài đặt gói hỗ trợ php
```
yum -y install php-fpm
```

## 2. Cài đặt MariaDB
```
sudo yum install mariadb-server mariadb
```
Khởi động mariadb
```
sudo systemctl start mariadb

sudo systemctl enable mariadb
```
Chạy một tập lệnh bảo mật sẽ loại bỏ một số mặc định nguy hiểm và khóa quyền truy cập vào cơ sở dữ liệu của chúng tôi. Bắt đầu tập lệnh tương tác bằng cách chạy:

```
sudo mysql_secure_installation
```
![anh3](https://image.prntscr.com/image/P0WvDOOLSASKrLiV2z___g.png)

## 3. Cài đặt PHP

Cài đặt php Phiên bản có sẵn trong repo của CentOS đang là 5.4. Phiên bản này khá cũ và sẽ khiến bạn gặp một số vấn đề xảy ra khi tiến hành cài đặt wordpress. Vì vậy bạn cần phải cài đặt phiên bản 7x để khắc phục. Bạn cần tiến hành thêm kho vào Remi CentOS:

Cài đặt Remi
```
 yum install epel-release yum-utils -y

 yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y
 ```
 Cài yum-utils vì chúng ta cần tiện ích yum-config-manager để cài đặt:
```
yum -y install yum-utils
```
Bản 7.2:
```
yum-config-manager --enable remi-php72

yum -y install php php-opcache php-mysql
```
Sau khi cài đặt xong, thực hiện restart lại nginx
```
systemctl restart nginx
```
Để xác nhận rằng PHP có sẵn dưới dạng phiên bản bạn đã chọn, hãy chạy:
```
php --version
```
![anh4](https://image.prntscr.com/image/mzQKsTBZTGy1hzTUIVQ5-Q.png)

Mở /etc/php-fpm.d/www.conftệp cấu hình bằng cách sử dụng vi hoặc trình chỉnh sửa bạn chọn:
```
vi/etc/php-fpm.d/www.conf
```
![anh5](https://image.prntscr.com/image/CceotYbzQ3CvrxiHUIaRvw.png)

Đầu tiên, hãy mở một tệp mới trong /etc/nginx/conf.dthư mục:
```
vi /etc/nginx/conf.d/zaraoder.conf

 ```
Sao chép khối định nghĩa máy chủ PHP sau vào tệp cấu hình của bạn và đừng quên thay thế lệnh server_nameđể nó trỏ đến tên miền hoặc địa chỉ IP của máy chủ của bạn:

```
server {
    listen       80;
    server_name  zaraoder.xyz;

    root   /var/www/zaraoder;
    index index.php index.html index.htm;

    location / {
        try_files $uri $uri/ =404;
    }
    error_page 404 /404.html;
    error_page 500 502 503 504 /50x.html;

    location = /50x.html {
        root /usr/share/nginx/html;
    }

    location ~ \.php$ {
        try_files $uri =404;
        fastcgi_pass unix:/var/run/php-fpm/php-fpm.sock;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }
}
```
Tạo thư mục để chạy web
```
mkdir -p /var/www/zaraoder

```
Tạo 1 file index.html chạy thử
```
vi index.html
```
Cấp quyền user và group nginx cho nó
```
chown -R nginx:nginx /var/www/zaraoder
```
Tiếp theo, khởi động lại Nginx để áp dụng các thay đổi:
```
 systemctl restart nginx
```

Ta lên web gõ zaraoder.xyz sẽ hiển thị trang html đã tạo

![anh6](https://image.prntscr.com/image/y8lhNU3fTfKb6-qX41gRMA.png)

## 4. Cài đặt WordPress

Bước 1: Chuẩn bị. Trước khi tiến hành cài đặt WordPress, bạn phải cài đặt bộ LEMP trên máy của bạn.

Bước 2: Tạo cơ sở dữ liệu và tài khoản cho WordPress

Ở bước chuẩn bị, mình đã cài mariadb cho cơ sở dũ liệu. Bạn cũng có thể thao tác tương tự với MySQL. Đầu tiên, ta cần đăng nhập vào tài khoản root của cơ sở dữ liệu bằng câu lệnh
```
CREATE DATABASE wordpress;
```
Bạn cần tạo một tài khoản riêng để quản lí cơ sở dữ liệu cho WordPress. Trong bài mình sẽ đặt tên cho tài khoản là user và mật khẩu là pass, như sau:
```
CREATE USER huydm@localhost IDENTIFIED BY 'Huy@1234';
```
Tiến hành cấp quyền quản lí cơ sở dữ liệu wordpress cho user mới tạo.
```
GRANT ALL PRIVILEGES ON wordpress.* TO huydm@localhost IDENTIFIED BY 'Huy@1234';
 ```
Sau đó xác thực lại những thay đổi về quyền:

```
FLUSH PRIVILEGES;
```
Sau khi hoàn tất, thoát khỏi mariadb:

## 5. Tải và cài đặt WordPress Trước khi bắt đầu tiến hành cài gói hỗ trợ php-gd:
```
yum -y install php-gd
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

Copy các file trong thư mục WordPress tới đường dẫn /var/www/zaraoder như sau:
```
cp -Rvf /root/wordpress/* /var/www/zaraoder
```
Bước 4: Cấu hình WordPress

Ta di chuyển đường dẫn tới thư mục chứa các file cài đặt WordPress như sau:
```
cd /var/www/zaraoder
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

![anh10](https://image.prntscr.com/image/GcUEZoEqSnCUSNx9r-WHiw.png)

ta truy cập vào web sẽ hiển thị ra

![anh11](https://image.prntscr.com/image/LdR8SvE2Qaa8jTx6TEHriA.png)

# Cách bảo mật Nginx bằng  SSL Let's Encrypt trên CentOS 7

Tài liệu tham khảo

1. https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-centos-7