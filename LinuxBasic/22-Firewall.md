# Giới thiệu về Firewalld và sử dụng Firewalld trên CentOS 7

## 1. Giới thiệu về Firewalld

Firewalld là một giải pháp quản lý firewall có sẵn cho nhiều bản phân phối Linux hoạt động như một giao diện người dùng cho hệ thống lọc gói iptables do hạt nhân Linux cung cấp. Firewalld được cài đặt mặc định trên RHEL 7 và CentOS 7, nhằm thay thế Iptables với những khác biệt cơ bản:

- Firewalld sử dụng “zones” và “services”

- Firewalld quản lý các quy tắc được thiết lập tự động, có tác dụng ngay lập tức mà không làm mất đi các kết nối và session hiện có.

## 2. Các khái niệm cơ bản trong Firewalld

### 2.1. Zone

Trong FirewallD, zone là một nhóm các quy tắc nhằm chỉ ra những luồng dữ liệu được cho phép, dựa trên mức độ tin tưởng của điểm xuất phát luồng dữ liệu đó trong hệ thống mạng.

Các zone được xác định trước theo mức độ tin cậy, theo thứ tự từ ít-tin-cậy-nhất đến đáng-tin-cậy-nhất:

- drop: ít tin cậy nhất – toàn bộ các kết nối đến sẽ bị từ chối mà không phản hồi, chỉ cho phép duy nhất kết nối đi ra.

- block: tương tự như drop nhưng các kết nối đến bị từ chối và phản hồi bằng tin nhắn từ icmp-host-prohibited (hoặc icmp6-adm-prohibited).

- public: đại diện cho mạng công cộng, không đáng tin cậy. Các máy tính/services khác không được tin tưởng trong hệ thống nhưng vẫn cho phép các kết nối đến trên cơ sở chọn từng trường hợp cụ thể.

- external: hệ thống mạng bên ngoài trong trường hợp bạn sử dụng tường lửa làm gateway, được cấu hình giả lập NAT để giữ bảo mật mạng nội bộ mà vẫn có thể truy cập.

- internal: đối lập với external zone, sử dụng cho phần nội bộ của gateway. Các máy tính/services thuộc zone này thì khá đáng tin cậy.

- dmz: sử dụng cho các máy tính/service trong khu vực DMZ(Demilitarized) – cách ly không cho phép truy cập vào phần còn lại của hệ thống mạng, chỉ cho phép một số kết nối đến nhất định.

- work: sử dụng trong công việc, tin tưởng hầu hết các máy tính và một vài services được cho phép hoạt động.

- home: môi trường gia đình – tin tưởng hầu hết các máy tính khác và thêm một vài services được cho phép hoạt động.

- trusted: đáng tin cậy nhất – tin tưởng toàn bộ thiết bị trong hệ thống.

## 2.2. Quy tắc Runtime/Permanent
Trong Firewalld, các quy tắc được cấu hình thời gian hiệu lực Runtime hoặc Permanent.

- Runtime(mặc định): có tác dụng ngay lập tức, mất hiệu lực khi reboot hệ thống.

- Permanent: không áp dụng cho hệ thống đang chạy, cần reload mới có hiệu lực, tác dụng vĩnh viễn cả khi reboot hệ thống.

Ví dụ, thêm quy tắc cho cả thiết lập Runtime và Permanent:
```
# firewall-cmd --zone=public --add-service=http
# firewall-cmd --zone=public --add-service=http --permanent
# firewall-cmd --reload
```

