# I. CSF (Config Server Firewall) là gì?

CSF (ConfigServer & Firewall) là 1 gói ứng dụng hoạt động trên Linux như 1 Firewall được phát hành miễn phí để tăng tính bảo mật cho server (VPS và Dedicated). CSF hoạt động dựa trên iptables và tiến trình ldf để quyét các file log để phát hiện các dấu hiệu tấn công bất thường.

##  Những file cấu hình CSF
Toàn bộ thông tin cấu hình và quản lý CSF được lưu ở các file trong folder /etc/csf. Nếu bạn chỉnh sửa các file này thì cần khởi động lại CSF để thay đổi có hiệu lực.

- csf.conf : File cấu hình chính để quản lý CSF.
- csf.allow : Danh sách địa chỉ IP cho phép qua firewall.
- csf.deny : Danh sách địa chỉ IP từ chối qua firewall.
- csf.ignore : Danh sách địa chỉ IP cho phép qua firewall và không bị block nếu có vấn đề.

## Một số lệnh thường dùng
Một số câu lệnh sử dụng để add (-a) hoặc deny (-d) một địa chỉ IP.

- csf -d IPADDRESS //Block địa chỉ IP
- csf -dr IPADDRESS //Xóa địa chỉ IP đã bị block
- csf -a IPADDRESS //Allow địa chỉ IP
- csf -ar IPADDRESS //Xóa địa chỉ IP đã được allow
- csf -g IPADDRESS //Kiểm tra địa chỉ IP có bị block không
- csf -r //Khởi động lại CSF
- csf -x //Tắt CSF
- csf -e //Mở CSF

## 1. Cài đặt các chương trình/thư viện hỗ trợ CSF
Chúng ta sẽ cần cài đặt các gói chương trình thư viện hỗ trợ cho dịch vụ tường lửa CSF.
```
# yum -y install epel-release
# yum -y install iptables-services unzip bind-utils perl-libwww-perl e2fsprogs perl-LWP-Protocol-https ipset perl-Time-HiRes vim vi wget
```
## 2. Tiến hành cài đặt CSF
Bạn sẽ download gói chương trình cài đặt bằng lệnh “wget“.
```
# cd /usr/local/src
# wget https://download.configserver.com/csf.tgz
```
Giải nén bộ source chương trình CSF, chạy file script để tự động cài đặt.
```
# tar -xzf csf.tgz
# cd csf
# sh install.sh
```

# Các câu lệnh thường dùng trong CSF (ConfigServer & Firewall)



## 3. Cấu hình dịch vụ CSF trên CentOS
Thông thường CentOS 7 có một ứng dụng tường lửa Linux mặc định tên là “firewalld“, còn nếu hệ thống CentOS 7 của VPS/Cloud Server bạn đang sử dụng không có thì có thể bạn đã cài bản CentOS 7 minimal. Vậy ta cần tắt dịch vụ tường lửa “firewalld” đi trước khi sử dụng dịch vụ tường lửa “CSF“, nhằm tránh xung đột giữa 2 dịch vụ quản lý rule iptable..

- Để tắt dịch vụ “firewalld“
```
#  systemctl stop firewalld
```
- Tắt hoạt động startup dịch vụ “firewalld”
```
systemctl disable firewalld
```
## 3.2 Khởi động dịch vụ CSF
Bây giờ ta sẽ cấu hình dịch vụ CSF để kích hoạt tính năng hoạt động của tường lửa CSF. Bạn sẽ chỉnh sửa file ‘csf.conf‘ trong thư mục ‘/etc/csf/‘ với chương trình editor ‘vi‘
```
# cd /etc/csf/
# vi csf.conf
```
`TESTING` = “0”
Mặc định khi vừa cài TESTING = “1”, với TESTING = “1” thì LFD daemon (Login Fail Detect daemon) sẽ không hoạt động, do đó nếu có gì sai sót thì server cũng sẽ không block IP của bạn. Nếu cấu hình đã ổn thì bạn tắt TESTING để LFD bắt đầu hoạt động và chặn các IP tấn công.


