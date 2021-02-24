# Tổng quan về NTP
## I. Giới thiệu về NTP
### 1. NTP là gì
- Network Time Protocol (NTP) là một thuật toán phần mềm giữ cho các máy tính và các thiết bị công nghệ khác nhau có thể đồng bộ hóa thời gian với nhau. NTP đã đạt được thành công trong việc giữ các thiết bị đồng bộ hóa hiệu quả trong chỉ trong vài milliseconds (1/1000s), nhưng để có thể làm được điều này nó cần phải có một hệ thống thời gian đáng tin cậy để sử dụng làm điểm thời gian chính cho việc đồng bộ.
- NTP hoạt động bằng cách sử dụng một nguồn thời gian chính duy nhất (NTP Server), nó sử dụng để đồng bộ tất cả các thiết bị trên mạng.
- NTP là một trong những giao thức Internet lâu đời nhất vẫn còn được sử dụng (từ trước năm 1985). NTP được thiết kế đầu tiên bởi Dave Mills tại trường đại học Delaware, hiện ông vẫn còn quản lý nó cùng với một nhóm người tình nguyện.
- NTP sử dụng thuật toán Marzullo, và nó cũng hỗ trợ các tính năng như giây nhuận. NTPv4 thông thường có thể đảm bảo độ chính xác trong khoảng 10 mili giây (1/100s) trên mạng Internet công cộng, và có thể đạt đến độ chính xác 200 micro giây (1/5000s) hay hơn nữa trong điều kiện lý tưởng của môi trường mạng cục bộ.

### 2. NTP Server là gì?
- NTP Server là gì? Máy chủ NTP hay máy chủ thời gian là các thuật ngữ cùng mô tả một khái niệm: một thiết bị được sử dụng để nhận biết yêu cầu đồng bộ thời gian và phân phối tín hiệu thông tin thời gian. Thật ra, một máy chủ NTP Server cũng chỉ sử dụng Network Time Protocol (NTP), trong vô vàn các giao thức thời gian khác nhau tồn tại thì NTP được sử dụng phổ biến tới hơn 90%.
<img src="https://github.com/thang290298/work-Document/blob/master/Images/ntp/ntp-server.png?raw=true">
- Các tín hiệu thời gian được sử dụng bởi hầu hết các máy chủ NTP là nguồn thời gian UTC. UTC (Coordinated Universal Time) là thời gian toàn cầu dựa trên thời gian đồng hồ nguyên tử. Bằng cách sử dụng UTC, máy chủ NTP có thể tác động, đồng bộ hóa mạng cùng thời gian với hàng triệu mạng máy tính khắp nơi trên thế giới. Nếu không có UTC, nhiều giao dịch trực tuyến sẽ không thể nào thực hiện được. Như vậy là bạn đã thấy tầm quan trọng của UTC rồi đúng không nào.

- Tín hiệu thời gian có thể được nhận bởi NTP server hoặc (time server) qua một số cách như mạng Internet toàn cầu, thời gian của các quốc gia, tần số truyền (sóng dài) hoặc mạng GPS (hệ thống định vị toàn cầu). Khi nhận được tín hiệu, time server kiểm tra tính xác thực của tín hiệu này (trừ các nguồn internet không thể xác thực), đánh giá tính chính xác của nó và phân phối nó trong mạng.
### 3. Lợi ích của NTP server
#### 3.1 Backup dữ liệu theo lập lịch
- Backup dữ liệu rất quan trọng với bất kỳ tổ chức nào, nếu hệ thống quá sai về thời gian sẽ khiến việc sao lưu không chính xác.
#### 3.2 Tăng tốc độ mạng
- Nhiều thiết bị sử dụng cache và hệ thống tập tin diện rộng có thể dựa vào tem thời gian  (timestamp) để xác định phiên bản nào của đoạn dữ liệu ứng với thời điểm hiện tại. Đồng bộ thời gian không chính xác có thể khiến hệ thống như cache server hoạt động không chính xác, sử dụng sai phiên bản dữ liệu.

### 3.3 Hệ thống quản lý mạng
- Khi có vấn đề gì đó, việc kiểm tra log hệ thống là một phần chính của debug lỗi.
- Nhưng nếu thời gian trong những file log này không đồng bộ/không chính xác thì có thể bạn sẽ mất khoảng thời gian dài hơn để tìm ra nguyên nhân và khắc phục lỗi hệ thống.

### 3.3 Phân tích xâm nhập
- Trong trường hợp nếu có sự xâm nhập mạng trái phép, việc tìm hiểu xem mạng của bạn bị xâm nhập như thế nào và dữ liệu nào được truy cập có thể được kiểm tra rõ ràng nếu bạn có log thời gian chính xác việc login trên router hoặc máy chủ.
- Hacker thường sẽ xóa log nếu có, nhưng nếu họ không xóa thì bạn cần thời gian chính xác để chuẩn đoán đó.

