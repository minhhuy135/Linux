# Tổng quan về DHCP

## 1. Khái niệm

- DHCP (Dynamic Host Configuration Protocol) là giao thức cấu hình host động. Nó cung cấp cho máy tính địa chỉ ip ; subnet mask; default gateway. Và nó thường được cấp phát bởi DHPC server được tích hợp sẵn trên router.

- DHCP giao tiếp bằng UDP và sử dụng port 67 và 68. DHCP server sử dụng port 67 để nghe thông tin từ các client và sử dụng port 68 để reply thông tin

- Ưu điểm khi sử dụng DHCP

    - Tập trung quản trị thông tin cấu hình host

    - Cấu hình động các máy

    - Cấu hình IP cho các máy một cách liền mạch.

    - Sự linh hoạt

    - Đơn giản hóa vài trò quản trị của việc cauas hình địa chỉ IP của client.

    - Sự linh hoạt

- DHCP làm việc theo mô hình client server và thành phần chính của DHCP là:

    - DHCP client: Là thiết bị dùng để kết nối vào mạng

    - DHCP server: Là thiết bị dùng để cấp phát địa chỉ cho client

<img src="https://imgur.com/Q93mSGj.png">

## 2. Nguyên lý hoạt động của DHCP

- Thành phần chính của DHCP bao gồm 4 bản tin:

    - DISCOVERY

    - OFFER

    - REQUEST

    - ACK

- Quá trình cấp phát địa chỉ IP trong giao thức DHCP bao gồm các bước sau : 
    
    <img src="https://imgur.com/1rexBMa.png">

    -  Đầu tiên máy client sẽ gửi đi 1 gói tin quảng bá tên là DHCP discover, nhằm yêu cầu cho việc lấy các thông tin cấu hình IP address, subnet mask, defaut getway, preferred DNS ….. lúc này, vì clinet chưa có địa chỉ ip cho nên nó sẽ dùng một địa chỉ source (nguồn) là 0.0.0.0, đồng thời cũng không biết một địa chỉ broadcast là 255.255.255.255 và sau đó gói tin DHCP Discover này sẽ quảng bá đi toàn mạng. gói tin này chứa một địa chỉ MAC  (là địa chỉ mà mỗi một card mạng được nhà sản xuất cấp cho là mã để phân biệt các card mạng với nhau). Ngoài ra nó còn chứa tên của máy client để server có thể biết được client nào gởi yêu cầu đến.

    - Sau khi nhận được gói tin DHCP Discover của client, nếu có một DHCP server hợp lệ (nghĩa là nó có khả năng cung cấp địa chỉ IP cho client) thì nó sẽ trả lời lại bằng một goí tin DHCP offer. gói tin này chứa một địa chỉ ip đề nghị cho thuê trong một khoảng thời gian nhất định (mặc định là 8 ngày, sau một khoảng thời gian 50% tức 4 ngày, nó sẽ tự thu hồi IP address đã cấp nếu như client không sử dụng) kèm theo là địa chỉ MAC của client được cấp, một subnet mask và địa chỉ IP của DHCP server đã cấp phát. trong thời gian này server sẽ không cấp phát địa chỉ IP vừa đề nghị cho một client nào khác. 
    
    - Máy client sau khi nhận được những lời đề nghị là gói tin DHCP Offer trên mạng ( trường hợp trong mạng có nhiều hơn 1 DHCP server) sẽ tiến hành chọn lọc một gói tin phù hợp và sau đó phản hồi lại bằng một gói tin là DHCP Request (bao gồm thông tin về DHCP server cấp phát địa chỉ cho nó) để chấp nhận lời đề nghị đó. Điều này giúp cho việc các gói tin còn lại không được chấp nhận sẽ được các server rút lại và dùng để cấp phát cho client khác.

    -  Khi DHCP server nhận được DHCP request, nó sẽ trả lời lại DHCP client bằng gói tin là DHCP Ack nhằm mục đích thông báo là đã chấp nhận cho DHCP client đó thuê địa chỉ IP. Gói tin này bao gồm địa chỉ IP và các thông tin cấu hình khác (DNS server, Wins server….) cuối cùng client nhận được gói DHCP Ack thì cũng có nghĩa là kết thúc quá trình thuê và cấp phát địa chỉ IP và địa chỉ IP này chính thức được client sử dụng

# II. Phân tích gói tin bằng WireShark và Tcpdump

# 1. Phân tích gói tin DHCP bằng Wireshark

- Wireshark, hay còn gọi là Ethereal, công cụ này có lẽ không quá xa lạ với phần lớn người sử dụng chúng ta, vốn được xem là 1 trong những ứng dụng phân tích dữ liệu hệ thống mạng, với khả năng theo dõi, giám sát các gói tin theo thời gian thực, hiển thị chính xác báo cáo cho người dùng qua giao diện khá đơn giản và thân thiện. Trong bài viết dưới đây, chúng tôi sẽ giới thiệu với các bạn một số đặc điểm cơ bản cũng như cách dùng, phân tích và kiểm tra hệ thống mạng bằng Wireshark.
- Sau đây là những ví dụ về sử dụng wireshark để bắt gói tin DHCP