Việc Restart/Reload sẽ hủy bộ các thiết lập Runtime đồng thời áp dụng thiết lập Permanent mà không hề phá vỡ các kết nối và session hiện tại. Điều này giúp kiểm tra hoạt động của các quy tắc trên tường lửa và dễ dàng khởi động lại nếu có vấn đề xảy ra.
## 3. Cài đặt Firewalld
- Firewalld được cài đặt mặc định trên CentOS 7. Cài đặt nếu chưa có:
```
yum -y install firewalld
```
Khởi động Firewalld:
```
systemctl start firewalld
```
- Kiểm tra hoạt động của Firewalld: 
```
systemctl status firewall
```
- Thiết lập Firewalld khởi động cùng hệ thống:
```
systemctl enable firewall
```
`Lưu ý`: Ban đầu, bạn không nên cho phép FirewallD khởi động cùng hệ thống cũng như thiết lập Permanent, tránh bị khóa khỏi hệ thống nếu thiết lập sai. Chỉ thiết lập như vậy khi bạn đã hoàn thành các quy tắc tường lửa cũng như test cẩn thận.
- Khởi động lại Firewalld:
```
systemctl restart firewall
firewall-cmd --reload
```
- Dừng và vô hiệu hóa Firwalld
```
systemctl stop firewall
systemctl disable firewall
```
## 4. Cấu hình Firewalld
### 4.1. Thiết lập Zone
- Kiểm tra tất cả các zone trong hệ thống:
```
 firewall-cmd --get-zones
 ```
 ![anh1](https://image.prntscr.com/image/Lko3bbfzSBa_2IrCcAVuBg.png)

- Kiểm tra zone mặc định
```
firewall-cmd --get-default-zone
```
![anh2](https://image.prntscr.com/image/ChndvRp2SWaBDuc4iXcvTw.png)

- Kiểm tra zone active (được sử dụng bởi giao diện mạng). Vì FirewallD chưa được thiết lập bất kỳ quy tắc nào nên zone mặc định cũng đồng thời là zone duy nhất được kích hoạt, điều khiển mọi luồng dữ liệu.
```
firewall-cmd --get-active-zones
```
![anh3](https://image.prntscr.com/image/ovyM6R3WSK6DUhnBTTDIHA.png)

- Thay đổi zone mặc định, ví dụ thay đổi thành zone home:
```
firewall-cmd --set-default-zone=home
```
![anh4](https://image.prntscr.com/image/9YQ6FojVTfOcOxKICaoHUw.png)

### 4.2. Các lệnh liệt kê
- Liệt kê toàn bộ các quy tắc của các zones:
```
firewall-cmd --list-all-zones
```
![anh5](https://image.prntscr.com/image/uK5owdY5RUKNTcsrFNTgXQ.png)

- Liệt kê toàn bộ các quy tắc trong zone mặc định và zone active:
```
firewall-cmd --list-all
```
![anh6](https://image.prntscr.com/image/Ljm6rZRdQj_B9fx-Bqf4uw.png)

- Liệt kê toàn bộ các quy tắc trong một zone cụ thể, ví dụ home:
```
firewall-cmd --zone=home --list-all
```
- Liệt kê danh sách services/port được cho phép trong zone cụ thể:
```
firewall-cmd --zone=public --list-services

firewall-cmd --zone=public --list-ports
```
### 4.3. Thiết lập cho Service
Việc thiết lập tường lửa đã trở nên dễ dàng hơn bao giờ hết – chỉ việc thêm các services vào zone đang sử dụng.

Đầu tiên, xác định các services trên hệ thống:
```
firewall-cmd --get-services
```
Lưu ý: Biết thêm thông tin về service qua thông tin lưu tại /usr/lib/firewalld/services/

Hệ thống thông thường cần cho phép các services sau: ssh(22/TCP), http(80/TCP), https(443/TCP), smtp(25/TCP)
- Thiết lập cho phép services trên FirewallD, sử dụng –add-service. Ví dụ, cho phép service http:
```
# firewall-cmd --zone=public --add-service=http
success
# firewall-cmd --zone=public --add-service=http --permanent
success
```
- Kiểm tra lại các zone:
```
firewall-cmd --zone=public --list-services
```
- Vô hiệu hóa services trên FirewallD, sử dụng –remove-service:
```
firewall-cmd --zone=public --remove-service=http

firewall-cmd --zone=public --remove-service=http --permanent
```
### 4.4. Thiết lập cho Port
Trong trường ta muốn quản lý theo port, FirewallD cũng sẽ hỗ trợ:
- Mở port với tham số -add-port:
```
firewall-cmd --zone=public --add-port=9999/tcp

firewall-cmd --zone=public --add-port=9999/tcp --permanent
```
- Mở 1 dài port:
```
firewall-cmd --zone=public --add-port=4990-5000/tcp

firewall-cmd --zone=public --add-port=4990-5000/tcp --permanent
```
Kiểm tra lại port đang mở:
```
firewall-cmd --zone=public --list-ports
```
Đóng Port với tham số –remove-port:
```
firewall-cmd --zone=public --remove-port=9999/tcp

firewall-cmd --zone=public --remove-port=9999/tcp --permanent
```
