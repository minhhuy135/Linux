# Chuyển đổi NameServer sang CloudFlare

## CloudFlare là gì?
CloudFlare là dịch vụ DNS trung gian, giúp điều phối lượng truy cập giữa máy chủ và các client qua lớp bảo vệ CloudFlare.

Hay nói một cách dễ hiểu thì thay vì bạn truy cập trực tiếp vào Website thông qua máy chủ phân giải tên miền DNS (Domain Name Server) thì bạn sẽ sử dụng máy chủ phân giải tên miền của CloudFlare. Các truy cập sẽ phải đi qua máy chủ của CloudFlare để xem dữ liệu website thay vì truy cập trực tiếp.

![anh1](https://image.prntscr.com/image/Lbm9ztJrT5yyM64DJR8OlQ.png)

Với những tính năng hấp dẫn mà nhà cung cấp DNS không có, CloudFlare được rất nhiều Webmaster tin dùng hiện nay. Ngoài những chức năng thông thường, CloudFlare còn có nhiều dịch vụ khác nữa về CDN, SPDY, tường lửa chống Ddos, Spam, Chứng chỉ số SSL, Forward Domain,…

Mô hình minh họa khi không dùng và khi dùng dịch vụ Cloudflare
![anh2](https://image.prntscr.com/image/pngyl-y-SRGoJhZHIa2J0w.png)

* chú thích :
- visitor : khách truy cập                             
- slow pipes : đường ống chậm                            
- crawlers and bots : trình thu thập thông tin và bot
- attackers : kẻ tấn công
- your naked website : trang web khỏa thân


- fast pipes : đường ống nhanh
- cloudflares globally distributed network : mạng phân phối đám mây trên toàn cầu 
- cloudflare protected website : trang web được bảo vệ bằng đám mây

Cloudflare hiện nay được sử dụng miễn phí nên càng được nhiều người ưa chuộng và tin dùng cho nhiều việc, trong đó phải nói đến việc tăng tốc độ và bảo mật cho website.

## Ưu và nhược điểm của việc sử dụng CloudFlare là gì?

### Ưu điểm của CloudFlare là gì?

- Giúp website của bạn tăng tốc độ truy cập bằng cách CloudFlare sẽ lưu một bản bộ nhớ đệm (cache) của website trên máy chủ của CDN của họ. Từ đó phân phối cho người dùng truy cập ở gần máy chủ đó nhất.

- Giúp tiết kiệm được băng thông cho máy chủ vì hạn chế truy trực trực tiếp vào máy chủ. Lúc này, băng thông sử dụng giảm hẳn chỉ còn 1/2 – 1/3 so với trước khi dùng.
- Giúp website tăng khả năng bảo mật, hạn chế được sự tấn công của DDoS, spam bình luận trên blog và một số phương thức tấn công cơ bản khác. Bạn có thể cải thiện bảo mật website bằng cách sử dụng CloudFlare như sử dụng SSL miễn phí để thêm giao thức HTTPS cho website; hạn chế truy cập từ các quốc gia chỉ định; cấm truy cập với các IP nhất định; công nghệ tường lửa ứng dụng website; bảo vệ các trang có tính chất đăng nhập (gói Pro).

### Nhược điểm của CloudFlare là gì?

- Nếu website của bạn nằm trên hosting có máy chủ đặt tại Việt Nam, khách hàng truy cập chủ yếu đến từ Việt Nam thì việc sử dụng CloudFlare làm chậm đi tốc độ tải trang vì chất lượng đường truyền quốc tế tại Việt Nam. Nguyên nhân được cho là lúc này truy vấn sẽ đi vòng từ Việt Nam đến DNS Server của CloudFare rồi mới trả kết quả về Việt Nam.
- Thời gian uptime website phụ thuộc vào thời gian uptime của Server CloudFlare nếu bạn sử dụng. Tức là nếu Server CloudFlare bị down thì khả năng truy xuất vào website của bạn sẽ bị gián đoạn vì không phân giải được tên miền website đang sử dụng.
- Đôi lúc Firewall của hosting mà website bạn đang đặt hiểu lầm dải IP của CloudFlare là địa chỉ tấn công.

### Có nên sử dụng Cloudflare?
Bạn có thể dùng nó y như một dịch vụ DNS thông thường bằng cách tắt đám mây tên miền. Một số lý do mà bạn nên sử dụng dịch vụ DNS trung gian này bao gồm:

- Tốc độ: Nếu như máy chủ của bạn gần với người dùng thì nó sẽ khiến họ truy cập Website chậm hơn. Ngược lại, với trường hợp máy chủ ở quá xa thì Cloudflare sẽ giúp tăng tốc độ tải trang. Theo tôi, nếu bạn đang phục vụ cho người dùng ở nước ngoài thì hãy dùng dịch vụ DNS này.
- Auto Minify: Nó sẽ loại bỏ các ký tự không cần thiết ra khỏi mã nguồn mà không thay đổi chức năng. Điển hình như tự động loại bỏ chú thích, khoảng trắng,… để giảm lượng dữ liệu chuyển đi và cải thiện tốc độ tải trang.
- Rocket Loader: Dịch vụ DNS này sẽ trì hoãn tải tất cả JavaScript để ưu tiên nội dung của Website được hiển thị trước. Tuy nhiên, nó có thể khiến đoạn mã JavaScript bị lỗi nếu bạn sử dụng lệnh jQuery. Vì vậy, nếu không cần thiết thì bạn có thể tắt tính năng này đi.
- Bảo mật: Đây là yếu tố quan trọng để giữ cho Website của bạn luôn an toàn trước kẻ tấn công. Dịch vụ DNS trung gian này có thể phát hiện và ngăn chặn Hacker tấn công trang Web của bạn.

chỉ nên sử dụng CloudFlare khi:
- Website được đặt tại máy chủ ở nước ngoài, có lượng traffic chủ yếu ở Việt Nam. Hoặc cũng có thể là lượng traffic toàn thế giới.
- Muốn che giấu địa chỉ IP máy chủ website của bạn đang sử dụng.

# Cài đặt Cloudflare

### Các bước thực hiện
- Bước 1: Đăng ký tài khoản CloudFlare
Để đăng ký tài khoản CloudFlare, ta truy cập vào trang: https://www.cloudflare.com/a/sign-up

- Bước 2: Nhập Domain mà ta muốn đăng ký lên CloudFlare
![anh3](https://image.prntscr.com/image/HQVfmwIJRfWJQIdR5xp0yg.png)

- Bước 3: Thêm các bản ghi DNS vào CloudFlare

Tại đây có thể cấu hình thiết lập các record DNS đã có sẵn sau khi quá trình scan hoàn tất hoặc thêm các record DNS khác cho domain cũng như cho phép các record DNS của domain tương ứng phân giải thông qua CloudFlare (fake IP) và chọn Continue.

![anh4](https://image.prntscr.com/image/Urie8-jJROWZtdd704Z06g.png)

Một số Trạng thái cần chú ý:

![anh5](https://image.prntscr.com/image/zAKdq6-nSfWnI7C2o_9Vig.png)

# Bước 3: Tiến hành thay đổi Nameserver sang Nameserver của CloudFlare
## 1.LOG in to your registar account(ĐĂNG NHẬP vào tài khoản đăng ký của bạn)
Determine your registrar via WHOIS.
`Remove these nameservers:`
```
ns4.zonedns.vn
ns3.zonedns.vn
ns2.zonedns.vn
ns1.zonedns.vn
```
![anh6](https://image.prntscr.com/image/PKTa8Nm7Qi6Zf9InVVinKw.png)

## 2. Replace with Cloudflares nameservers(Thay thế bằng máy chủ định danh Cloudflares) :

## Bước 4: Truy cập vào trang quản lý tên miền cũ để thay đổi Nameserver

Truy cập vào https://zonedns.vn/ và đăng nhập với tên miền muốn thay đổi
![anh7](https://image.prntscr.com/image/PKTa8Nm7Qi6Zf9InVVinKw.png)

# Bước 5: Xác nhận bên CloudFlare đã thay đổi Nameserver
Ta nên đợi một lúc để các thay đổi được hoàn thành

![anh9](https://image.prntscr.com/image/W2kYW67XRgW2_2wyXprrJA.png)


![anh8](https://image.prntscr.com/image/JCDJQdzvTuW1w9cHbdSijQ.png)

Kiểm tra các bản ghi DNS và Nameserver của CloudFlare

![anh10](https://image.prntscr.com/image/wxXuPY--Rw2wCcd50KS5Dw.png)

Kiểm tra các bản ghi DNS và Nameserver 

https://whois.nhanhoa.com/

![anh11](https://image.prntscr.com/image/qthWeNpbREOl3VkumqoLUA.png)