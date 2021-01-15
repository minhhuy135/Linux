# Cách tạo chứng chỉ SSL tự ký cho Nginx trên CentOS 7

![anh1](https://image.prntscr.com/image/VobhGV5oR_OruQuoI9tFTA.png)

Giới thiệu
Chú thích: Một chứng chỉ tự ký sẽ mã hóa giao tiếp giữa máy chủ của bạn và bất kỳ máy khách nào. Tuy nhiên, vì nó không được ký bởi bất kỳ cơ quan cấp chứng chỉ đáng tin cậy nào có trong trình duyệt web, người dùng không thể sử dụng chứng chỉ để xác thực danh tính máy chủ của bạn một cách tự động.

Chứng chỉ tự ký có thể phù hợp nếu bạn không có tên miền liên kết với máy chủ của mình và trong trường hợp giao diện web được mã hóa không phải là giao diện người dùng. nếu bạn làm có một tên miền, trong nhiều trường hợp tốt hơn là sử dụng chứng chỉ CA-signed. Để tìm hiểu cách thiết lập chứng chỉ đáng tin cậy miễn phí, hãy làm theo hướng dẫn của chúng tôi về thiết lập Nginx với chứng chỉ Let's Encrypt trên CentOS 7.

Bước 1: Cài đặt nginx

xem nginx đã cài chưa :
```
systemctl status nginx

```
Bước 2: Tạo chứng chỉ SSL

Các /etc/ssl/certs thư mục, có thể được sử dụng để giữ chứng chỉ công khai, đã tồn tại trên máy chủ. Hãy tạo một /etc/ssl/private cũng như để giữ tệp khóa riêng tư. Vì bí mật của khóa này là cần thiết để bảo mật, chúng tôi sẽ khóa các quyền để ngăn truy cập trái phép:

```
sudo mkdir /etc/ssl/private

sudo chmod 700 /etc/ssl/private

```
Bây giờ, chúng ta có thể tạo một cặp khóa và chứng chỉ tự ký với OpenSSL trong một lệnh bằng cách gõ:

```
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

```

- openssl: Đây là công cụ dòng lệnh cơ bản để tạo và quản lý chứng chỉ OpenSSL, các khóa và các tệp khác.
- req: Tiểu mục này chỉ định rằng chúng tôi muốn sử dụng quản lý yêu cầu ký chứng chỉ X.509 (CSR). "X.509" là tiêu chuẩn cơ sở hạ tầng khóa công khai mà SSL và TLS tuân thủ để quản lý khóa và chứng chỉ của nó. Chúng tôi muốn tạo một cert X.509 mới, vì vậy chúng tôi đang sử dụng subcommand này.
- x509: Điều này tiếp tục sửa đổi tiểu ban trước đó bằng cách nói cho tiện ích rằng chúng tôi muốn tạo chứng chỉ tự ký thay vì tạo yêu cầu ký chứng chỉ, như thường lệ xảy ra.
- nodes: Điều này cho OpenSSL bỏ qua tùy chọn để bảo mật chứng chỉ của chúng tôi bằng cụm mật khẩu. Chúng tôi cần Nginx có thể đọc được tệp, mà không cần sự can thiệp của người dùng, khi máy chủ khởi động. Cụm mật khẩu sẽ ngăn điều này xảy ra vì chúng tôi sẽ phải nhập nó sau mỗi lần khởi động lại.
- ngày 365: Tùy chọn này đặt khoảng thời gian chứng chỉ sẽ được coi là hợp lệ. Chúng tôi đặt nó trong một năm ở đây.
- newkey rsa: 2048: Điều này xác định rằng chúng tôi muốn tạo chứng chỉ mới và khóa mới cùng một lúc. Chúng tôi đã không tạo khóa cần thiết để ký chứng chỉ trong bước trước, vì vậy chúng tôi cần tạo chứng chỉ cùng với chứng chỉ. Các rsa:2048 phần cho biết để tạo khóa RSA dài 2048 bit.
- keyout: Dòng này cho OpenSSL biết nơi đặt tệp khóa cá nhân được tạo mà chúng tôi đang tạo.
- ngoài: Điều này cho OpenSSL biết nơi đặt chứng chỉ mà chúng ta đang tạo.

`các tùy chọn này sẽ tạo cả tệp khóa và chứng chỉ`. Chúng tôi sẽ hỏi một số câu hỏi về máy chủ của chúng tôi để nhúng thông tin chính xác vào chứng chỉ.

```
Country Name (2 letter code) [AU]: VN
State or Province Name (full name) [Some-State]: Ha Noi
Locality Name (eg, city) []: Ha Noi
Organization Name (eg, company) [Internet Widgits Pty Ltd]:Test company
Organizational Unit Name (eg, section) []: Test company 
Common Name (e.g. server FQDN or YOUR name) []: IP hoặc test.com
Email Address []:admin@test.com

```
Cả hai tệp bạn đã tạo sẽ được đặt trong các thư mục con thích hợp của /etc/ssl danh mục.

Trong khi chúng tôi đang sử dụng OpenSSL, chúng tôi cũng nên tạo một nhóm Diffie-Hellman mạnh, được sử dụng trong đàm phán Perfect Forward Secrecy với khách hàng.

Chúng ta có thể làm điều này bằng cách gõ:

```
sudo openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048

```

Bước 3: Định cấu hình Nginx để sử dụng SSL

`Nginx sẽ kiểm tra các tệp kết thúc bằng .conf bên trong /etc/nginx/conf.d thư mục cho cấu hình bổ sung.`

Tạo khối máy chủ TLS / SSL

Tạo và mở tệp có tên ssl.conf bên trong /etc/nginx/conf.d danh mục:
```
sudo vi /etc/nginx/conf.d/ssl.conf

```

Bên trong, bắt đầu bằng cách mở một server khối. Theo mặc định, các kết nối TLS / SSL sử dụng cổng 443, vì vậy đó phải là listen Hải cảng. Các server_name nên được đặt thành tên miền hoặc địa chỉ IP của máy chủ mà bạn đã sử dụng làm Tên thường dùng khi tạo chứng chỉ. Tiếp theo, sử dụng ssl_certificate, ssl_certificate_keyvà ssl_dhparam chỉ thị để đặt vị trí của tệp SSL mà chúng tôi đã tạo:

/etc/nginx/conf.d/ssl.conf

![anh2](https://image.prntscr.com/image/uJeF6bBfRfGPZqD0q1EtQQ.png)

Tạo Chuyển hướng từ HTTP sang HTTPS

Nginx phản hồi với nội dung được mã hóa cho các yêu cầu trên cổng 443, nhưng phản hồi với nội dung không được mã hóa cho các yêu cầu trên cổng 80

thêm chỉ thị vào khối máy chủ cổng 80 mặc định bằng cách thêm tệp trong /etc/nginx/default.d danh mục. Tạo một tệp mới có tên ssl-redirect.conf và mở nó để chỉnh sửa bằng lệnh này:

```
sudo vi /etc/nginx/default.d/ssl-redirect.conf

```

Sau đó dán vào dòng này:

/etc/nginx/default.d/ssl-redirect.conf

```
return 301 https://$host$request_uri/;

```

Bước 4: Bật các thay đổi trong Nginx

Trước tiên, chúng ta nên kiểm tra để đảm bảo rằng không có lỗi cú pháp trong tệp của chúng tôi. Chúng ta có thể làm điều này bằng cách gõ:

```
sudo nginx -t

```

Nếu mọi thứ thành công, bạn sẽ nhận được kết quả như sau:

![anh3](https://image.prntscr.com/image/dZEvevI0Q5S21_tuqiTeww.png)

Nếu đầu ra của bạn khớp với ở trên, tệp cấu hình của bạn không có lỗi cú pháp. Chúng tôi có thể khởi động lại Nginx một cách an toàn để thực hiện các thay đổi của chúng tôi:

```
sudo systemctl restart nginx

```
Bước 3: Kiểm tra mã hóa

Mở trình duyệt web của bạn và nhập https:// theo sau là tên miền hoặc IP của máy chủ của bạn vào thanh địa chỉ:

```
http://server_domain_or_IP

```

Bởi vì chứng chỉ chúng tôi đã tạo không được ký bởi một trong các cơ quan cấp chứng chỉ đáng tin cậy của trình duyệt, bạn có thể sẽ thấy cảnh báo tìm kiếm đáng sợ như cảnh báo bên dưới:

![anh4](https://image.prntscr.com/image/VobhGV5oR_OruQuoI9tFTA.png)

## Tài liệu tham khảo 

1 .https://laptrinhx.com/cach-tao-chung-chi-ssl-tu-ky-cho-nginx-tren-centos-7-1713534839/

2.Cấu trúc tệp cấu hình nginx
http://nginx.org/en/docs/beginners_guide.html#:~:text=The%20way%20nginx%20and%20its,%2Flocal%2Fetc%2Fnginx%20.
