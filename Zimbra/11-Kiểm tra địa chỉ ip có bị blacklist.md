# Hướng dẫn xử lý và kiểm tra khi IP bị liệt vào danh sách Blacklist

## 1. Giới thiệu về Blacklist:

Thông thường các dịch vụ như  VPS, Server ... Các bạn thường phải tự thực hiện việc quản trị và vận hành toàn bộ hệ thống bên trong một cách ổn định. Tuy nhiên, nếu trường hợp  đặt ra là khách hàng quản lý không tốt Server có thể bị rơi vào tình trạng bị kẻ xấu lợi dụng vào phát tán thư rác (hay được gọi là spam mail) với số lượng lớn làm ảnh hưởng đến chất lượng dịch vụ. Ngoài ra trong trường hợp này các tổ chức hệ thống máy chủ lớn chuyên dụng về email như Yahoo, Gmail, Hotmail và các tổ chức thống kê máy chủ gửi thư rác chặn lại. Bài viết này sẽ giúp các bạn có thể tự nhận biết và kiểm tra cũng như gửi yêu cầu xóa bỏ IP của máy chủ ra khỏi danh sách chặn của các tổ chức trên.

Blacklist là tên thường gọi của các tổ chức thống kê các máy chủ gởi thư rác. Các tổ chức này là phi lợi nhuận, họ làm việc độc lập không chịu ảnh hưởng của bất kỳ cơ quan hay chính phủ nào. Họ dùng nhiều biện pháp để bắt được IP của bạn, đơn giản là:

Nhận thông tin từ các nhà cung cấp dịch vụ (ISP/HP) Email phối hợp

Các phản hồi từ người sử dụng đã từng nhận Email rác từ máy chủ của bạn (giống như bạn đánh dấu Spam/Junk trong Yahoo/Gmail/Hotmail)

Họ giăng bẫy (spam traps) bằng cách sử dụng nhiều địa chỉ ngẫu nhiên, nếu máy chủ của bạn gửi email vào những địa chỉ này thì đương nhiên được xem là thư rác.


Hiện tại có rất nhiều công cụ hỗ trợ khách hàng có thể tự kiểm tra IP của Server có bị liệt vào danh sách của tổ chức chống Spam mail hay không, sau đây là các công cụ phổ biến:

- MxToolBox: http://mxtoolbox.com/


Tại trang MxToolBox các bạn có thể chọn Tab Blacklist sau đó điền thông tin IP của Server vào và nhấn Blacklist Check để kiểm tra. Ví dụ chúng ta kiểm tra IP là: 103.159.50.188

![anh1](https://image.prntscr.com/image/SgKpfyJ-Si2kUFp0CmzEfQ.png)

Tại trang kiểm tra các blacklist: http://whatismyipaddress.com/

Tại trang whatismyipaddress có thể chọn Tab Blacklist Check sau đó điền thông tin IP của Server vào và Click Check Blacklists. Ví dụ chúng ta kiểm tra IP là: 103.159.50.188

![anh2](https://image.prntscr.com/image/fLt1b-R4S0aIBcuAtiygog.png)

Sau khi kiểm tra các bạn sẽ nhận thấy IP của Server của mình có bị liệt vào danh sách đen của tổ chức nào bằng cách phân biệt màu sắc như sau:

- Màu xanh: Nghĩa là tổ chức chống Spam mail không liệt IP của Server vào blacklist của tổ chức đó.

- Màu đỏ: Nghĩa là IP của khách hàng đã bị liệt vào danh sách blacklist của tổ chức đó