### 3.5 Tuân thủ các quy định
- Sarbanes Oxley, HIPAA, GLBA và các quy định khác có thể sẽ cần trong tương lai vì vậy đòi hỏi thời gian chính xác trong các giao dịch cũng như dữ liệu.

## 4. NTP hoạt động như thế nào?
- Thời gian dưới dạng là timestamps (tạm dịch là tem thời gian), cung cấp một chuẩn duy nhất giữa tất cả các thiết bị trên mạng và cách mà một máy chủ NTP hoạt động thì khá đơn giản.

![anh3](https://image.prntscr.com/image/1aWWzmQ-RDSvQmiLhATX0g.png)


- NTP client gửi một gói tin trong đó chứa tem thời gian được chuyển tiếp đến máy chủ ở dạng số ngày càng tăng từ một điểm thời gian cố định trước đó (unixtime): ngày 1 tháng 1 năm 1990. - Máy chủ NTP sử dụng tem thời gian để tính toán, nếu thời gian trên mạng không khớp sẽ được cộng trừ thêm số giây để khớp với đồng hồ/máy chủ NTP cấp cao hơn đang tham chiếu. Sau đó gửi trả lại NTP client một gói tin khác, có thẻ thời gian là thời điểm nó gửi gói tin đó đi. - NTP client nhận được gói tin đó, tính toán độ trễ, dựa và thẻ thời gian mà nó nhận được cùng với độ trễ đường truyền, NTP client sẽ set lại thời gian của nó. - NTP chính xác trong khoảng 1/100s trên môi trường internet và thực hiện tốt hơn trên mạng LAN và WAN với độ chính xác là 1/5000s.

# II. Cài đặt và cấu hình Chrony làm NTP

Cấu hình timezone.
```
timedatectl set-timezone Asia/Ho_Chi_Minh
```
Kiểm tra timezone sau khi cài đặt.
```
timedatectl 
```
![anh4](https://image.prntscr.com/image/s1BvhZqYSx_vewkW3hp7bg.png)


Cấu hình allow Firewalld.
```
firewall-cmd --add-service=ntp --permanent 
firewall-cmd --reload 
```
Cấu hình disable SElinux.
```
sudo setenforce 0
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux
sed -i 's/SELINUX=permissive/SELINUX=disabled/g' /etc/sysconfig/selinux
```
# 3. Cài đặt Chrony trên cả 2 Server
Đối với CentOS/RHEL7 mặc dù trình đồng bộ và quản lý thời gian hiện tại mặc định là Chrony thay vì NTPD nhưng đa số Chrony lại không được tích hợp sẵn trong hệ điều hành lúc chúng ta cài đặt.

Truy cập vào SSH vào cả 2 Server. Sau đó chúng ta tiến hành cài đặt Chrony.
```
yum install -y chrony
```
Sau khi cài đặt chúng ta tiến hành start Chrony và cho phép khởi động cùng hệ thống.
```
systemctl enable --now chronyd
```
Kiểm tra  dịch vụ đang hoạt động.
```
systemctl status chronyd
````
Kết quả:


![anh6](https://image.prntscr.com/image/xXoCulRPRYGaeAs6FDiaNQ.png)

Mặc định trên CentOS/RHEL7 file cấu hình của Chrony nằm ở /etc/chrony.conf, tiến hành kiểm tra file cấu hình.
```
cat /etc/chrony.conf | egrep -v '^$|^#'
```
![anh7](https://image.prntscr.com/image/TbJcZTlATsKCyNGUdbjWHw.png)


Trong đó:

- server Xác định các NTP Server bạn muốn sử dụng.
- prefer Đối với nhiều NTP Server chúng ta có thể chỉ đinh ưu tiên kết nối từ NTP Server nào trước thay vì để hệ thống tự lựa chọn VD: server 2.centos.pool.ntp.orf iburst prefer
- driftfile  File lưu trữ  tốc độ mà đồng hồ hệ thống tăng / giảm thời gian.
- makestep Cho phép đồng hồ hệ thống không cập nhật trong 3 bản cập nhật đầu tiên nếu độ lệch của nó nó lơn hơn 1s.
- rtcsync Cho phép đồng bộ hóa kernel của đồng hồ thời gian thực (RTC).
- logdir Vị trí file log

Các cấu hình bổ sung:

- hwtimestamp Cho phép đánh dấu thời gian phần cứng trên tất cả các interface hỗ trợ nó.
- minsources Tăng số lượng tối thiểu các nguồn có thể chọn cần thiết để điều chỉnh đồng hồ hệ thống
- allow Cho phép Client truy cập NTP từ mạng cục bộ.
- keyfile Tệp có chứa mật khẩu để xác thực kết nối giữa Client và Server cho phép chronyc đăng nhập vào chronyd và thông báo cho chronyd về sự hiện diện của liên kết với Internet.
- generatecommandkey Tạo mật khẩu ngẫu nhiên tự động khi bắt đầu chronyd đầu tiên. VD: keyfile /etc/chrony.keys generatecommandkey
- log Log file

# 4. Cấu hình Chrony làm NTP Server

Chrony cho phép chúng ta cấu hình Server thành một NTP Server. Việc này phù hợp cho các mô hình mạng LAN có nhiều máy kết nối. Thay vì phải tốn thời gian đồng bộ từ Internet thì chúng ta có thể cấu hình 1 Server làm NTP Server Local và các máy còn lại sẽ đồng bộ thời gian từ NTP Server này về.

Để lựa chọn pool đồng bộ thời gian chúng ta có thể truy cập vào NTP Pool để lựa chọn NTP Server. Ở đây chúng ta giữ nguyên đồng bộ từ centos.pool.ntp.org.

Tại Server 192.168.159.139 là Server sẽ làm NTP Server.  Chúng ta sẽ cấu hình bổ sung cấu hình cho phép các máy Client 192.168.159.143 phía trong có thể đồng bộ thời gian từ Server này.

```
sed -i 's|#allow 192.168.0.0/16|allow 192.168.159.0/24|g' /etc/chrony.conf
```

Trong đó 192.168.159.0/24 chính là dải IP Local mà chúng ta cho phép các Client kết nối vào NTP Server này để đồng bộ thời gian.

Kiểm tra lại file cấu hình.

![anh8](https://image.prntscr.com/image/81rZ1_MeTIKKz8E4-xc5UA.png)

Restart lại dịch vụ để cập nhật cấu hình.
```
systemctl restart chronyd
```
Sử dụng chronyc để kiểm tra đồng bộ.
```
chronyc sources -v
```
![anh9](https://image.prntscr.com/image/X-6fJtT4QbWorHpCcGQe_g.png)

Kiểm tra đồng bộ sử dụng timedatectl

![anh9](https://image.prntscr.com/image/NVGhCOQwSk6ft0QNIrMKPg.png)

Set đồng bộ thời gian cho đồng hồ của BIOS (Đồng hồ phần cứng) hwclock.
```
hwclock --systohc
```
Kiểm tra đồng bộ của date và hwclock đảm bảo đồng bộ

![anh10](https://image.prntscr.com/image/Na2SBQ5sT82Wa7TcGagWIQ.png)

# 5. Cấu hình Chrony Client
Thực chất sau khi cài đặt và khởi động Chrony thì Server này đã tự động đồng bộ thời gian về từ một trong những NTP Server thuộc pool centos.pool.ntp.org

Bây giờ thay vì đồng bộ thời gian từ Internet chúng ta sẽ đồng bộ từ NTP Server chúng ta cấu hình phía trên.

Tại Server 192.168.159.143 chỉnh sửa cấu hình chrony.
```
sed -i 's|server 0.centos.pool.ntp.org iburst|server 192.168.159.139 iburst|g' /etc/chrony.conf
sed -i 's|server 1.centos.pool.ntp.org iburst|#|g' /etc/chrony.conf
sed -i 's|server 2.centos.pool.ntp.org iburst|#|g' /etc/chrony.conf
sed -i 's|server 3.centos.pool.ntp.org iburst|#|g' /etc/chrony.conf
```
Kiểm tra cấu hình
```
cat /etc/chrony.conf | egrep -v '^$|^#'
```
![anh11](https://image.prntscr.com/image/SOogBlAWTEmZEUComBnpCg.png)

Khởi động lại Chrony để cập nhật cấu hình.
```
systemctl restart chronyd
```
Sử dụng chronyc kiểm tra đồng bộ.
```
chronyc sources -v
```
![anh12](https://image.prntscr.com/image/fe8rNv2RSPSW5NV61DFtJw.png)

Kiểm tra đồng bộ sử dụng timedatectl.

![anh13](https://image.prntscr.com/image/gKXmR3CbTouaMg5l-cJsCg.png)

Set đồng bộ thời gian cho đồng hồ của BIOS (Đồng hồ phần cứng) hwclock.
```
hwclock --systohc

```

Kiểm tra đồng bộ của date và hwclock đảm bảo đồng bộ.

![anh14](https://image.prntscr.com/image/Z0KLZOVsSmmXAiLfgCRUcw.png)

Tham khảo :

https://news.cloud365.vn/cai-dat-chrony-tren-centos-rhel-7/