![anh4](https://image.prntscr.com/image/mGlXrGfCTKeD4XkY5rBM0w.png)

- DHCP ACK

![anh2](https://image.prntscr.com/image/fJPt4Ke0SQu2aQBZt-mYSA.png)

  - option (53): Kiểu tin nhắn. - option (54): DHCP server - option (51): thời gian cấp địa chỉ IP. - option (1) : subnet mask. - option (28): địa chỉ broacast. - option (15): Domain Name. - option (6) : DNS. - option (3) : Deafault gateway.

- DHCP request

![anh3](https://image.prntscr.com/image/zI1nfeEtTu_0iMd4smadZw.png)

- option (53): Kiểu tin nhắn. - option (54): DHCP server - option (50): địa chỉ IP yêu cầu (192.168.18.169) - option (55): Danh sách tham số yêu cầu

- DHCP Offer

![anh4](https://image.prntscr.com/image/WmzeQtblTJCNpEjVyYiu0g.png)

- option (53): Kiểu tin nhắn. - option (54): DHCP server - option (51): thời gian cấp địa chỉ IP. - option (1) : subnet mask. - option (28): địa chỉ broacast. - option (15): Domain Name. - option (6) : DNS. - option (3) : Deafault gateway.

- DHCP Discover

![anh6](https://image.prntscr.com/image/5iUyWSX-QPqnMxbA9V0fvw.png)

option (53): Kiểu tin nhắn.
option (55): Danh sách tham số yêu cầu

# 2. Phân tích gói tin DHCP bằng TCPDUMP

TCPDUMP là gì ?

- TCPDUMP thực chất là công cụ được phát triển nhằm mục đích nhận diện và phân tích các gói dữ liệu mạng theo dòng lệnh. TCPDUMP cho phép khách hàng chặn và hiển thị các gói tin được truyền đi hoặc được nhận trên một mạng có sự tham gia của máy tính.

- Hiểu đơn giản, TCPDUMP là phần mềm bắt gói tin trong mạng làm việc trên hầu hết các phiên bản hệ điều hành unix/linux. Tcpdump cho phép bắt và lưu lại những gói tin bắt được, từ đó chúng ta có thể sử dụng để phân tích.

- TCPDUMP được xem là trụ cột trong việc gỡ rối và kiểm tra vấn đề kết nối mạng và bảo mật.

- Các hình thức tồn tại của TCPDUMP 
  - TCPDUMP xuất ra màn hình nội dung các gói tin (chạy trên card mạng mà máy chủ đang lắng nghe) phù hợp với biểu thức logic chọn lọc mà khách hàng nhập vào. Với từng loại tùy chọn khác nhau khách hàng có thể xuất những mô tả về gói tin này ra một file “pcap” để phân tích sau, và có thể đọc nội dung của file “pcap” đó với option –r của lệnh tcpdump, hoặc sử dụng các phần mềm khác như là : Wireshark.

- Sau khi kết thúc việc bắt các gói tin, tcpdump sẽ báo cáo các cột sau:
  - Packet capture: số lượng gói tin bắt được và xử lý.
  - Packet received by filter: số lượng gói tin được nhận bởi bộ lọc.
  - Packet dropped by kernel: số lượng packet đã bị dropped bởi cơ chế bắt gói tin của hệ điều hành.
-  Các tùy chọn thường được sử dụng trong TCPDUMP
    - -X : Hiển thị nội dung của gói theo định dạng ASCII và HEX
    - -XX : Tương tự -X, hiển thị giao diện ethernet
    - -D : Liệt kê các giao diện mạng có sẵn
    - -l : Đầu ra có thể đọc được dòng (để xem khi bạn lưu hoặc gửi đến các lệnh khác)
    - -t : Cung cấp đầu ra dấu thời gian có thể đọc được của con người
    - -q : Ít dài dòng hơn với đầu ra
    - -tttt : Cung cấp đầu ra dấu thời gian tối đa có thể đọc được của con người
    - -i : Bắt lưu lượng của một giao diện cụ thể
    - -vv : Đầu ra cụ thể và chi tiết hơn (nhiều v hơn cho đầu ra nhiều hơn)
    - s : Xác định snaplength(kích thước) của gói tin theo byte. Sử dụng -s0 để có được mọi thứ. Nếu không set size packet dump thành unlimit, thì khi tcpdump ra nó bị phân mảnh
    - -c : Chỉ nhận được x số gói và sau đó dừng lại
    - -S : In số thứ tự tuyệt đối
    - -e : Nhận tiêu đề ethernet
    - -q : Hiển thị ít thông tin giao thức
    - -E : Giải mã lưu lượng IPSEC bằng cách cung cấp khóa mã hóa

### Dùng TCPDUMP bắt gói tin DHCP

- Cài đặt TCPDUMP bằng câu lệnh sau
```
yum install tcpdump
```
- Thực hiện bắt gói tin DHCP
```
tcpdump -nni ens33 -n port 67 and port 68
```

![anh7](https://image.prntscr.com/image/W0giiNkJSSanPcp_r_PvHA.png)

- Từ hình trên ta có thể thấy Tcpdump bắt được 4 gói tin:
  - Client gửi gói tin DHCP Discover ra toàn mạng, do chưa có địa chỉ IP nên client dùng địa chỉ nguồn 192.168.159.140 ra toàn mạng. Gói tin này chưa có địa chỉ MAC của client.
  - DHCP server nhận được gói tin DHCP Discover, DHCP server sẽ gửi cho client 1 gói tin DHCP offer, gói tin này chưa địa chỉ IP cho thuê một khoảng thời gian nhất định.
  - Client nhận được gói tin DHCP offer, client sẽ gửi trả một gói tin DHCP requet để thông báo cho DHCP server sẽ nhận địa chỉ IP này.
  - DHCP server nhận được gói tin DHCP request, DHCP sẽ gửi gói tin DHCP ACK nhằm thông báo chấp nhận client sử dụng địa chỉ Ip vừa cấp.

# Nguồn tham khảo
https://github.com/phancong0897/Congphan/blob/master/DHCP/DHCP-with-wireshark-and-tcpdump.md