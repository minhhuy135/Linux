# Mục Lục

# I. Hướng dẫn cài đặt Cpanel trên Centos7

2. Tiến hành cài đặt

2.1 cài đặt trên Centos 7

## II. tìm hiểu tính năng trên Cpanel

2 File Modules

3. Quản lý domain – Tên miền

4. E-mail

5. Metrics

6. SECURITY

7. Software

8. Advanced

9. Preferences

## III. Thực hiện Check list

1. Tạo gói Packages

2. Tạo Client, Domain

3. Tạo tài khoản FTP,Database và up 1 site wordpress ví dụ.

  - 3.1 Tạo tài khoản FTP.
  - 3.2 Tạo DB
  - 3.3 up site Wordpress
4. Cài đặt Plugin Let's Encrypt trên cPanel

5. Tạo E-mail cho khách hàng theo tên miền

6. kiểm tra tính năng gửi mail thông báo cho khách hàng khi thay đổi thông tin

7. Backups Database, code


# III. Thực hiện cheklist

2. Tiến hành cài đặt

Bước 1: SSH vào VPS

Đầu tiên các bạn cần SSH vào máy chủ của bạn với quyền root

Bươc 2:  Cài đặt và bật/tắt một số dịch vụ cần thiết.

Tắt Network Manager

```
systemctl stop NetworkManager.service
systemctl disable NetworkManager.service
```

Tiếp theo bạn khởi động lại Network
```
systemctl enable network.service
systemctl start network.service
```

Update VPS
```
yum update -y
```

Bước 3: Cài đặt WHM / cPanel.

Để cài đặt WHM / cPanel các bạn lần lượt chạy các lệnh sau:
```
cd /home
curl -o latest -L https://securedownloads.cpanel.net/latest
sh latest
```

Chú thích lệnh:

- Di chuyển đến thư mục home
- Tải xuống file cài đặt phiên bản mới  nhất của WHM và cPanel từ trang chủ
- Chạy lệnh cài đặt

Nếu bạn muốn cài đặt nhanh và chỉ bằng 1 lệnh duy nhấ thì bạn có thể sử dụng lệnh bên dưới, nó sẽ kết hợp và chạy cùng lúc các lệnh tương tự bên trên.

```
cd /home && curl -o latest -L https://securedownloads.cpanel.net/latest && sh latest
```

Bước 4: Thiết lập WHM/cPanel.

Bạn cần mở trình duyệt và truy cập với địa chỉ: https://103.159.50.188:2087 ở Bước 3, tại đây bạn sẽ thấy giao diện WHM như hình dưới. Bạn điền thông tin root của VPS vào để login nhé.

