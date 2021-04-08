
# Mail server và cách hoạt động của mail server

## I. Mail server là gì ?

- Mail Server hay email server là hệ thống máy chủ được cấu hình riêng theo tên miền của doanh nghiệp dùng để gửi và nhận thư điện tử

- Mail server cơ bản vẫn là Dedicated server (server riêng lẻ) hay Cloud server (Server điện toán đám mây) được cấu hình để biến thành một cỗ máy gửi và nhận thư điện tử . Nó cũng có đầy đủ các thông số như một server bình thường như Ram, Cpu , Storage,... ngoài ra , nó còn có các thông số khác liên quan đến yếu tố email như số lượng tài khoản email , Email fowarder,Mail list

## II.  Cách thức hoạt động của mail server

- Mail Server hoạt động dựa trên 3 giao thức cơ bản bao gồm:

![anh1](https://image.prntscr.com/image/GGKPHB7uRH_Z-NjZz_0ERg.png)

### 1. Các loại Mail Server

Mail Server gửi đi (Outgoing Mail Servers)

- Outgoing Mail Server hay Mail Server gửi đi sử dụng giao thức SMTP (Simple Mail Transfer Protocol). Đây là giao thức dịch chuyển mail đơn giản được dùng để liên lạc với server từ xa. Đồng thời cho phép gửi nhiều thư cùng một lúc tới các server khác nhau.

  - Giao thức STMP: SMTP là viết tắt của Simple Mail Transfer Protocol hay giao thức truyền tải thư tín đơn giản là một chuẩn truyền tải thư điện tử qua mạng Internet. SMTP được dùng để liên lạc với server từ xa và gửi email từ mail client tới mail server và sau đó được gửi đến server mail của email nhận. Quá trình này được điều khiển bởi Mail Transfer Agent (MTA) trên email server của bạn. Cũng vậy, SMTP chỉ được dùng cho mục đích gửi email.

  ![anh2](https://image.prntscr.com/image/uEXl7vESTNStEc4LMzofXg.png)

 - SMTP – Simple Mail Transfer Porotocol: SMTP được sử dụng khi gửi từ một ứng dụng email như Postfix với một máy chủ email hoặc khi email được gửi từ một máy chủ email khác. Giao thức này sử dụng cổng TCP 25 với không bảo mật SSL và cổng 465/587 với bảo mật SSL/TLS.

 ## Incoming Mail Server là gì?

Mail Server đến (Incoming Mail Servers) hay còn được biết đến dưới 2 loại giao thức: POP3 và Imap 

Khi thiết lập email, bạn đã có thể được hỏi về việc lựa chọn giao thức email bạn muốn (POP3 hay IMAP).


## 1. POP3 Post Office Porotocol version 3: giao thức này được dùng để tải một email từ một máy chủ email. POP3 sử dụng cổng TCP 110 khi không có SSL, cổng 995 khi có SSL/TLS.

- Được sử dụng để kết nối với server mail và tải email xuống máy tính cá nhân qua các ứng dụng email client Outlook, Thunderbird, Windows Mail, Mac Mail…

![anh3](https://image.prntscr.com/image/LzXxs699S3ic3C0oI-igVw.png)

Thông thường, email client sẽ có tùy chọn bạn có muốn giữ mail trên server sau khi tải về hay không. Nếu bạn đang truy cập một tài khoản bằng nhiều thiết, chúng tôi khuyên là nên chọn giữ lại bản copy trên server nếu không thiết bị thứ 2 sẽ không thể tải mail về được vì nó đã bị xóa sau khi tải về trên thiết bị 1.
Cũng đáng để lưu ý là POP3 là giao thức 1 chiều, có nghĩa là email được “kéo” từ email server từ xa xuống email client.
Mặc đình, port POP3 là:
Port 110 – port không mã hóa

Port 995 – SSL/TLS port, cũng có thể được gọi là POP3S


## 2. IMAP là viết tắt của Internet Message Access Protocol, là giao thức chuẩn Internet được sử dụng bởi các ứng dụng email để truy xuất thư email từ máy chủ thư qua kết nối TCP/IP. 

Giống như POP3, IMAP cũng được dùng để kéo email về emails client, tuy nhiên khác biệt với POP3 là nó chỉ kéo email headers về, nội dung email vẫn còn trên server. Đây là kênh liên lạc 2 chiều, thay đổi trên mail client sẽ được chuyển lên server và đồng bộ

![anh4](https://image.prntscr.com/image/AzUhYkduRaWg1xyGyMf1gw.png)


Sau này, giao thức này trở nên phổ biến nhờ nhà cung cấp mail lớn nhất thế giới, Gmail, khuyên dùng thay vì POP3.

Port IMAP mặc định:
Port 143 – port không mã hóa

Port 993 – SSL/TLS port, cũng có thể được gọi là IMAPS

## 3 . Cách thức hoạt động của mail server

Giả sử rằng userA@exampleA.tst đang cố gắng gửi một email tới userB@exampleB.tst

Các sự kiện sau đây sẽ xảy ra tuần tự khi người dùng gởi mail:

![anh5](https://imgur.com/MkQgkL3.png)


- Bước 1

Sau khi tạo và gửi email, email của bạn sẽ kết nối với Server SMTP mang tên miền của mình. SMTP sẽ đặt tên cho tất cả mọi thứ, ví dụ: smtp.tenmien.com.

- Bước 2

Email của bạn sẽ "giao tiếp" với SMTP server. Và cung cấp cho SMTP Server mọi thông tin như: địa chỉ mail người gửi, địa chỉ mail người nhận, nội dung email và file đính kèm.

- Bước 3

Tại đây có 2 trường hợp xảy ra:

Trường hợp 1: Tên miền (domain email) của người gửi và người nhận giống nhau. 

tenemail_1@tenmienA.com tới tenemail_2@tenmienA.com. Mail này sẽ được gửi trực tiếp đến POP3 hoặc IMAP Server có tên miền của bạn. 

Trường hợp 2: Tên miền của người gửi và người nhận khác

tenemail_1@tenmienA.com tới tenemail_2@tenmienB.com. SMTP Server sẽ phải "liên lạc" với một server tên miền khác.

- Bước 4

Để tìm ra Server của người nhận, SMTP Server của người gửi sẽ phải giao tiếp với DNS (Domain Name Server). 

DNS sẽ lấy thông tin tên miền người nhận và dịch trang địa chỉ IP. 

SMTP Server người gửi không thể thực hiện gửi email chính xác mà chỉ dựa trên tên miền thêm vào đó sẽ là địa chỉ IP. Địa chỉ IP (đơn nhất) sẽ giúp SMTP hoạt động chính xác và hiệu quả hơn.

- Bước 5

Sau khi có địa chỉ IP của người nhận, tức STMP người gửi đã có thể kết nối STMP Server người nhận.

- Bước 6

SMTP server người nhận sẽ quét (scan) thư gửi đến. Nếu nhận ra tên miền và tên người gửi, nó sẽ chuyển tiếp (forward) mail thuộc POP3 hoặc IMAP server mang tên miền của bạn. 

Từ đây, email đã được gửi đến mục hộp thư đến của người nhận.


## 4 . Ưu điểm của POP3 và Imap

1. Ưu điểm của POP3
Là giao thức thời đầu, POP tuân theo một ý tưởng đơn giản là chỉ một máy khách yêu cầu truy cập mail trên server và việc lưu trữ mail cục bộ là tốt nhất. Điều này dẫn tới những ưu điểm sau:
- Mail được lưu cục bộ, tức luôn có thể truy cập ngay cả khi không có kết nối Internet.

- Kết nối Internet chỉ dùng để gửi và nhận mail.
- Tiết kiệm không gian lưu trữ trên server.
- Được lựa chọn để lại bản sao mail trên server.
- Hợp nhất nhiều tài khoản email và nhiều server vào một hộp thư đến.


## 2. IMAP có những ưu điểm như sau:

- Mail được lưu trên server đầu xa, tức có thể truy cập từ nhiều địa điểm khác nhau.
- Cần kết nối Internet để truy cập mail.
- Xem nhanh hơn khi chỉ có các tiêu đề mail được tải về đến khi nội dung được yêu cầu rõ ràng.
- Mail được dự phòng tự động trên server.
- Tiết kiệm không gian lưu trữ cục bộ.
Vẫn cho phép lưu mail cục bộ.


- Chọn POP nếu:

  - Bạn muốn truy cập mail chỉ từ một thiết bị.
  - Bạn cần truy cập email thường xuyên dù có kết nối Internet hay không.
  - Không gian lưu trữ trên server hạn chế.


- Chọn IMAP nếu:

  - Bạn muốn truy cập email từ nhiều thiết bị khác nhau.
  - Bạn có một kết nối Internet thường xuyên và tin cậy.
  - Bạn muốn xem nhanh các email mới hoặc những email trên server.
  - Không gian lưu trữ cục bộ hạn chế.
  - Bạn lo lắng về vấn đề dự phòng dữ liệu.