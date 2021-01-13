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

![anh3](https://image.prntscr.com/image/4HTNr5l3QJyIUfx20pfiRA.png)

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
![anh5](https://image.prntscr.com/image/Oi8hktGrTo_3NFxpyWA5pQ.png)

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


