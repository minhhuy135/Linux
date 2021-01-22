# Reverse proxy là gì?

Reverse proxy là gì?
Một proxy server(https://quantrimang.com/ly-thuyet-proxy-la-gi-117220)hoạt động với vai trò trung gian giữa máy khách và máy chủ khác. Proxy server lấy tài nguyên từ máy chủ mà bạn muốn kết nối và gửi nó cho bạn để xem. Một reverse proxy hoạt động theo cùng một cách, ngoại trừ vai trò bị đảo ngược. Khi bạn yêu cầu thông tin từ máy chủ, reverse proxy sẽ giữ yêu cầu và gửi nó đến máy chủ backend thích hợp. Điều này cho phép quản trị viên hệ thống sử dụng máy chủ cho nhiều ứng dụng, cũng như đảm bảo luồng lưu lượng truy cập mượt mà hơn giữa máy khách và máy chủ.

![anh1](https://image.prntscr.com/image/Z8vl11rcT4q_xVKt3zcPVQ.png)

# Lợi ích của reverse proxy

2. Mục đích sử dụng


- Load Balancing: Như theo sơ đồ trên, Reverse Proxy sẽ nhận request, phân bố cho Server tương ứng, nhận kết quả và trả về cho client.
- Web Acceleration: Reverse Proxy có thể được dùng cho việc nén dữ liệu inbound và outbound, cũng như cache lại các request nhằm giảm dung lượng dữ liệu và tăng tốc độ cho cả phía client lẫn server.
- Bảo mật và ẩn danh: Reverse Proxy có thể được dùng như một tường lửa đơn giản để block hoặc filter các bad-request

Để thiết lập Nginx làm reverse proxy, bài viết sẽ sử dụng tham số proxy_pass trong file cấu hình Nginx.

Lưu ý: Hướng dẫn này giả định rằng bạn có một số kiến ​​thức về Nginx và đã cài đặt, cũng như thiết lập Nginx trong máy chủ của bạn.

Trong hầu hết các trường hợp sử dụng, Nginx sẽ là máy chủ front-end, “lắng nghe” cổng 80 (HTTP) hoặc 443 (HTTPS) cho các yêu cầu đến. Vì chỉ có thể có một dịch vụ “nghe” trên cổng 80 hoặc 443, ứng dụng của bạn sẽ phải “nghe” trên một cổng khác, chẳng hạn như cổng 8081. Cấu hình đơn giản nhất sẽ giống như thế này:

```
server {
 listen 80;
 listen [::]:80;
 server_name myapp.com;
 location / {
 proxy_pass http://localhost:8081/;
 }
 }
 ```

 Điều này có nghĩa là tất cả các yêu cầu đến myapp.com tại cổng 80 sẽ được chuyển hướng đến cổng 8081.