![anh1](https://image.prntscr.com/image/SK4s3hmXRYewoLNyBaiiYg.png)


- TESTING_INTERVAL = "5"

Thời gian chạy cronjob để clear iptables nếu như TESTING=1 , tính bằng phút.

- AUTO_UPDATES = "0"

Tắt chế độ auto update của CSF.

- TCP_IN = "22,25,53,80,443"

Cho phép kết nối TCP qua các cổng: Dùng cho các dịch vụ SSH, sendmail, DNS, Web trên server. (nếu bạn không sử dụng https và email có thể bỏ 25 và 443).

- TCP_OUT = "25,80"

Cho phép kết nối từ máy chủ ra bên ngoài: cho phép server kết nối đến web server, sendmail server khác.

- UDP_IN = "53"

Cho phép người dùng sử dụng dịch vụ DNS trên server.

- UDP_OUT = "53"

Cho phép server truy vấn DNS bên ngoài.

- ICMP_IN = "1"

Cho phép người dùng thực hiện lệnh ping đến server.

- ICMP_IN_RATE = "20/s" 

Nếu để giá trị này thấp thì khi ping sẽ nhận được giá trị request time out.

- ETH_DEVICE = "eth0"

Mặc định csf sẽ cấu hình iptables để filter traffic trên toàn bộ các card mạng , ngoại trừ card loopback . Nếu như bạn muốn rules iptables chỉ applied vào card mạng “eth0″ thì khai báo ở đây.

- ETH_DEVICE_SKIP = "eth1"

Nếu bạn không muốn rules iptables không applied vào card mạng nào thì khai báo ở đây. Ví dụ card “eth1″ là card local , bạn không muốn filter trên card này thì cấu hình như trên.

- DENY_IP_LIMIT = "200"

  - Giới hạn số lượng IP bị block “vĩnh viễn” bởi CSF (các IP này được lưu trong file /etc/csf/csf.deny).

  - Con số này để 200 nếu bạn sử dụng VPS và 500 nếu bạn sử dụng server.

  - Khi số lượng IP bị block vượt qua con số này , csf sẽ tự động unblock IP cũ nhất.

- LF_DAEMON = "1"

Enable tính năng Login fail detection.

- LF_CSF = “1”

Tham số 1 kích hoạt tính năng Auto start khi CSF bị stop

- PACKET_FILTER = "1"

Filter các gói tin TCP không hợp lệ… )

- SYNFLOOD = “1”
SYNFLOOD_RATE = “75/s”
SYNFLOOD_BURST = “25”

Enable synflood protection: Nếu 1 IP gửi 75 cú SYN trong vòng 1s và số lượng SYN connection tồn tại trên server đạt trên 25 thì block IP đó (temp block).

- PORTFLOOD = “80;tcp;20;5“

Tham số này sẽ giới hạn số lượng connection đến một port cụ thể trong một khoảng thời gian nhất định. Ví dụ như trên có nghĩa, nếu nhiều hơn 20 kết nối TCP đến port 80 trong vòng 5s thì block IP đó tối thiểu 5s tính từ packet cuối cùng của IP đó. Sau 5s IP đó sẽ tự động được unlock và truy cập bình thường.

- LF_ALERT_TO = “email@domain”

Mặc định email thông báo sẽ được gửi về root của server. Nếu bạn muốn gửi đến email khác nảy nhập email vào đây.


# Tài liệu tham khảo

- https://huongdan.azdigi.com/giai-thich-va-su-dung-csf-configserver-firewall/

- https://vinahost.vn/csf-la-gi

- https://wiki.matbao.net/kb/bao-mat-may-chu-linux-huong-dan-cai-dat-va-cau-hinh-csf-firewall-2/