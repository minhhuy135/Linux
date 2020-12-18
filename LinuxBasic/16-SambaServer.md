# Samba Server và SBM
Samba là một phần mềm nguồn mở nó cho phép chia sẻ file (tạo file server) với giao thức SMB Nó cho phép kết nối mạng của Microsoft Windows®, Linux, UNIX và các hệ điều hành khác. Samba cho phép máy chủ Linux, UNIX xuất hiện dưới dạng Windows Server tới Windows Client.

Samba Server được xem là một máy chủ tập tin (File Server)sử dụng trong mạng nội bộ

`File server` (hay máy chủ tập tin) là một máy tính nối mạng cung cấp không gian để lưu trữ và chia sẻ dữ liệu như văn bản, hình ảnh, âm thanh, video. Các dữ liệu này có thể được truy cập bởi các workstation (máy trạm). Workstation này có thể kết nối được tới máy chủ khi các máy này chia sẻ quyền truy cập thông qua một mạng máy tính.

Với Samba, quản trị viên có thể làm được:
 
1. Cung cấp dịch vụ cây thư mục và máy in cho Linux, UNIX và Windows Client.

![anh1](https://image.prntscr.com/image/2n-ClZQjSiuz_kgyhuZnRQ.png)

2. Hỗ trợ trình duyệt mạng dù có hay không NetBIOS.
NetBIOS (Network Basic Input/Output System) là một ngôn ngữ lập trình ứng dụng ghép nối tương thích API cho các máy khách kết nối tới tài nguyên các máy trong mạng LAN ,`đóng vai trò như một cổng giao tiếp chung nhằm giúp tạo kết nối hoặc từ chối các kết nối đến các dịch vụ của mạng`

Samba bao gồm các dịch vụ sau: smb, nmb, winbind

Mặc định Samba Server sử dụng cổng 139 và 445 (giao thức TCP), nhớ cổng này để mở firewall hoặc ánh xạ cổng nếu sử dụng với Docker ...

nmbd : trình nền máy chủ hiểu và trả lời NetBIOS qua các yêu cầu dịch vụ bởi SMB trong các hệ thống dựa trên Windows. Cổng mặc định mà máy chủ lắng nghe lưu lượng NMB là cổng UDP 137.

winbindd : là dịch vụ phân giải thông tin người dùng và nhóm nhận được từ máy chủ chạy Windows. Điều này giúp cho người dùng Windows và thông tin các nhóm có thể hiểu được bởi các nền tảng Linux và UNIX. Nó cho phép người dùng Windows xuất hiện và hoạt động như người dùng Linux, UNIX trên máy Linux và UNIX.

# Cách thức hoạt động sơ bộ của giao thức SMB
Đối với giao thức SMB, nó hoạt động trong mạng Internet dựa trên giao thức TCP/IP. Và đem đến cho người dùng toàn quyền trong việc tạo một tập tin với các quyền hạn như Chỉ đọc (Read Only), Đọc và ghi (Read-Write), đặt mật khẩu, khóa một tập tin, …. Ngoài ra, SMB còn hỗ trợ các tính năng khác như:

![anhaa](https://image.prntscr.com/image/C7a0IZqpRjKkYNcN52pHrg.png)
# Samba Lab

# Mô hình lab
Ta sẽ tạo 1 Samba Server trên CentOS-7 để chia sẻ tệp cho máy Window 10.

Ta sẽ tạo 1 Samba Server trên CentOS-7 để chia sẻ tệp cho máy Window 10.

IP Planning

|Host name|Network|Interface|IP|Netmask|Gateway|DNS|
|-|-|-|-|-|-|-|
|CentOS-7|VMnet8|ens33|192.168.64.138|24|192.168.64.138|8.8.8.8|
|Window 10|VMnet8|ens33|192.168.64.139|24|192.168.64.1|8.8.8.8|

Cài đặt Samba Server
Install Samba Package rồi enable và start 2 dịch vụ smbd và nmbd:
```
# yum install samba
# systemctl enable smb
# systemctl enable nmb
# systemctl start smb
# systemctl start nmb
```
Cấu hình Samba Server
File cấu hình của samba nằm ở /etc/samba/smb.conf, ta cần chỉ sửa file cấu hình để share file.

Trước khi chỉnh sửa ta sẽ copy ra 1 file khác để backup:
```
[root@localhost ~]#mv /etc/samba/smb.conf /etc/samba/smb.conf.orig
```
Chỉnh sửa file cấu hình tương tự như sau: `#vi smb.conf`
```
# See smb.conf.example for a more detailed config file or
# read the smb.conf manpage.
# Run 'testparm' to verify the config is correct after
# you modified it.

[global]
        workgroup = SAMBA
        security = user

        passdb backend = tdbsam

        printing = cups
        printcap name = cups
        load printers = yes
        cups options = raw

...

# Configs
[Share_One]
comment = Public Documents - Share_One
path = /samba/share1/data
valid users = root
guest ok = no
writable = yes
browsable = yes

[Share_Two]
comment = Public Documents - Share_Two
path = /samba/share2/data
valid users = root
guest ok = no
writable = yes
browsable = yes
```
Sau khi cấu hình xong ta có thể kiểm tra cấu hình bằng lệnh testparm:
```
[root@localhost ~]# testparm /etc/samba/smb.conf
```
![anh2](https://image.prntscr.com/image/F49zpR_BSuqNdLikHdgSpg.png)

Tạo user và password
Samba sử dụng nhiều hình thức bảo mật khác nhau. Trong lab này, ta sử dụng phương thức mặc định (user level). Phương thức này, mỗi chia sẻ được gán truy cập với những user cụ thể. Khi user gửi yêu cầu kết nối để chia sẻ, Samba sẽ xác thực bằng username đã được khai báo trong file cấu hình và password trong database.

Samba sử dụng nhiều database backends để lưu trữ password người dùng. Cách đơn giản nhất là lưu trữ password trong file smbdpasswd giống như /etc/passwd. Thông thường, file này sẽ được lưu tại /var/lib/samba/private/ hoặc /usr/bin/smbpasswd.

Thêm User và set Password trong database :

![anh3](https://image.prntscr.com/image/AB9YjEW9Qe2rCzVtWxKfvg.png)

Hiển thị danh sách đăng nhập trong database: #pdbedit --list

![anh4](https://image.prntscr.com/image/KR7BcdmARjmR9EH1UsGJ_A.png)

Cấu hình firewall để mở port:
```
[root@localhost ~]# firewall-cmd --permanent --zone=public --add-service=samba
success
[root@localhost ~]# firewall-cmd --reload
success
```
Ta tạo file trong file thư mục share để kiểm tra chia sẻ thành công:

[root@localhost ~]# echo 'Share' > /var/Samba-Shared/Share_One/Share_File.txt
[root@localhost ~]# cat Share_File.txt
Share

# Trên máy Window Client
Ta nhấn tổ hợp phím Window + R để mở hộp thoại Run rồi nhập địa chỉ của máy CentOS như hình

![anh5](https://image.prntscr.com/image/N5NC3Ca4RBKh1POuKV708w.png)

Sau đó nhập tài khoản và mật khẩu vào ta sẽ được 2 thư mục share như hình

![anh6](https://image.prntscr.com/image/E4SoCXeFQYWC_iSJkId3mA.png)