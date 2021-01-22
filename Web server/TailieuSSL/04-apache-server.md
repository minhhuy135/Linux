# Apache là gì? Apache Web Server

![anh1](https://image.prntscr.com/image/rdw_KDPiTh_8cMMrFwZXmA.png)

Apache là phần mềm web server miễn phí mã nguồn mở
Nó giúp chủ website đưa nội dung lên web – vì vậy có tên gọi là “web server”

Khi một người truy cập vào website của bạn, họ sẽ điền tên miền vào thanh địa chỉ. Sau đó, web server sẽ chuyển những files được yêu cầu xuống như là một nhân viên chuyển hàng ảo.

## Web Server là gì?

File servers, database servers, mail servers, và web servers sử dụng nhiều phần mềm server khác nhau. Từng ứng dụng sẽ truy cập files riêng lưu trên server vật lý và dùng chung cho các mục đích khác nhau.

Nhiệm vụ của web server là đưa website lên internet. Để làm được điều đó, nó hoạt động giống như là một người đứng giữa server và máy khách (client). Nó sẽ kéo nội dung từ server về cho mỗi một truy vấn xuất phát từ máy khách để hiển thị kết quả tương ứng dưới hình thức là một website.


## Apache Web Server hoạt động như thế nào?

Mặc dù chúng ta gọi Apache là web server, nhưng nó lại không phải là server vật lý, nó là một phần mềm chạy trên server đó. Công việc của nó là thiết lập kết nối giữa server và trình duyệt người dùng (Firefox, Google Chrome, Safari,...) rồi chuyển file tới và lui giữa gchúng (cấu trúc 2 chiều dạng client-server).

Khi một khách truy cập tải một trang web trên website của bạn, ví dụ, trang chủ “About Us”,trình duyệt người dùng sẽ gửi yêu cầu tải trang web đó lên server và Apache sẽ trả kết quả với tất cả đầy đủ các file cấu thành nên trang About Us (hình ảnh, chữ, vâng vâng). Server và client giao tiếp với nhau qua giao thức HTTP và Apache chịu trách nhiệm cho việc đảm bảo tiến trình này diễn ra mượt mà và bảo mật giữa 2 máy.

## Ưu điểm và khuyết điểm của Apache

Apache web server là lựa chọn ưu việc để vận hành một website ổn định và có thể tùy chỉnh linh hoạt. Tuy nhiên, nó cũng có một số điểm bất lợi mà bạn nên biết.

1. Ưu điểm:

Phần mềm mã nguồn mở và miễn phí, kể cả cho mục đích thương mại.
Phần mềm đáng tin cậy, ổn định.
Được cập nhật thường xuyên, nhiều bản vá lỗi bảo mật liên tục.
Linh hoạt vì có cấu trúc module.
Dễ cấu hình, thân thiện với người mới bắt đầu
Đa nền tảng (hoạt động được cả với server Unix và Windows).
Hoạt động cực kỳ hiệu quả với WordPress sites.
Có cộng đồng lớn và sẵn sàng hỗ trợ với bất kỳ vấn đề nào.
2. Nhược điểm:

- Gặp vấn đề hiệu năng nếu website có lượng truy cập cực lớn.

- Quá nhiều lựa chọn thiết lập có thể gây ra các điểm yếu bảo mật.