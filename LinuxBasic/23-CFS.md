# Tìm hiểu về CFS
CSF (ConfigServer & Firewall) là 1 gói ứng dụng hoạt động trên Linux như 1 Firewall được phát hành miễn phí để tăng tính bảo mật cho server (VPS và Dedicated). CSF hoạt động dựa trên iptables và tiến trình ldf để quyét các file log để phát hiện các dấu hiệu tấn công bất thường.


CSF sẽ giúp server của bạn:

- Chống DoS các loại
- Chống Scan Port
- Đưa ra các lời khuyên về việc cấu hình server (VD: Nên nâng cấp MySQL lên bản mới hơn)
- Chống BruteForce Attack vào ftp server, web server, mail server,directadmin,cPanel…
- Chống Syn Flood
- Chống Ping Flood
- Cho phép ngăn chặn truy cập từ 1 quốc gia nào đó bằng cách chỉ định Country Code chuẫn ISO
- Hỗ trợ IPv6 và IPv4
- CHo phép khóa IP tạm thời và vĩnh viễn ở tầng mạng (An toàn hơn ở tầng ứng dụng ) nên webserver ko phải mệt nhọc xử lý yêu cầu từ các IP bị cấm nữa
- Cho phép bạn chuyến hướng yêu cầu từ các IP bị khóa sang 1 file html để thông báo cho người dùng biết IP của họ bị khóa

# 2. Cài đặt CSF trên CentOS7
### Bước 1: Cài đặt các module cần thiết cho CSF
```
yum install perl-libwww-perl -y
```
### Bước 2: Tải CSF
```
cd /tmp
wget https://download.configserver.com/csf.tgz
```
### Bước 3: Cài đặt CSF
Tiến hành giải nén và cài đặt CSF
```
tar -xzf csf.tgz
cd csf
sh install.sh
```
### 4. Cấu hình CSF
Mặc định thì script trên sẽ cài đặt và chạy CSF ở chế độ “Testing”, có nghĩa là server lúc này chưa được bảo vệ toàn diện. Để tắt chế độ “Testing” bạn cần cấu hình các lựa chọn TCP_IN, TCP_OUT, UDP_IN và UDP_OUT cho phù hợp với nhu cầu 

Mở file cấu hình CSF
```
nano /etc/csf/csf.conf
```

Tắt chệ độ Testing bằng cách chuyển dòng TESTING="1" thành `
```
TESTING="0"
```

Lưu cấu hình lại.

Trong đó các tham số khi cấu hình có dạng ARGS = “VALUE” bạn cần nằm như sau:

- VALUE = “0” : Disable (Không kích hoạt)
- VALUE = “1” : Enable (Kích hoạt)
- VALUE > 1 (VALUE = “20” , VALUE = “30” … ): Giới hạn tối đa (Ví dụ: Giới hạn tối đa 30 kết nối)
- VALUE >1 (VALUE = “1800” , VALUE = “3600”… ): Thời gian tối đa (Ví dụ: Giới hạn 1800s)

### Bước 5: Khởi động CSF và cho phép CSF khởi động cùng hệ thống
```
systemctl start csf
systemctl enable csf
```
### 6. Những file cấu hình CSF
Toàn bộ thông tin cấu hình và quản lý CSF được lưu ở các file trong folder /etc/csf. Nếu bạn chỉnh sửa các file này thì cần khởi động lại CSF để thay đổi có hiệu lực.

- csf.conf : File cấu hình chính để quản lý CSF.
- csf.allow : Danh sách địa chỉ IP cho phép qua firewall.
- csf.deny : Danh sách địa chỉ IP từ chối qua firewall.
- csf.ignore : Danh sách địa chỉ IP cho phép qua firewall và không bị block nếu có vấn đề.
- csf.*ignore : Danh sách user, IP được ignore.

### 7. Một số lệnh thường dùng
Một số câu lệnh sử dụng để add (-a) hoặc deny (-d) một địa chỉ IP.
```
csf -d IPADDRESS //Block địa chỉ IP
csf -dr IPADDRESS //Xóa địa chỉ IP đã bị block
csf -a IPADDRESS //Allow địa chỉ IP
csf -ar IPADDRESS //Xóa địa chỉ IP đã được allow
csf -g IPADDRESS //Kiểm tra địa chỉ IP có bị block không
csf -r //Khởi động lại CSF
csf -x //Tắt CSF
csf -e //Mở CSF
```
Trong trường hợp bạn quên những lệnh trên, hãy sử dụng csf sẽ liệt kê toàn bộ danh sách các option.

# 8. Xóa CSF
 muốn xóa hoàn toàn CSF, chỉ cần sử dụng script sau:
 ```
 /etc/csf/uninstall.sh
 ```

### 9 Tài liệu tham khảo

https://vinahost.vn/csf-la-gi

https://hocvps.com/cai-dat-configserver-security-firewall-csf-tren-centos/