# Reverse proxy là gì?

Reverse proxy là gì?
Một proxy server(https://quantrimang.com/ly-thuyet-proxy-la-gi-117220)hoạt động với vai trò trung gian giữa máy khách và máy chủ khác. Proxy server lấy tài nguyên từ máy chủ mà bạn muốn kết nối và gửi nó cho bạn để xem. Một reverse proxy hoạt động theo cùng một cách, ngoại trừ vai trò bị đảo ngược. Khi bạn yêu cầu thông tin từ máy chủ, reverse proxy sẽ giữ yêu cầu và gửi nó đến máy chủ backend thích hợp. Điều này cho phép quản trị viên hệ thống sử dụng máy chủ cho nhiều ứng dụng, cũng như đảm bảo luồng lưu lượng truy cập mượt mà hơn giữa máy khách và máy chủ.

![anh1](https://image.prntscr.com/image/Z8vl11rcT4q_xVKt3zcPVQ.png)

# Lợi ích của reverse proxy

2. Mục đích sử dụng


- Load Balancing: Như theo sơ đồ trên, Reverse Proxy sẽ nhận request, phân bố cho Server tương ứng, nhận kết quả và trả về cho client.
- Web Acceleration: Reverse Proxy có thể được dùng cho việc nén dữ liệu inbound và outbound, cũng như cache lại các request nhằm giảm dung lượng dữ liệu và tăng tốc độ cho cả phía client lẫn server.
- Bảo mật và ẩn danh: Reverse Proxy có thể được dùng như một tường lửa đơn giản để block hoặc filter các bad-request