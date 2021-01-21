# https và SSL

![anh2](https://image.prntscr.com/image/N7H8mddkQwGDSMSpjBl4ow.png)

## Tổng quan

- Http và https là 2 protocol chúng ta thường gặp khi truy cập vào một trang web. Hầu hết chúng ta đều hiểu https bảo mật hơn http. Hôm nay mình sẽ giải thích bản chất, cơ chế và cách config một trang web https.

## Http và https

- http là tên viết tắt của HyperText Transfer Protocol (giao thức truyền tải siêu văn bản), là một giao thức cơ bản dùng cho World Wide Web (www) để truyền tải dữ liệu dưới dạng văn bản, hình ảnh, video, âm thanh và các tập tin khác từ Web server đến các trình duyệt web và ngược lại.

- https là viết tắt của từ HyperText Transfer Protocol Secure và chính là giao thức HTTP có sử dụng thêm các chứng chỉ SSL (Secure Sockets Layer) giúp mã hóa dữ liệu truyền tải nhằm gia bảo mật giữa Web sever đến các trình duyệt web. Nói cách khác https là phiên bản httpnhưng an toàn hơn, bảo mật hơn. Việc bảo mật thông tin riêng tư, cá nhân là rất quan trọng. Do đó có rất nhiều website đã sử dụng https thay http. Các trình duyệt web như Firefox, Chrome và IE như hiện nay đều hiển thị biểu tượng ổ khóa ở thanh địa chỉ để cho biết giao thức https có hoạt động trên trang web bạn truy cập vào hay không.

Cơ chế của SSL ứng dụng trong HTTPS.
SSL là gì?
Việc kết nối giữa một Web browser tới bất kỳ điểm nào trên mạng Internet đi qua rất nhiều các hệ thống độc lập mà không có bất kỳ sự bảo vệ nào với các thông tin trên đường truyền. Không một ai kể cả người sử dụng lẫn Web server có bất kỳ sự kiểm soát nào đối với đường đi của dữ liệu hay có thể kiểm soát được liệu có ai đó thâm nhập vào thông tin trên đường truyền.

Để bảo vệ những thông tin mật trên mạng Internet hay bất kỳ mạng TCP/IP nào, SSL đã kết hợp những yếu tố sau để thiết lập được một giao dịch an toàn:

- Xác thực: đảm bảo tính xác thực của trang mà khách hàng sẽ làm việc ở đầu kia của kết nối. Cũng như vậy, các trang Web cũng cần phải kiểm tra tính xác thực của người sử dụng.

- Mã hoá: đảm bảo thông tin không thể bị truy cập bởi đối tượng thứ ba. Để loại trừ việc nghe trộm những thông tin “nhạy cảm” khi nó được truyền qua Internet, dữ liệu phải được mã hoá để không thể bị đọc được bởi những người khác ngoài người gửi và người nhận.

- Toàn vẹn dữ liệu: đảm bảo thông tin không bị sai lệch và nó phải thể hiện chính xác thông tin gốc gửi đến.Với việc sử dụng SSL, các Web site có thể cung cấp khả năng bảo mật thông tin, xác thực và toàn vẹn dữ liệu đến người dùng. SSL được tích hợp sẵn vào các browser và Web server, cho phép người sử dụng làm việc với các trang Web ở chế độ an toàn.

## Cách hoạt động giữa client và server sử dụng SSL.

![anh1](https://image.prntscr.com/image/fYW3IU5NSzqIqNOAc3XLFg.png)

Đơn giản chúng ta có ví dụ: 
1. A cần bán hàng cho anh B sẽ có các thủ tục sau:

2. B yêu cầu A gửi cho mình chứng minh thư
3. A đưa chứng minh thư cho B
4. B mang lên cơ quan công an nhờ xác nhận xem có phải là đúng là ông A không?
Nếu xác nhận ok, thì B báo cho A biết là ok
5. A gửi cho B một key
6. B và A sẽ dùng key này để mã hóa thông tin trao đổi với nhau

Qua ví dụ trên thì:

- A là server, B là client
- Chứng minh thư là chính chỉ SSL
- Cơ quan công an là tổ chức CA (Certification Authority); là một tổ chứng mà 2 ông A, B đều tin cậy, là người cấp SSL
- Nếu ông C mà nghe lén được thông tin của A, B thì cũng không giải mã được vì không có key

Có 2 cách tạo SSL:

- Nhờ một tổ chức CA cấp, là tổ chức có độ tin cậy cao, được quyền cấp và chứng nhận SSL. Tất nhiên là chúng ta phải mất tiền để mua chứng chỉ SSL.

- Self-signed SSL: là tự server cấp, tự kí, tự xác thực (ko an toàn và tin tưởng bằng nhờ bên thứ 3)