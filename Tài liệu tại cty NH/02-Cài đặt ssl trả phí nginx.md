# Cài đặt ssl trả phí Nginx chạy thuần 

1. Lấy thông tin chứng chỉ SSL, bao gồm các tập tin: private.key, tenmien.crt và tenmien.ca-bundle 
2. Tải tập tin này lên máy chủ: lưu vào trong thư mục lưu private key của bạn (ví du: /usr/local/ssl/certificate) 
3. Đăng nhập vào SSH bằng tài khoản root và di chuyển đến thư mục vừa tải cert lên. 
4. Lúc này trong thư mục /usr/local/ssl/certificate sẽ có 3 tập tin: private.key, tenmien.crt, tenmien.ca-bundle 
Chuyển đổi thành tập tin dùng cho Nginx, dùng lệnh: 
cat tenmien.crt tenmien.ca-bundle > tenmien-ca.crt 
(bỏ qua bước này nếu bạn tải phiên bản dành cho Nginx từ website)
5. Mở file cấu hình của nginx (thường là /etc/nginx/conf/default.conf hoặc /etc/nginx/conf/ssl.conf hoặc /etc/nginx/sites-enabled/domain.conf) và tìm đoạn cấu hình sau: 
```
server {
listen 443 ssl;
ssl_certificate /usr/local/ssl/certificate/certificate.crt;
ssl_certificate_key /usr/local/ssl/certificate/private.key;
server_name your.domain.com;
access_log /var/log/nginx/nginx.vhost.access.log;
error_log /var/log/nginx/nginx.vhost.error.log;

    	root /home/domain.ltd/public_html;
	index index.php index.html index.htm;
    	location / {
		try_files $uri $uri/ /index.php?$args;
	}
} 

```
6. Khởi động lại nginx 
Kiểm tra trước khi khởi động lại Nginx: nginx -t 
Nếu thành công, khởi động lại Nginx: service nginx restart 
7. Mở port 443 trên Firewall (Nếu bạn dùng software firewall như iptables chẳng hạn thì có thể tìm thấy file config tại: /etc/sysconfig/iptables) 

