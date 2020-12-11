# Network File System (NFS)
(Hệ thống tệp mạng)

NFS ( Network File System ) về cơ bản được phát triển để chia sẻ các tệp và thư mục giữa các hệ thống Linux Unix bởi Sun microsystems vào năm 1980. Nó cho phép bạn gắn kết các hệ thống tệp cục bộ của mình qua mạng và các máy chủ từ xa để tương tác với chúng khi chúng được gắn cục bộ trên cùng một hệ thống.

# Lợi ích của NFS
NFS cho phép truy cập cục bộ vào các tệp từ xa.
- Nó sử dụng kiến trúc client/server tiêu chuẩn để chia sẻ tệp giữa các máy

## 1. Client server là gì?

- Client server là mô hình mạng máy tính bao gồm 2 thành phần chính là máy khách (client) và máy chủ (server). Trong mô hình này, server là nơi lưu trữ tài nguyên, cài đặt các chương trình dịch vụ và thực hiện các yêu cầu của client. Client đón vai trò gửi yêu cầu đến server. Client gồm máy tính và thiết bị điện tử nói chung.

![anh1](https://image.prntscr.com/image/wEDzECJ6TaW5H2DzPewILQ.png)

- Mô hình Client server cho phép mạng tập trung các ứng dụng và chức năng tại một hoặc nhiều máu dịch vụ file chuyên dụng. Các máy này trở thành trung tâm của hệ thống. Hệ điều hành của Client server cho phép người dùng chia sẻ đồng thời cùng một tài nguyên, không quan trọng vị trí địa lý. 

## 2.1 Ưu điểm của Client server là gì?
- Client server có khả năng chống quá tải mạng
- Client server đảm bảo toàn vẹn dữ liệu khi có sự cố xảy ra
- Dễ dàng mở rộng hệ thống mạng
- Chỉ cần chung định dạng giao tiếp mà không cần chung nền tảng là có thể hoạt động được
- Client server cho phép tích hợp các kỹ thuật hiện đại như GIS, mô hình thiết kế hướng đối tượng,…
- Với mô hình Client server, người dùng có thể truy cập dữ liệu từ xa, thực hiện các thao tác gửi, nhận file hay tìm kiếm thông tin đơn giản


Ví dụ

- Web server: Người dùng nhập địa chỉ website => client gửi yêu cầu đến web server => web server gửi toàn bộ nội dung của website về cho client
- Mail server: Người dùng soạn mail => client gửi đến mail server => mail server tiếp nhận, lưu trữ, tìm kiếm địa chỉ email được gửi đến & gửi mail đi
- File server: File server nhận tập tin từ phía client, lưu trữ và truyền tập tin đi. Người dùng có thể upload, download các tập tin lên server qua giao thức FTP hay web browser

- 3.1 Client
Client hay chính là máy khách, máy trạm – là nơi gửi yêu cầu đến server. Nó tổ chức giao tiếp với người dùng, server và môi trường bên ngoài tại trạm làm việc. Client tiếp nhận yêu cầu của người dùng sau đó thành lập các query string để gửi cho server. Khi nhận được kết quả từ server, client sẽ tổ chức và trình diễn những kết quả đó.  

- 3.2 Server
Server xử lý yêu cầu gửi đến từ client. Sau khi xử lý xong, server sẽ gửi trả lại kết quả, client có thể tiếp tục xử lý các kết quả này để phục vụ người dùng. Server giao tiếp với môi trường bên ngoài và client tại server, tiếp nhận yêu cầu dưới dạng query string (xâu ký tự). Khi phân tích xong các xâu ký tự, server sẽ xử lý dữ liệu và gửi kết quả về cho client.





Với NFS , không cần thiết cả hai máy đều chạy trên cùng một hệ điều hành.
Với sự trợ giúp của NFS, có thể định cấu hình các giải pháp lưu trữ tập trung.
Người dùng có được dữ liệu của họ bất kể vị trí thực tế.
Không cần làm mới thủ công cho các tập tin mới.
Phiên bản mới hơn của NFS cũng hỗ trợ acl, mount root ảo.
Có thể được bảo mật với Tường lửa và Kerberos.