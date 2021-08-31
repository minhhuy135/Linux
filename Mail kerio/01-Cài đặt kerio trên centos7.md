# Hướng dẫn cài đặt mail server Kerio

## Cài đặt mail server kerio

## Bước 1: Tải Kerio về bằng lệnh wget:

```
wget http://cdn.kerio.com/dwn/connect/connect-9.2.12-5000/kerio-connect-9.2.12-5000-linux-x86_64.rpm
```

## Bước 2: Install mail Kerio
```
yum install kerio-connect-9.2.12-5000-linux-x86_64.rpm -y
```

## Bước 3: Đăng nhập mail bằng địa chỉ IP:4040 dán key và cài đặt.

Tắt hết postfix, sendmail,...

### Cài đặt

![anh1](https://image.prntscr.com/image/1gaKXRmhSAe1x_q111ndIw.png)

![anh2](https://image.prntscr.com/image/Mti_NUDiQ-iyqheC0K8FJQ.png)


Thay đổi thông tin về tên miền và hostname của mail server kerio:

![anh3](https://image.prntscr.com/image/8BoDJ45RRWOYRsDr6u8T9Q.png)

![anh4](https://image.prntscr.com/image/Q0q6xDHvRO_NjZWoRrrkRQ.png)

- Chọn thư mục lưu trữ mail

![anh5](https://image.prntscr.com/image/bmGpJX6nSJOJ9Gjq0SsRNw.png)

- Nhập key nếu bạn có mua license hoặc bạn có thể sử dụng bản trial

![anh6](https://image.prntscr.com/image/NSKiae9CRG2KRmj-6PUhsw.png)

- Nhập key

![anh7](https://image.prntscr.com/image/SrJne7sUQd_sdilZMUYtNg.png)

- Để mặc định và chọn Next

![anh8](https://image.prntscr.com/image/xko7amvWTui2xpYuNmHmKw.png)

- Kết thúc việc cài đặt

![anh9](https://image.prntscr.com/image/bpCanQrJReqI_NaYkuLvOA.png)

- Truy cập control quản trị

![anh10](https://image.prntscr.com/image/EQ0fVDd5Sz2TKAWZB6ZAOQ.png)

- Thay đổi ngôn ngữ

![anh11](https://image.prntscr.com/image/UID9Vwb5QTyeZB2jHPkn6A.png)


- Giao diện của mail server Kerio:

![anh12](https://image.prntscr.com/image/wgkWAJQASIO5UL8yHew2RQ.png)

- Các dịch vụ mail server đang chay

![anh13](https://image.prntscr.com/image/0XxKmT_USxi80U35DDcIJg.png)

- Tạo user trên mail server Kerio:

![anh14](https://image.prntscr.com/image/iODwaYUFQwC04KnnLsrvmg.png)

-  Đăng nhập vào user

![anh15](https://image.prntscr.com/image/f8LUK7RBT5_8GHL5QaTXrA.png)

## 2. Tạo Domains 

Tạo bản ghi DKIM để gửi nhận mail:

![anh16](https://image.prntscr.com/image/CyGM2TFPSY687AfIUgRc9g.png)

![anh17](https://image.prntscr.com/image/FKtlyF57QhuZGSDikHLwSA.png)

- Nhấp vào: Hiển thị khóa công khai => Thêm bản ghi vào miền DNS

![anh18](https://image.prntscr.com/image/cE__k5BSR4Cl7O3x-P3Yuw.png)

- Test gửi nhận bằng mail kerio vừa cài:

![anh19](https://image.prntscr.com/image/TOTSoQi9Sg_Cj3dD_iKw0Q.png)

![anh20](https://image.prntscr.com/image/0qTUbzNxSXW-SZhuKR1IoA.png)

Kiểm tra antivirus xem đã tắt chưa

![anh21](https://image.prntscr.com/image/wFrWtUi-QDaWrlQTW36-KA.png)


- Cách đọc log trên giao diện mail kerio và trên command:

![anh22](https://image.prntscr.com/image/UXHCYP-XQfG9ij-mCBaOAg.png)

Đặt lại mật khẩu quản trị viên trong Kerio Connect

Nếu bạn không thể đăng nhập bằng thông tin đăng nhập quản trị viên Kerio Connect của mình, bạn có thể khôi phục tài khoản quản trị viên bằng cách sửa đổi tệp hoặc tệp theo cách thủ công . Sau đó, bạn sẽ có thể đăng nhập và đặt mật khẩu mới.users.cfg mailserver.cfg

Đổi mật khẩu admin:

Chỉnh sửa .users.cfg tệp Vào thư mục /opt/kerio/mailserver mở file .users.cfg


![anh23](https://image.prntscr.com/image/fyO5ZP94TkO2c2hec3m-pQ.png)

- Tab Queue Options
Configuration → SMTP Server → Queue Options

+ Maximun number of delivery threads: Số lượng tối đa tin nhắn được gửi cùng
một lúc.

+ Delivery retry interval: Khoảng thời gian Kerio Connect thử gửi lại các tin
nhắn.
+ Bounce the message to sender if not delivered in: Khoảng thời gian Kerio
Connect gửi lại các tin nhắn chưa được gửi.
+ Sent the sender a waring if the message is not delivery after: Khoảng thời
gian mà người gửi được thông báo rằng thư của họ chưa được gửi.

# 4. SSL Certificates

Để bảo mật Kerio Connect sử dụng giao thức SSl/TLS, cần phải xác thực
qua một chứng chỉ số SSL.


Tải chứng chỉ ssl
```
yum -y install git dialog libffi-devel mod_ssl openssl-devel python-devel python-pip python-tools python-virtualenv
```
```
git clone https://github.com/letsencrypt/letsencrypt

yum install -y certbot

```

```
cd letsencrypt
```
```
service kerio-connect stop
```
```
certbot  certonly --standalone -d mail.zaraoder.xyz
```
```
ln -s /etc/letsencrypt/live/mail.zaraoder.xyz/fullchain.pem /opt/kerio/mailserver/sslcert/mail.zaraoder.xyz.crt
```
```
ln -s /etc/letsencrypt/live/mail.zaraoder.xyz/privkey.pem /opt/kerio/mailserver/sslcert/mail.zaraoder.xyz.key
```
```
service kerio-connect start
```

kiểm tra

![anh28](https://image.prntscr.com/image/3BpSFp6VQwyt6KDl2yIfwg.png)


![anh29](https://image.prntscr.com/image/HcgzQNDuSwGEVvRonY2nsg.png)


# 5.	Security
Security policy

Về vấn để bảo mật Kerio Connect thực hiện một trong hai cơ chế sau:
+ Xác thực bảo mật người dùng.
+ Mã hóa trong quá trình truyền thông, giao tiếp

![anh26](https://image.prntscr.com/image/6IHeCBx3TLaHj6vmhk1pRQ.png)

- CRAM-MD5: Xác thực mật khẩu sử dụng theo chuẩn MD5
- DIGEST-MD5: Xác thực mật khẩu sử dụng chuẩn MD5
- NTLM: Chỉ sử dụng với Active Directory.
- Sử dụng SSL nếu không sử dụng phương thức xác thực.


![anh27](https://image.prntscr.com/image/U1EiYa1HQ2OTKZy72HzhgQ.png)

 Chọn User must authenticate in order to send messages from a local domain

 Kerio Connect có thể tự động từ chối các email với tên miền giả mạo: Reject
messages with spoofed local domain.

- Configuring anti-spoofing in Kerio Connect

Người gửi spam có thể giả mạo địa chỉ email để gửi email đi. Để tránh
trường hợp đó xảy ra sử dụng tính năng anti-spoofing trong Kerio Connect.


## 6. Content Filter(Bộ lọc nội dung)

Spam Filter

### 6. 1  Tab spam rating

![anh30](https://image.prntscr.com/image/n29cFwewSs64eps9pVVFgg.png)

+ Tag score: Nếu tin nhắn đạt điểm này Kerio Connect sẽ đánh dấu là tin nhắn
spam.
+ Block score: Nếu tin nhắn đạt số điểm này Kerio Connect sẽ loại bỏ thông điệp.

### 6.2 Tab Kerio Anti-spam

![anh31](https://image.prntscr.com/image/kOXydzArQPaum8OTxtpbAQ.png)

+ Kerio Connect gửi dữ liệu được mã hóa tới dịch vụ scan online Bitdefender.
+ Bitdefende quét dữ liệu và gửi kết quả tới Kerio Connect điểm số có thể là 0 cho
thư rác không phải spam, 1-9 cho các mức spam khác nhau

### 6.3 Tab Blacklist

![anh32](https://image.prntscr.com/image/_JfV-Ax9RR2qVM6U2hc-4Q.png)

Thiết lập danh sách các địa chỉ IP được cho là black list và thêm sửa xóa các
Internet blacklist.

### 6.4 Tab Custom Rules

![anh33](https://image.prntscr.com/image/UC5ExYGjS_Sq3Rds33MaKw.png)

Cho phép thêm, sửa xóa các rule spam filter, thứ tự ưu tiên từ trên xuống
dưới.

### 6.5 Tab ID
![anh34](https://image.prntscr.com/image/yMX4aHwsQYWoeX3seOY9uw.png)

Bật tùy chọn Kiểm tra ID người gọi của mọi tin nhắn đến .

Nếu một tin nhắn bị chặn, Kerio Connect có thể

- Ghi nó vào Nhật ký bảo mật
- Từ chối nó
- Tăng / giảm điểm thư rác của nó

### 6.6 Tab SPF

Bật tùy chọn Bật kiểm tra SPF của mọi tin nhắn đến .

![anh35](https://image.prntscr.com/image/8Wt993BfS0yviFVyLNvxGg.png)


- Ghi nó vào Nhật ký bảo mật
- Từ chối nó
- Tăng / giảm điểm thư rác của nó

Nếu thư được gửi qua máy chủ dự phòng, hãy tạo một nhóm địa chỉ IP của những máy chủ đó sẽ không được SPF kiểm tra.

### 6.7 Tab Greylisting
![anh36](https://image.prntscr.com/image/sZ-69cr5Rh6nqdiHwM-9XA.png)

- Để chống spam hiệu quả hơn Kerio connect hỗ trợ Greylisting một phương
pháp chống spam phù hợp với các phương pháp chống thư rác khác và các cơ chế
trong Kerio connect.
Khi Greylisting được bật những vấn để sau sẽ xảy ra khi Kerio nhận được
một tin nhắn:
+ Kerio liên lạc với máy chủ Greylisting và cung cấp thông tin về tin nhắn, máy
+ chủ Greylisting bao gồm danh sách các IP đáng tin cậy

+ Nếu danh sách chứa địa chỉ IP của người gửi thư, tin nhắn sẽ chuyển qua danh sách greylisting và được kiểm tra ngay lập tức.
+ Nếu danh sách không chứa địa chỉ IP của người gửi máy chủ Greylisting sẽ trì
hoãn việc gửi, và cố gắng gửi thư đáng tin cậy lại sau.
+ Một khi tin nhắn được nhận lại dịch vụ Kerio Greylisting sẽ thêm IP của người gửi vào whitelist

### 6.8 Tab Spam Repellent
![anh37](https://image.prntscr.com/image/6kMk31WlTPiH5ETy9nKHHQ.png)

- pam Repellent tính năng chống thư rác hoạt động bằng cách quan tâm đến
sự delay khi truyền thông với giao thức SMTP, các máy chủ hợp pháp thường phải
đợi 2 phút trước khi kết thúc kết nối, trong khi các máy chủ thư rác chỉ có thể đợi 1 vài giây. Một giá trị tốt nhất là 25 giây. Sự điều chỉnh sẽ loại bỏ một số lượng đáng kể thư spam mà không mất email hợp pháp


## 7. Antivirus


Bảo vệ chống vi-rút trong Kerio Connect

- Kerio Connect bao gồm Kerio Antivirus, một biện pháp bảo vệ tích hợp chống lại các email độc hại có chứa vi rút. Vi rút có thể lây nhiễm vào máy tính của bạn và gây hại cho các tệp của bạn hoặc cho hệ thống máy tính của bạn.

- Đối với bất kỳ thông báo nào mà Kerio Antivirus không thể quét, Kerio Connect có thể Gửi tin nhắn gốc có tiền tố cảnh báo hoặc Từ chối tin nhắn như thể đó là vi rút



![anh38](https://image.prntscr.com/image/gXSon5QcSwKBkmStST524w.png)

Chọn hành động thực hiện đối với tin nhắn chứa thư rác:

- Discard the message: Hủy thư
- Deliver the message with the malicious: Gửi thông điệp với mã độc được loại bỏ
Ngoài ra có thể tùy chọn chuyển tiếp tin nhắn:
- Forward the original message to an administrator address: Chuyển tiếp
thông báo tới quản trị viên.
- Forward the filtered message to an administrator address: Chuyển tiếp
thư được lọc sang địa chỉ quản trị viên.
- Đối với bất kỳ tin nhắn nào mà Kerio Antivirus không thể quét, Kerio Connect
có thể thực hiện một trong các hành động:
- Deliver the original message with a warning prefixed: Cung cấp thông
báo với một cảnh báo bắt đầu.
- Reject the message as if it was a virus: Từ chối tin nhắn coi đó là virus

## 8. Attachment Filter

Nhiều virus được ẩn dưới dạng file đính kèm, Kerio có thể lọc các tệp đính
kèm theo những gì đã cài đặt, nếu phát hiện có vấn đề sẽ loại bỏ các tệp tin đính
kèm đó

![anh39](https://image.prntscr.com/image/Ynhum4LaRn2PW_417MRX0Q.png)

- Chọn Enable attachment filter(Bật bộ lọc tệp đính kèm)

   - Nếu muốn Kerio connect thông báo cho người gửi tệp đính kèm không được gửi chọn Send the sender a warning…(Gửi cho người gửi một cảnh báo…)

   - Để Kerio connect gửi thư gốc đến một địa chỉ email khác hãy chọn Forward the original messages to(Chuyển tiếp các tin nhắn gốc tới) và nhập địa chỉ.

   - Để Kerio connect gửi thư được lọc đến một địa chỉ email khác hãy chọn
   Forward the filtered messages to(Chuyển tiếp các tin nhắn đã lọc tới) và nhập địa chỉ.

   - Để loại bỏ các file đính kèm ZIP với các tập tin nguy hiển chọn Discard zip archive containing files with dangerous extensions... tùy chọn.
     +  Cấu hình các rule, mỗi rule sẽ chặn một tệp đính kèm cụ thể

- Configuration → Content Filter → Attachment Filter -> Add

+ Nhập mô tả cho rule mới
+ Định nghĩa kiểu file đính kèm
+ Xác định hành động Kerio Connect blocks/ accepts messages với tệp đính kèm.

![anh41](https://image.prntscr.com/image/c_6IBS2gTfyomynX50E2cg.png)

block the attachment: chặn tệp đính kèm



accept the attachment: chấp nhận tệp đính kèm

## 9 Message Filter

![anh42](https://image.prntscr.com/image/HfhL-Z-qSNSAg4BApIPBAA.png)

Ví dụ Gửi tin nhắn trả lời tự động

![anh43](https://image.prntscr.com/image/fnvSnzFwRxWBq3AQ7MJA4Q.png)


Gửi một bản sao của một tin nhắn đến một địa chỉ email khác

![anh44](https://image.prntscr.com/image/ch3KVmtwTcqSHDOreEzujQ.png)

## 10 . Denifitions

 ### Time Ranges