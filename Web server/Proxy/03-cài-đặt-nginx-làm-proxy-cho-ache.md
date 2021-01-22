# Lab Nginx Reverse Proxy

Về Nginx đóng vai trò là Cache: Nginx ngoài vai trò làm reverse proxy thì có thêm chức năng Cache. Kỹ thuật Cache trong Nginx được sử dụng để việc cải tiến tốc độ truy cập web hoặc ứng dụng trong các giải pháp CDN (Content Delivery Network)

Trên chỉ là hình mô tả về cách thức hoạt động của Reverse Proxy nhưng ta có thể tận dụng mô hình này để triển khai thêm tính năng cache cho Nginx.

Trong phạm vi bài lab này, tôi sẽ giới thiệu với các bạn mô hình lab để sử dụng Nginx là reverse proxy và caching các file tĩnh của web server.

## Mô hình

![anh1](https://image.prntscr.com/image/eifqdcPyTQax8QnwvWG0Mg.png)

Trong mô hình này tôi sẽ thực hiện các cấu hình sau:

1. Cài đặt máy webs server sử dụng Apache, sau đó up các file ảnh hoặc tạo ra một site html đơn giản (có ảnh hoặc file js)
2. Cài đặt máy Nginx làm chức năng reverse và caching.
3. Cấu hình file host ở các máy của người dùng với domain websitetest01.com trỏ về IP của máy chủ nginx.
4. Người dùng mở trình duyệt hoặc dùng lệnh curl với tùy chọn -I để kiểm tra xem proxy có hoạt động hay không.
5. Người dung truy cập nhiều lần vào web hoặc dùng curl để kiểm tra xem đã cache được hay chưa?

IP Planning

IP Nginx: 10.10.34.115 
IP WebServer: 10.10.34.111

Triển khai

1.1 Cài đặt Apache
Cài đặt các gói cơ bản
Thiết lập IP nếu cần đặt giống mô hình này

Thực hiện trên máy 10.10.34.111

Login với quyền root và thực hiện cài đặt các gói bổ trợ

```
yum update -y

yum install -y epel-release

yum install -y wget byobu 
```
- Cài đặt Apache

Cài đặt httpd
```
yum install -y httpd
```
- Khởi động httpd và kích hoạt http khi reboot hệ điều hành
```
systemctl start httpd

systemctl enable httpd

```
- Kiểm tra hoạt động của httpd

```
systemctl status httpd

```
Tạo một trang web có chứa ảnh hoặc các file tĩnh

- Dùng lệnh dưới để tải file index.html có chứa nội dung ảnh về.
```
wget -O /var/www/html/index.html https://gist.githubusercontent.com/congto/359e04f735162a987daf58d3f8d44fb6/raw/51ccab89265bff5717084af1212640dae6bbfa92/indext.html
```
Truy cập website với địa chỉ IP của máy webserver

Mở trình duyệt và truy cập vào địa chỉ ở dưới, nội dung web sẽ hiển thị trên màn hình là ok.

![anh2](https://image.prntscr.com/image/vPYRjNVlRrixzs8MPQDgkg.png)

# Cài đặt Nginx

- Cấu hình IP theo topo hoặc theo dải IP của bạn
- Thực hiện trên máy chủ Nginx (10.10.34.115)
- Đăng nhập với quyền root và thực hiện cài đặt các gói bổ trợ

```
yum update -y

yum install -y epel-release

yum install -y wget byobu 
```
- Cài đặt Nginx, ở đây tôi lựa chọn cài Nginx từ package

```
yum install -y nginx

```
- Khởi động nginx và kích hoạt chế độ khởi động cùng OS.

```
systemctl start nginx

systemctl enable nginx
````

Kiểm tra hoạt động của nginx
```
systemctl status nginx
```

Cấu hình nginx làm proxy
Trước khi cầu hình Nginx làm reverse proxy thì việc truy cập vào website của máy 192.10.10.34.115 sẽ thông qua địa chỉ IP hoặc domain được trỏ ở file host. Trong phần này tôi sẽ khai báo cấu hình cho Nginx làm chức năng reverse proxy cho máy web server. Tức là người dùng sẽ truy cập vào IP hoặc domain được trỏ về IP 10.10.34.111, lúc này Nginx sẽ làm nhiệm vụ điều phối truy cập vào máy 10.10.34.115 để lấy nội dung trang web trả về cho người dùng.

- Các bước chi tiết như sau

Sao lưu file cấu hình mặc định của nginx
```
cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bka

```
Cấu hình Nginx reverse proxy
- Di chuyển vào thư mục /etc/nginx/conf.d/để khai báo file cấu hình làm nhiệm vụ reverse proxy.
```
cd /etc/nginx/conf.d/
```
 Taọ file bằng vi file tên là huydm.xyz.conf

vi /etc/nginx/conf.d/huydm.xyz.conf

Nội dung của huydm.xyz.conf sẽ là:
```
server {
    listen 80;
    server_name huydm.xyz;
    access_log /var/log/nginx/huydm.access.log;
    error_log /var/log/nginx/huydm.error.log;
    
    location / {
        proxy_pass http://10.10.34.111:80/;
        # Input any other settings you may need that are not already contained in the default snippets.
    }
}
```
- Lưu ý trong dòng proxy_pass ta sẽ khai báo về địa chỉ của máy cài httpd.

- Sau khi khai báo xong, kiểm tra lại xem khai báo này đã đúng chưa bằng lệnh
```
nginx -t
```

khởi động lại nginx hoặc nạp lại file cấu hình.
```
systemctl restart nginx
```

Đối với môi trường thật thì việc cấu hình này sẽ có IP Public và domain chuẩn, nhưng do đây là môi trường lab nên ta dùng thủ thuật nhỏ để trỏ domain thông qua file host. Cụ thể là sẽ mở file host trên windows hoặc /etc/hosts của linux để khai báo file host. Mục tiêu là nói cho client biết địa chỉ huydm.xyz sẽ nằm ở máy chủ nào.

Đối với windows: Ta thêm dòng 10.10.34.115 huydm.xyz vào file C:\Windows\System32\drivers\etc\hosts

![anh5](https://image.prntscr.com/image/RlC8TYhrTRWC6qyFuLY4yw.png)

Đối với linux ta khai báo ở file /etc/hosts

- Lưu ý rằng mặc dù website được đặt trên máy chủ 10.10.34.111 nhưng domain sẽ được trỏ về 10.10.34.115 , đây chính là việc sử dụng tính năng reverse proxy của nginx để điều hướng các kết nối của người dùng và máy chủ gốc (origin)

- Kiểm tra nội dung web và xem revert proxy hoạt động hay chưa bằng cách truy cập vào địa chỉ huydm.xyz Trong ảnh này tôi sử dụng thêm mode của phím F12 để có thể show được các kết nối từ client tới webserver. Ta quan sát thấy nội dung của web được hiển thị và địa chỉ IP của Nginx reserver proxy.

![anh7](https://image.prntscr.com/image/hscchRmhQZi6li3RkhkZtA.png)