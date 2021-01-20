# Cấu hình Nginx làm Reverse Proxy cho Apache (CentOS 7)

Reserse proxy là gì?

Apache và Nginx là 2 hệ thống Web server phổ biến và được sử dụng rộng dãi trong nhiều hệ thống lớn với ưu điểm chung đều là các phần mềm OpenSource.

- Apache nổi tiếng làm việc hiệu quả với những xử lý động như PHP,…

- Nginx có điểm mạnh là xử lý rất nhanh các web tĩnh.

Với những ưu điểm đó, người ta đã kết hợp Nginx và Apache lại với nhau để bổ trợ cho nhau giúp hệ thống Webserver thêm phần hoàn thiện và đạt hiệu quả cao.

- Apache:
Vai trò chung là web server
Xử lý các file kịch bản động PHP…
- Nginx:

Đóng vai trò là 1 Reverse Proxy

Nginx đứng trước để tiếp nhận các kết nối và che chắn cho Webserver Apache.

Reverse proxy có vai trò là cầu nối của client và server. Nó sẽ thực hiện nhận yêu cầu từ client và chuyển lên server và nhận trả lời từ server chuyển ngược lại client.

# Các bước cấu hình Nginx làm Reverse proxy cho Apache Web Server

## Mô hình Lab

![anh1](https://image.prntscr.com/image/bO65kNTQSqOh7lWhgEXyVw.png)

Trong bài viết này, ta sẽ cài đặt Nginx Reverse proxy và Apache Web Server trên cùng một server CentOS 7 có IP: 10.10.34.111

Vô hiệu hoá SELinux theo bài viết: https://zhost.vn/docs/selinux-la-gi-cach-vo-hieu-hoa-selinux-tren-centos/

# Cài đặt Apache Web Server

Cài đặt Apache:
```
yum -y install httpd

```

Sau khi cài đặt xong các bạn chạy lệnh sau để khởi động Apache Service:

```
systemctl start httpd

systemctl enable httpd

```

Tiếp theo cấu hình firewall mở port http/https, mặc định trong centos 7 sử dụng FirewallD.

```
firewall-cmd --permanent --zone=public --add-service=http 

firewall-cmd --permanent --zone=public --add-service=https

firewall-cmd --reload
```
Như vậy, ta đã cài đặt Apache web server xong, để kiểm tra Apache hoạt động chưa các bạn mở trình duyệt web truy cập địa chỉ ip của server (http://your-ip-address ) sẽ ra default page của Apache.

![anh2](https://image.prntscr.com/image/aaEqrclNS6uLWLJqi17JFw.png)

Cấu hình Apache listen ở port 8080 thay vì 80 như mặc định:

```
sed -i '/Listen 80/c\Listen 8080' /etc/httpd/conf/httpd.conf
```

Khởi động lại apache:
```
systemctl restart httpd

```

# Cài đặt Nginx Reverse proxy

Cài đặt các Repo cần thiết:

```
yum install epel-release -y

rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm 

rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm

```

Chạy lệnh sau để cài đặt Nginx:

```
yum install -y nginx

```

Chạy khối lệnh sau để tạo và dán nội dụng cho file proxy_params:

```

cat >/etc/nginx/proxy_config <<EOF
proxy_redirect      off;
proxy_set_header X-Forwarded-Proto \$scheme;
proxy_set_header    Host            \$host;
proxy_set_header    X-Real-IP       \$remote_addr;
proxy_set_header    X-Forwarded-For \$proxy_add_x_forwarded_for;
proxy_pass_header   Set-Cookie;
proxy_connect_timeout   90;
proxy_send_timeout  90;
proxy_read_timeout  90;
proxy_buffers       32 4k;
client_max_body_size 1024m;
client_body_buffer_size 128k;
EOF

```

Trong tệp tin /etc/nginx/proxy_params, chúng ta làm rõ một số tham số:

- proxy_set_header Host $host: Dùng để định nghĩa lại trường Host request header mà truyền đến backend khi mà cached được enable trên nginx . $host bằng giá trị server_name trong trường Host request header.

- proxy_set_header X-Real-IP: Truyền Real IP của client vào header khi gửi request đến Backend Apache.

- proxy_set_header X-Forwarded-For: Mặc định client request thì thông tin sẽ chỉ giao tiếp với reverse proxy, vì vậy mà thông tin log của Backend server (Apache web server) sẽ chỉ nhận được là địa chỉ IP của Nginx proxy. Để ghi nhận địa chỉ IP thực của client vào backend web server, chúng ta sử dụng tham số: “proxy_set_header X-Forwarded-For”

- proxy_set_header X-Forwarded-Proto: Xác định giao thức (http hoặc https) mà client gửi request tới proxy.

- client_max_body_size: Thiết lập kích thước tối đa mà client sẽ gửi thông tin đến server.

Mở file Virtual host của nginx để cấu hình Proxy (ở đây sử dụng virtual host của trang default):` /etc/nginx/conf.d/default.conf.` Tại block location / {} chỉnh sửa nội dung để chuyển request từ Proxy về Apache:

```
location / {
        proxy_pass http://127.0.0.1:8080;
        include /etc/nginx/proxy_config;
    }
```

Tham số proxy_pass dùng để thiết lập giao thức và địa chỉ của máy chủ backend và một URI tùy chọn mà một location sẽ được ánh xạ. Địa chỉ ở đây có thể là domain hoặc địa chỉ IP (127.0.0.1) và một cổng tùy chọn mà Backend đang lắng nghe (8080).

Do Nginx phục vụ file tĩnh nhanh hơn Apache rất nhiều nên ta cấu hình như sau.

Tại block server {} thêm nội dung phía dưới để khi User có một request truy vẫn file tĩnh, Nginx sẽ trả về luôn thay vì phải chuyển request vào Apache xử lý:

```
location ~* ^.+\.(jpeg|io|map|jpg|png|gif|bmp|ico|svg|tif|tiff|css|js|htm|html|ttf|otf|webp|woff|txt|csv|rtf|doc|docx|xls|xlsx|ppt|pptx|odf|odp|ods|odt|pdf|psd|ai|eot|eps|ps|zip|tar|tgz|gz|rar|bz2|7z|aac|m4a|mp3|mp4|ogg|wav|wma|3gp|avi|flv|m4v|mkv|mov|mpeg|mpg|wmv|exe|iso|dmg|swf)$ {
            root           /var/www/html;
            expires        max;
        }
```
Lưu ý: đường dẫn root /var/www/html phải trùng với thư mục đặt Source code mà Apache đang xử lý (ở đây là /var/www/html).

Sau khi cấu hình xong, file virtual host sẽ giống như sau:

![anh4](https://image.prntscr.com/image/Rg7i7_TDQeC7xholluHp8A.png)

khi khai báo xong, kiểm tra lại xem khai báo này đã đúng chưa bằng lệnh :

```
nginx -t
```
Nếu kết quả như ảnh dưới là ok, tiến hành khởi động lại nginx hoặc nạp lại file cấu hình.

![anh3](https://image.prntscr.com/image/hYYY9wiJQ66l036QgGo3lg.png)

```
systemctl restart nginx

```


Kiểm tra các requet vào file access.log để kiểu tra :

dùng lệnh tailf access.log

 nginx /var/log/nginx/access.log

apache /var/log/httpd/access_log 

![anh6](https://image.prntscr.com/image/9-EzlVm0SJ_eN643mhGoFQ.png)