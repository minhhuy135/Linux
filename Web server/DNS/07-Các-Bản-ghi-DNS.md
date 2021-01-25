# Bản ghi DNS là gì?

Bản ghi DNS (hay còn gọi là tệp vùng) là các hướng dẫn nằm trong máy chủ DNS có thẩm quyền và cung cấp thông tin về miền bao gồm địa chỉ IP nào được liên kết với miền đó và cách xử lý các yêu cầu cho miền đó. Các bản ghi này bao gồm một loạt các tệp văn bản được viết bằng cú pháp DNS. Cú pháp DNS chỉ là một chuỗi ký tự được sử dụng làm lệnh cho máy chủ DNS phải làm gì. Tất cả các bản ghi DNS cũng có ' TTL ', viết tắt của thời gian tồn tại và cho biết tần suất máy chủ DNS sẽ làm mới bản ghi đó.

Bạn có thể nghĩ về một tập hợp các bản ghi DNS giống như danh sách doanh nghiệp trên Yelp. Danh sách đó sẽ cung cấp cho bạn một loạt thông tin hữu ích về một doanh nghiệp như vị trí, giờ làm việc, các dịch vụ được cung cấp, v.v. Tất cả các miền được yêu cầu có ít nhất một vài bản ghi DNS cần thiết để người dùng có thể truy cập trang web của họ bằng cách sử dụng tên miền và có một số bản ghi tùy chọn phục vụ các mục đích bổ sung.

## Các loại bản ghi DNS phổ biến

1. Bản ghi SOA - Lưu trữ thông tin quản trị về một miền

### Bản ghi DNS SOA là gì?

DNS - Domain Name System ( hệ thống phân giải tên miền)
là 1 hệ thống cho phép thiết lập tương ứng giữa địa chỉ IP và tên miền trên Internet.

Nhiệm vụ cơ bản của DNS là ` dịch ` một tên miền (vd :zaraoder.xyz) thành địa chỉ (vd: 45.77.251.173) mà các máy tính sử dụng để nhận dạng chính xác nhau trên hệ thống mạng toàn cầu

## Vậy DNS: SOA để làm gì ?
Bản ghi SOA (SOA Record) là chữ viết tắt của `Start of Authority` là thông tin xác nhận từ phía máy chủ tiếp nhận của tên miền

![anh1](https://image.prntscr.com/image/utHEPbcJTJG42vohpzAcsQ.png)

Thông thường mỗi tên miền sẽ sử dụng một cặp DNS nào đó đẻ trỏ về 1 hoặc nhiều máy chủ DNS. Sau đó , các máy chủ DNS có trách nhiệm cung cấp thông tin bản ghi DNS của hệ thống cho tên miền này để nó hoạt động . trong quá trình này , SOA được coi như dấu hiệu nhận biết của hệ thống về tên miền nà

# Cấu trúc SOA :

CÚ PHÁP :

[tên miền] IN SOA [tên-server-dns] [địa-chỉ-email](serial number;refresh number;retry number;experi number;time-to-live-number)

Ví dụ một cấu trúc SOA

ns1.somedomnain.co.uk abuse.somedomnain.co.uk 2006030501 28800 3600 604800 3600

![anh2](https://image.prntscr.com/image/88G31yftRJWBRAfnFOLTUg.png)

Trong đó :
 
 -ns1.somedomnain.co.uk : giá trị dns chính của tên miền hoặc máy chủ

 -abuse.somedomnain.co.uk chuyển đổi từ dạng  abuse@somedomnain.co.uk thể hiện chủ thể sở hữu tên miền này

- 2006030501 : Thời gian cập nhật DNS cho ten miền mới nhất

- 28800 : số giây trước khi bản ghi DNS được tự động cập nhật lại

- 3600 : số giây trước khi bản DNS bị lỗi không thể tự động cập nhật lại và cần lấy lại thông tin DNS lần tiếp theo

- 604800 : giới hạn thời gian tính bằng giây sau khi bản ghi DNS được gỡ bỏ trên server và không còn hiệu lực trên server

- 3600 : TTL xác định thời gian cache của bản ghi

# Lưu ý khi nhập cú pháp SOA

![anh3](https://image.prntscr.com/image/mUBIW6ZjQSCrTAIi5J6XAw.png)

- serial : hiển thị phiên bản (version) hay là số lần mà zone(khu) được thay đổi , cứ mỗi lần dữ liệu trong zone(khu) hay đổi thì con số này lại tăng lên . Nó được dùng để so sánh và nhật dữ liệu giữa các máy chủ secondary(thứ 2) DNS và máy chủ master . nếu serial của master server lớn hơn , máy secondary sẽ tiến hành cập nhật . serial áp dụng cho mọi dữ liệu trong zone và là một số nguyên . định dạng theo kiểu YYYYMMDDNN , trong đó YYYY là năm , MM là tháng DD là ngày , NN là số lần sửa đổi dữ liệu zone trong ngày .

- Refresh : chỉ ra khoảng thời gian máy chủ máy chủ Secondary(thứ 2) kiểm tra dữ liệu zone(khu) trên máy Primary(sơ cấp) để cập nhật nếu cần

- Retry : nếu máy chủ Secondary(thứ2) không kết nối được máy chủ Primary thong thời gian mô tả trong refresh (ví dụ máy chủ Primary bị shutdonw vào lúc nào đó thì máy chủ secondary phải tìm cách kết nối lại với máy chủ Primary theo mọt chu kỳ thời gian mô tả trong Retry . Thông thường giá trị này nhỏ hơn gái trị refresh )

- Expire : nếu sau khoảng thời gian này mà máy chủ Secondary không kết nối được với máy chủ Primary thì dữ liệu zone trên máy Secondary sẽ bị quá hạn

- TTL (time to live ): giá trị này áo dụng cho mọi record(ghi lại) trong zone(khu) và được đính kèm trong thông tin trả lời một truy vấn , múc đích của nó là chỉ ra thời gian mà các máy chủ name server khác cache lại thông tin trả lời .việc cache(bộ nhớ đệm) thông tin trả lời giúp giảm lưu lượng truy vấn DNS trên mạng