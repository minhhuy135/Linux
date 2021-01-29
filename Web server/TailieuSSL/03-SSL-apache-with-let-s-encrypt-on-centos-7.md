# Cách bảo mật Apache bằng Let's Encrypt trên CentOS 7

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

# II. khi cài song lamp song cài wordpress lên rồi ta cài ssl

- Bước 1 - Cài đặt Certbot Let's Encrypt Client

Để thêm kho lưu trữ CentOS 7 EPEL, hãy chạy lệnh sau:

``` 
 yum install epel-release
 ```

 Bây giờ bạn có quyền truy cập vào kho lưu trữ, hãy cài đặt tất cả các gói được yêu cầu:

 ```
 sudo yum install certbot python2-certbot-apache mod_ssl
 ```

 Trong quá trình cài đặt, bạn sẽ được hỏi về việc nhập khóa GPG. Khóa này sẽ xác minh tính xác thực của gói bạn đang cài đặt. Để cho phép quá trình cài đặt kết thúc, hãy chấp nhận phím GPG bằng cách nhập yvà nhấn ENTERkhi được nhắc làm như vậy.

Với các dịch vụ này đã được cài đặt, bây giờ bạn đã sẵn sàng chạy Certbot và tìm nạp chứng chỉ của mình.

- Bước 2 - Lấy chứng chỉ

Bây giờ Certbot đã được cài đặt, bạn có thể sử dụng nó để yêu cầu chứng chỉ SSL cho miền của mình.

Để thực hiện cài đặt tương tác và lấy chứng chỉ chỉ bao gồm một tên miền, hãy chạy certbotlệnh với:
```
sudo certbot --apache -d zaraoder.xyz
```

Điều này chạy certbotvới --apacheplugin và chỉ định miền để định cấu hình chứng chỉ với -d cờ.

Nếu bạn muốn cài đặt một chứng chỉ hợp lệ cho nhiều tên miền hoặc tên miền phụ, bạn có thể chuyển chúng dưới dạng tham số bổ sung cho lệnh, gắn -dcờ cho từng tên miền hoặc tên miền phụ mới . Tên miền đầu tiên trong danh sách các tham số sẽ là miền cơ sở được Let's Encrypt sử dụng để tạo chứng chỉ. Vì lý do này, hãy chuyển tên miền cơ sở đầu tiên trong danh sách, theo sau là bất kỳ tên miền phụ hoặc bí danh bổ sung nào:

```
sudo certbot --apache -d zaraoder.xyz -d www.zaraoder.xyz

```

Miền cơ sở trong ví dụ này là zaraoder.xyz

Các certbottiện ích cũng có thể nhắc bạn cho thông tin tên miền trong quá trình yêu cầu chứng chỉ. Để sử dụng chức năng này, hãy gọi certbotmà không có bất kỳ miền nào:

```
sudo certbot --apache
```

Chương trình sẽ giới thiệu cho bạn hướng dẫn từng bước để tùy chỉnh các tùy chọn chứng chỉ của bạn. Nó sẽ yêu cầu bạn cung cấp địa chỉ email để khôi phục khóa bị mất và thông báo, sau đó nhắc bạn đồng ý với các điều khoản dịch vụ. Nếu bạn không chỉ định miền của mình trên dòng lệnh, bạn cũng sẽ được nhắc về điều đó. Nếu tệp Máy chủ ảo của bạn không chỉ định miền mà chúng phân phối rõ ràng bằng cách sử dụng lệnh ServerName, bạn sẽ được yêu cầu chọn tệp máy chủ ảo. Trong hầu hết các trường hợp, ssl.conftệp mặc định sẽ hoạt động.

Bạn cũng sẽ có thể chọn giữa bật cả hai httpvà httpstruy cập hoặc buộc tất cả các yêu cầu chuyển hướng đến https. Để bảo mật tốt hơn, bạn nên chọn tùy chọn 2: Redirectnếu bạn không có bất kỳ nhu cầu đặc biệt nào để cho phép các kết nối không được mã hóa. Chọn lựa chọn của bạn rồi nhấn ENTER.























 tài liệu : https://www.digitalocean.com/community/tutorials/how-to-secure-apache-with-let-s-encrypt-on-centos-7#step-1-%E2%80%94-installing-the-certbot-let%E2%80%99s-encrypt-client