![anh1](https://image.prntscr.com/image/-LzxCar0QQeZsq7gu0re8w.png)

đăng nhập bằng tài khoản root và tiến hành cấu hình cài đặt:

![anh2](https://image.prntscr.com/image/h1KmY5LpRiuDRbCGXflaOA.png)

## II. tìm hiểu tính năng trên Cpanel

2. File Modules:

![anh11](https://image.prntscr.com/image/z0xB9I-cStSmq7vpDg85Vg.png)

Những modules này cho phép bạn trực tiếp upload và quản lý file từ trong cPanel mà không cần tài khoản FTP client. Bạn có thể cài đặt mức độ bảo mật, backup và nhiều thứ khác. Những modules thông dụng nhất là:

3. Quản lý domain – Tên miền

![anh12](https://image.prntscr.com/image/OZfnTPqXQEyZ8DNEjPaT6w.png)

- Subdomains: Tên miền con
- Addon Domain: Với cùng 1 tài khoản hosting có thể chạy thêm domain và website
- Parker Domains : Cho phép chạy 1 site trên nhiều domain khác nhau
- Redirects: Chuyển hướng domain
- Zone Editor: Cập nhật các bản ghi DNS cho domain

4. E-mail

![anh13](https://image.prntscr.com/image/UNuuIcfwRjev9yiyydFm0w.png)

- Không phải tất cả web hosting đều bao gồm email, nhưng nếu gói hosting của bạn có cả email và cPanel vậy thì phần này là để quản lý Email.

5. Metrics

![anh14](https://image.prntscr.com/image/_SsakHfqTOmgKjyxv8233Q.png)

- Nếu bạn đang chạy một website và đang quan tâm đến thống kê truy cập của nó. Vậy bạn cần tìm đến khu vực Metrics này. Khu vực này để đưa ra cho bạn toàn bộ thông số thống kê mà có thể giúp bạn đánh giá website có hoạt động hiệu quả không. Các modules thông dụng là:

- Awstats
- Bandwidth
- CPU and Concurrent Connection Usage
- Errors
- Raw Access
- Visitors
- Webalizer
- Webalizer FTP

6. SECURITY

![anh15](https://image.prntscr.com/image/fn1YhY-lQ2iHFinfWLmSMQ.png)

- Bảo mật là ưu tiên hàng đầu của nhiều webmaster, đặc biệt là nếu website của bạn chứa các thông tin nhạy cảm như usnername, password và thông tin tài chính. Module này sẽ giúp bạn quản lý các vấn đề liên quan đến bảo mật, làm website của bạn an toàn hơn. Các modules thông dụng nhất là:

- Hotlink Protection
- IP Blocker
- Leech Protection
- SSH Access
- SSL/TLS
- Let's Encrypt™ SSL

7. Software

![anh16](https://image.prntscr.com/image/NTO9S8ldSEKQ58cggdnN3A.png)


- Module này chủ yếu dùng nhiều các phần mềm PHP và Perl, người dùng thông thường không cần lắm những tính năng trong này. Các modules thông dụng nhất là:

- Softaculpis Apps Installer
- Optimize Website
- Perl Modules
- PHP PEAR Packages
- CloudFlare
- PHP Version Selector

8. Advanced

![anh17](https://image.prntscr.com/image/24qgAzPfSjuuK5UkFygmjw.png)

- Như tiêu đề, những thông số này dành cho người dùng chuyên nghiệp. Các modules thông dụng nhất:

- Apache Handlers
- Cron Jobs
- Error Pages
- Indexes
- MIME Types
- Track DNS

9. Preferences

![anh18](https://image.prntscr.com/image/3fQjqN5BRD2y15saCTVquQ.png)

- Đây là nơi bạn tùy biến giao diện của cPanel để làm cho nó tiện nhìn hơn. Những modules thông dụng nhất là:

- Change Language: đổi ngôn ngữ cPanel
- Change Main Domain: đổi tên miền
- Getting Started Wizard: quy trình khi mới dùng
- Manage Resources: Quản lý tài nguyên
- Shortcuts
- Update Contact Info: cập nhật thông tin cá nhân
- Video Tutorials: hướng dẫn bằng video

## III. Thực hiện Check list

1. Tạo gói Packages
Đăng nhập WHM bằng tài khoản root tới mục Manage Your Accounts chọn : Add a Package

![anh3](https://image.prntscr.com/image/8tlA3J-PT4_7hDmd2wwSOQ.png)

- Tại đây chúng ta điền thống tin tên package và dung lương các gói cho phù hợp và tiến hành add Package.

![anh4](https://image.prntscr.com/image/9MXNCYpiTNmx7f4avFmuzA.png)


2. Tạo Client, Domain
- Để tạo tài khoản cPanel trên WHM chúng ta làm như sau:
- Trang chủ WHM >> Account Funtions >> Create a New Account.
- Domain Information là nơi thiết lập các thông tin cơ bản cho tài khoản cPanel.

![anh5](https://image.prntscr.com/image/rMME3gRQR02Nn9sy2t2F7Q.png)

- Domain: Địa chỉ tên miền

- Username: Tài khoản dùng để đăng nhâp vào thệ thống cPanel

- Password: Mật khẩu của tài khoản

- Re-type Password: Nhập lại mật khẩu lần nữa

- Email: Email của tài khoản tên miền

![anh6](https://image.prntscr.com/image/s6lK7vx_Sw2wRSgpcMpXSA.png)


- Package cho phép chỉ định một package vào một tài khoản mới


![anh7](https://image.prntscr.com/image/mtDwGfelT82o3758Hc_T1w.png)

- Setting cho phép thiết lập chủ đề mặc định của cPanel:

![anh8](https://image.prntscr.com/image/R253f5rIRdiibl2xsFpFvw.png)

- Mail Routing Settings cho phép chỉ định cách thư được chuyển cho tài khoản mới.

   - Automatically Detect Configuration: Tự động thiết lập cấu hình hoạt động.

   - Local Mail Exchanger: Cấu hình mail nội bộ, chấp nhận mail local cho các tên miền mới.

   - Backup Mail Exchanger: Cấu hình máy chủ thành mail dự phòng cho tên miền này.

   - Remote Mail Exchanger: Tính năng này không chấp nhận bởi mail local.

   - DNS Setting cho phép thiết lập DNS cho tên miền của tài khoản

![anh9](https://image.prntscr.com/image/7NWQKd2AR6O3nUSaVjZTJg.png)

- DNS Setting cho phép thiết lập DNS cho tên miền của tài khoản

![anh10](https://image.prntscr.com/image/cgfoadF-Tcq_4o-k6JrxEw.png)

- Enable DKIM on this account: DKIM (DomainKeys Indentified Mail) là một dạng chữ kỹ điện tử được đưa vào tiêu đề đầy đủ của email của bạn để xác định nguồn gốc của nơi mà thông điệp được gửi đi.
- Enable SPF on this account: SPF – mở rộng hỗ trợ cho giao thức gửi mail (SMTP). SPF cho phép nhận dạng, chứng thực và loại bỏ những nội dung mail từ địa chỉ mail giả mạo.
- Use the nameservers specified at the Domain’s Registrar. (Ignore locallly specified nameserver.): Sử dụng nameserver được đăng kí tại nơi mua domain.

- Sau khi điền đầy đủ các thông tin nêu ở trên, nhấn Create để tạo user. kết quả:

![anh19](https://image.prntscr.com/image/RgX7dSKhTUumXFtBzIs3wA.png)

## 3. Tạo tài khoản FTP,Database và up 1 site wordpress ví dụ.

### 3.1 Tạo tài khoản FTP.

Để tạo tài khoản FTP trên cPanel. Các bạn có thể nhấn vào FTP Accounts như hình sau:

![anh20](https://image.prntscr.com/image/JitTjzItQ1y2MmcY5xsnxw.png)

Tiếp theo ta điển tên user và thông tin mật khẩu:

![anh21](https://image.prntscr.com/image/VNEPUeKkRoiz0C6iF3vfUQ.png)

## 3.2 Tạo DB

- Create Database MySQL: Để tạo mới Database trên màn hình ta ấn chọn vào MySQL® Databases và tạo mới Database ở mục Create New Database

![anh22](https://image.prntscr.com/image/pCRKzmdxRbiCIdWqShLegQ.png)

- Create User Database MySQL:
điền thông tin và chọn Create User

![anh23](https://image.prntscr.com/image/fZjxj-CgT3ugrC6YggGF_Q.png)

- Gán cho user kết nối database :

![anh24](https://image.prntscr.com/image/zdKAUGOET4OMWSpUSeXtHQ.png)

- Phân quyền cho user:

![anh25](https://image.prntscr.com/image/mQE1Zj9RQS2vYPAS4RJyIQ.png)

- sau khi phân quyền xong ấn Make change để lưu thay đổi và áp dụng

### 3.3 up site Wordpress

- Sau khi đẩy file Wordpress lên bằng tài khoản FTP, tiến hành giải nén và lưu vào thư mục Public_html

![anh26](https://image.prntscr.com/image/2Gs1rTfGR5SzHOzJJiTpaQ.png)

- Click vào thư mục public_html và xóa tất cả các file, folder đang có sẵn ở đó, đấy là những file tự động tạo ra và không cần thiết. Sau đó click vào Upload để upload mã nguồn mà bạn đã download về.

- Sau khi upload xong bạn click chuột phải và chọn nút Extract, giải nén xong sẽ có một thư mục .

- Chú ý: Vì file ZIP bạn tải về năm trong một folder tên là wordpress, vì vậy bạn phải di chuyển tất cả thư mục trong đó ra ngoài thư mục gốc. Bạn hãy click vào thư mục wordpress vừa giải nén, chọn tất cả các file và folder rồi click chuột phải, chọn Move.

- Một cửa sổ hiện ra, bạn hãy xóa dòng wordpress và nhấn vào nút Move Files.

- Vậy là xong, bạn hãy quay lại thư mục gốc public_html và xóa đi thư mục wordpress và file wordpress.zip mà bạn đã tải về.

`- Tiến hành rename file wp-config-sample.php thành wp-config.php và cấu hình kết nối Database .`

![anh27](https://image.prntscr.com/image/X69Bmu8HTaGEEvm-Xp2gDg.png)

- Truy cập thư mục wp-contens tạo mới thư mục upload để lưu trữ các bài đăng cửa website.

![anh28](https://image.prntscr.com/image/bR4HD5bGSsOEK8aXjePXgg.png)

sau khi cấu hình cài đặt website thành công tiến hành trỏ bản ghi DNS về IP server chạy Web và cài đặt trên trình duyệt:
```
http://zaraoder.xyz

```

![anh29](https://image.prntscr.com/image/RFWlZirISA20zyWHWym0cA.png)


- Kết quả :

![anh30](https://image.prntscr.com/image/NkNdGFBFRReJvhk_FUO-0w.png)


## 4. Cài đặt Plugin Let's Encrypt trên cPanel

- Thêm package letsencrypt vào repository:
```
wget https://cpanel.fleetssl.com/static/letsencrypt.repo -O /etc/yum.repos.d/letsencrypt.repo
```
- Cài đặt Plugin thông qua lệnh yum
```
yum -y install letsencrypt-cpanel

```
- Test Plugin
```
le-cp self-test

```

Nếu không có vấn đề gì hệ thống sẽ trả về SUCCESS: 

![anh31](https://image.prntscr.com/image/x5B-1tVQSEWsvjaXWzb4Aw.png)

- Check trên web:

![anh32](https://image.prntscr.com/image/p_nQMy2BRwaD_XklfPKE8Q.png)

![anh33](https://image.prntscr.com/image/zpa_4BVoQkWegXboQPaS8Q.png)


- kiểm tra bảo mật tên miền:

![anh34](https://image.prntscr.com/image/ccAR1xu2RVO1Uwm6jXNo_A.png)

## 5. Tạo E-mail cho khách hàng theo tên miền

- Kéo xuống phần Email > Email Accounts

![anh35](https://image.prntscr.com/image/pJqy4KWeR4yqAj4dPyEvQQ.png)

- Bạn nhấn vào nút CREATE ở phía bên phải:

![anh36](https://image.prntscr.com/image/O6zdRd1cSTCK78XQG4zN3g.png)

- Ở cửa sổ mới hiện ra bạn làm như sau:

![anh37](https://image.prntscr.com/image/VeBK9AETQPiaDc4ucM1vgA.png)

- Bạn sẽ được đưa về màn hình lúc nãy. Nhấn vào nút CHECK MAIL trong email mà bạn vừa tạo xong.

![anh38](https://image.prntscr.com/image/rffmb56XQ2aQc8ykGbWoww.png)

- Chọn một ứng dụng Webmail làm mặc định. Ở đây mình chọn roundcube:

# 7. Backups/Restore Database, code

- Trong giao diện quản trị Cpanel truy cập mục Backup Wizard

![anh39](https://image.prntscr.com/image/jLfZQNgaRw_fuq4X75Ifgw.png)

- Tại đây, các bạn sẽ được tùy chọn các mục để backup như source code Website, Email, và Database.

### 7.1 Backup/Restore

- Backup Tạo bản backup thư mục trang chủ
Để tạo bản backup trang chủ chúng trên hosting bạn chọn phần Select Partial Backup >> home directory

![anh40](https://image.prntscr.com/image/gzNLtxs9T3WNGjpkHHU3nA.png)

- Tiếp theo bấm chọn Home Directory để download file backup:

![anh41](https://image.prntscr.com/image/XLGix6I8Qz2Y2Nt1xd7TeA.png)

- Restore:

Để restore bản backup trang chủ chúng trên hosting bạn chọn phầnRestore>> Select Partial Backup >> home directory

![anh42](https://image.prntscr.com/image/COGV5B-BRRmYGmsNciQV2w.png)

- 1: chọn file backup từ thiết bị
- 2: tiến hành restore
*Lưu ý *: làm tương tự để backup Database và Email

### 7.2 Đặt lịch Backup dữ liệu auto hàng ngày bằng Cron Jobs

![anh43](https://image.prntscr.com/image/ogKukKkHRtGu0q8dV_uljg.png)

- Sau đó di chuyển đến phần Advanced chọn Cron Jobs :

![anh44](https://image.prntscr.com/image/v8ugYiUDSGyZk64QRT2NYQ.png)

- Trình Cron Job của cPanel gồm 3 mục:

- Cron Email: Đây là email mà mỗi khi thực hiện công việc tự động hệ thống sẽ gửi báo cáo về email này. Email này là duy nhất, bạn không thể thêm mà chỉ có thể sửa.
- Add a New Cron Job: Đây là mục thêm công việc tự động chính gồm:
- Common setting: Lựa chọn tần suất cho công việc. Có các lựa chọn từ mỗi phút cho đến mỗi năm.
- Minute, Hour, Day, Month, Weekday: Chọn tần suất cho công việc theo phút, giờ, ngày, tháng, ngày trong tuần.
Comment: Câu lệnh Linux mà khi đến giờ hẹn sẽ thực hiện.

### 8. Xác định File Log trên Cpanel

- Log file của cPanel được lưu tại thư mục /usr/local/cpanel/logs/, gồm có các file chính sau:

- access_log: log truy cập của cPanel và WHM.

- error_log: log các lỗi của cPanel và WHM.

- login_log: log các đăng nhập cPanel và WHM.

- Ngoài ra, cPanel còn lưu log hệ thống tại thư mục /var/log/, gồm có

- bandwidth: log lưu lượng băng thông sử dụng của server.

- chkservd.log: log hệ thống theo dõi các dịch vụ trên server.

- clamav: log của hệ thống quét virus clamav.

- cpupdate: log tác vụ nâng cấp của cPanel.

- exim_mainlog: log gửi/nhận thư của hệ thống mail exim.

- exim_rejectlog: log các kết nối bị từ chối của exim.

- exim_paniclog: log các lỗi của exim.

- maillog: log các đăng nhập và kết nối gửi/nhận thư của các dịch vụ mail (pop3/imap).

- xferlog: log các kết nối qua FTP.

- Ngoài ra, log của các tài khoản được lưu trữ trong thư mục /usr/local/cpanel/domlogs/ và log của Apache được lưu tại /usr/local/apache/logs/.

- Ở trang chủ sau khi login Cpanel hỗ trợ người các tính năng kiếm soát truy cập , băng thông cũng như hiển thị một số log

   - Awstats
   - Bandwidth
   - CPU and Concurrent Connection Usage
   - Errors
   - Raw Access
   - Visitors
   - Webalizer
   - Webalizer FTP