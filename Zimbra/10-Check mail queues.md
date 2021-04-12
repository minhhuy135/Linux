# Giám sát hàng đợi thư

Nếu bạn đang gặp sự cố với việc gửi thư, bạn có thể xem hàng đợi thư từ trang Bảng điều khiển quản trị Giám sát Hàng đợi Thư để xem liệu bạn có thể khắc phục sự cố gửi thư hay không. Khi bạn mở hàng đợi thư, bạn có thể xem nội dung của hàng đợi Hoãn, Đến, Hoạt động, Giữ và Lỗi tại thời điểm đó. Bạn có thể xem số lượng tin nhắn và nơi chúng đến và sẽ đến. Để biết mô tả về các hàng đợi này

-  Trang Hàng đợi Thư
![anh1](https://image.prntscr.com/image/bAtibxvsQbmBekZHIorXuQ.png)

Đối với mỗi hàng đợi, ngăn Tóm tắt hiển thị tóm tắt các thông báo theo miền người nhận, IP gốc, miền người gửi, địa chỉ người nhận, địa chỉ người gửi và đối với hàng đợi Đã hoãn, theo loại lỗi. Bạn có thể chọn bất kỳ bản tóm tắt nào để xem thông tin chi tiết về phong bì theo tin nhắn trong ngăn Tin nhắn.
Ngăn Thư hiển thị thông tin phong bì thư riêng lẻ cho các bộ lọc tìm kiếm được chọn từ ngăn Tóm tắt.
Các chức năng Hàng đợi Hộp thư sau có thể được thực hiện cho tất cả các thư trong một hàng đợi:

- Hold (Giữ) :  để di chuyển tất cả thư trong hàng đợi đang được xem sang hàng đợi Giữ. Thư vẫn ở trong hàng đợi này cho đến khi quản trị viên di chuyển chúng.

- Release(nhả) : để xóa tất cả thư khỏi hàng đợi Giữ. Thư được chuyển đến hàng đợi Đã hoãn.

- Requeue(Xếp lại hàng) : tất cả các thư trong hàng đợi đang được xem. Thư xếp hàng lại có thể được sử dụng để gửi thư bị hoãn lại do sự cố cấu hình đã được khắc phục. Tin nhắn được đánh giá lại và các hình phạt trước đó sẽ bị lãng quên.

	
- Delete(xóa) : tất cả các tin nhắn trong hàng đợi đang được xem.

Các ID tệp hàng đợi Zimbra MTA, Postfix được sử dụng lại. Nếu bạn xếp hàng lại hoặc xóa thư, hãy lưu ý thông tin phong bì thư, không phải ID hàng đợi. Có thể khi bạn làm mới hàng đợi thư, ID hàng đợi có thể được sử dụng trên một thư khác.


# II. Nhận và gửi thư qua Zimbra MTA

- Zimbra MTA cung cấp cả thư đến và thư đi. Đối với thư đi, zimbra MTA xác định điểm đến của địa chỉ người nhận. Nếu máy chủ đích là cục bộ, thông báo sẽ được chuyển đến máy chủ zimbra để gửi. Nếu máy chủ đích là máy chủ thư từ xa, Zimbra MTA phải thiết lập phương thức giao tiếp để chuyển thư đến máy chủ từ xa. Đối với các thư đến, MTA phải có khả năng chấp nhận các yêu cầu kết nối từ các máy chủ thư từ xa và nhận thư cho người dùng cục bộ.
- Để gửi và nhận email, Zimbra MTA phải được định cấu hình trong DNS với cả bản ghi A và bản ghi MX . Để gửi thư, MTA sử dụng DNS để phân giải tên máy chủ và thông tin định tuyến email. Để nhận thư, bản ghi MX phải được định cấu hình chính xác để định tuyến thư đến máy chủ thư.
- Bạn phải định cấu hình một máy chủ chuyển tiếp nếu bạn không bật DNS. Ngay cả khi máy chủ chuyển tiếp được định cấu hình, bản ghi MX vẫn được yêu cầu nếu máy chủ sẽ nhận email từ internet.

## 1. Hàng đợi tin nhắn Zimbra MTA
- Khi Zimbra MTA nhận được thư, nó sẽ định tuyến thư qua một loạt các hàng đợi để quản lý việc gửi. Zimbra MTA duy trì bốn hàng đợi nơi thư được tạm thời đặt trong khi được xử lý: đến, hoạt động, hoãn lại và giữ.

![anh1](https://image.prntscr.com/image/GmIUuy-sT2mqiN-uZt8nZg.png)


Incoming : Hàng đợi thư đến chứa thư mới đã được nhận. Mỗi thư được xác định bằng một tên tệp duy nhất. Thư trong hàng đợi đến được chuyển đến hàng đợi hiện hoạt khi có chỗ trong hàng đợi hiện hoạt. Nếu không có vấn đề gì, tin nhắn sẽ di chuyển qua hàng đợi này rất nhanh.

Active : Hàng đợi tin nhắn đang hoạt động chứa các tin nhắn đã sẵn sàng được gửi đi. MTA đặt giới hạn cho số lượng thư có thể có trong hàng đợi hoạt động tại một thời điểm bất kỳ. Từ đây, thư được chuyển đến và đi từ bộ lọc chống vi-rút và chống thư rác trước khi được gửi hoặc chuyển đến hàng đợi khác.

Deferred : Tin nhắn không thể gửi được vì một lý do nào đó được đưa vào hàng đợi hoãn lại. Lý do phân phối không thành công được ghi lại trong một tệp trong hàng đợi hoãn lại. Hàng đợi này được quét thường xuyên để gửi lại tin nhắn. Nếu tin nhắn không thể được gửi sau số lần gửi đã đặt, thì tin nhắn sẽ không thành công. Thư được trả lại cho người gửi ban đầu. Mặc định cho thời gian tồn tại của hàng thoát là 5 ngày. Bạn có thể thay đổi giá trị MTA mặc định cho bounce_queue_lifetime từ CLI zmlocalconfig .

Hold : Hàng đợi thư lưu giữ thư không thể xử lý được. Thư vẫn ở trong hàng đợi này cho đến khi quản trị viên di chuyển chúng. Không có nỗ lực gửi định kỳ nào được thực hiện cho các thư trong hàng đợi.

Corrupt : Hàng đợi bị hỏng lưu trữ các thư không đọc được bị hỏng.
Bạn có thể theo dõi các hàng đợi thư để tìm các sự cố gửi từ bảng điều khiển quản trị


# III. Cách kiểm tra trạng thái hàng đợi để giữ, hoãn lại và hoạt động

- Cách kiểm tra trạng thái hàng đợi để giữ, hoãn lại, đang hoạt động

Để kiểm tra tất cả các chi tiết hàng đợi như sau với root
```
[root @ mail lqs] # / opt / zimbra / libexec / zmqstat
```
hold = 0 fail
= 0
deferred = 0
active = 0
incoming = 0

- Để kiểm tra trạng thái hàng đợi thư hiện tại
```
[root @ mail lqs] # su zimbra
[zimbra @ mail lqs] $ / opt / zimbra / common / sbin / postqueue -p
```
Hàng đợi thư trống

- Để xóa hàng đợi Postfix
```
[root @ mail lqs] $ / opt / zimbra / common / sbin / postqueue -f
```
- Để xếp hàng lại các tin nhắn trong Postfix
```
[root @ mail lqs] $ / opt / zimbra / common / sbin / postsuper -r TẤT CẢ
```
- Để kiểm tra tin nhắn lưu giữ hiện tại
```
[root @ mail lqs] # / opt / zimbra / common / sbin / postsuper -h TẤT CẢ
```
- Để xóa một tin nhắn khỏi hàng đợi
```
[root @ mail lqs] # / opt / zimbra / common / sbin / postsuper -d [MSGID From postqueue -p]
```
- Để xóa TẤT CẢ tin nhắn khỏi hàng đợi
```
[root @ mail lqs] # / opt / zimbra / common / sbin / postsuper -d TẤT CẢ
```
- Để xóa TẤT CẢ tin nhắn khỏi hàng đợi hoãn lại
```
[root @ mail lqs] # / opt / zimbra / common / sbin / postsuper -d TẤT CẢ
```
 hoãn lại

Để xóa TẤT CẢ Tin nhắn khỏi Hàng đợi Giữ

[root @ mail lqs] # / opt / zimbra / common / sbin / postsuper -d TẤT CẢ lưu giữ