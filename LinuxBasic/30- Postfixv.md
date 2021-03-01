# Tìm hiểu về Postfix

Postfix là chương trình mã nguồn mở và miễn phí (free and open-source) dùng để gửi thư điện tử (Mail Transfer Agent – MTA) được tạo ra ban đầu tại IBM với mục tiêu là thay thế chương trình gửi mail phổ biến là&nbsp;Sendmail.&nbsp;Postfix được phát triển dựa trên&nbsp;mục tiêu là nhanh, dễ quản lý và bảo mật.

## Cài đặt Postfix trên CentOS 7

### 1. Xóa Sendmail

- Trước tiên cần kiểm tra xem sendmail đã được cài đặt chưa bằng câu lệnh:

`rpm -qa | grep sendmail`

- Nếu có kết quả trả về chứng tỏ sendmail đã được cài đặt. Ta cần remove nó:

`yum remove sendmail*`

### 2. Cài đặt Postfix

- Cài đặt Postfix và các gói cần thiết:

`yum -y install postfix cyrus-sasl-plain mailx`

- Càu đặt thư viện Cyrus SASL:

`yum -y install cyrus-sasl cyrus-sasl-devel cyrus-sasl-gssapi cyrus-sasl-md5 cyrus-sasl-plain`

- Đặt Postfix làm MTA (Mail Transfer Agent) mặc định của hệ thống:

`alternatives --set mta /usr/sbin/postfix`

- Nếu câu lệnh bị lỗi và trả về output `/usr/sbin/postfix has not been configured as an alternative for mta` thì thực hiện lệnh sau:

`alternatives --set mta /usr/sbin/sendmail.postfix`

- Restart Postfix và cho phép Postfix khởi động cùng hệ thống:

```
systemctl restart postfix
systemctl enable postfix
```
### 4. Cấu hình Postfix

Mở file cấu hình `main.cf`:
```
vi /etc/postfix/main.cf`
```
Thêm những cấu hình sau:

```
myhostname = mail.qatest.xyz
mydomain = qatest.xyz
myorigin = $mydomain
home_mailbox = mail/
mynetworks = 127.0.0.0/8
mydestination = $myhostname, localhost.$mydomain, localhost, $mydomain
smtpd_sasl_auth_enable = yes
smtpd_sasl_type = cyrus
smtpd_sasl_security_options = noanonymous
broken_sasl_auth_clients = yes
smtpd_sasl_authenticated_header = yes
smtpd_recipient_restrictions = permit_sasl_authenticated,permit_mynetworks,reject_unauth_destination
smtpd_tls_auth_only = no
smtp_use_tls = yes
smtpd_use_tls = yes
smtp_tls_note_starttls_offer = yes
smtpd_tls_key_file = /etc/postfix/ssl/smtpd.key
smtpd_tls_cert_file = /etc/postfix/ssl/smtpd.crt
smtpd_tls_CAfile = /etc/postfix/ssl/cacert.pem
smtpd_tls_received_header = yes
smtpd_tls_session_cache_timeout = 3600s
tls_random_source = dev:/dev/urandom
```

#### 5. Cấu hình Postfix SASL Credentials

- Tạo file /etc/postfix/sasl_passwd và thêm vào dòng sau:

`[smtp.gmail.com]:587 username:password`

Trong đó:

    - username: là địa chỉ email dùng để gửi mail

    - password: là password của email dùng để gửi mail


- Phân quyền cho file vừa tạo:

```
postmap /etc/postfix/sasl_passwd
chown root:postfix /etc/postfix/sasl_passwd*
chmod 640 /etc/postfix/sasl_passwd*
systemctl reload postfix
```

#### 6. Cho phép ứng dụng truy cập gmail

Nếu bạn sử dụng gmail làm địa chỉ người gửi thì bạn phải cho phép ứng dụng truy cập gmail của bạn.

Đăng nhập bằng gmail để thực hiện gửi mail đã khai báo bên trên trên trình duyệt và truy cập vào địa chỉ sau.

https://myaccount.google.com/lesssecureapps

Bật chế độ cho phép ứng dụng truy cập

<img src="https://imgur.com/KCAQhTx.png">

### Kiểm tra gửi mail

Kiểm tra việc gửi mail có thành công không:

`echo "Testing mail" | mail -s "Postfix test" huyhoaxa@gmail.com

Chú ý mail gửi ở đây là mail ta cấu hình tại `/etc/postfix/sasl_passwd`

Kết quả nhận được:

![anh1](https://image.prntscr.com/image/--bBOM3rRA2qp_M7fNQySA.png)

## Tài liệu tham khảo

https://news.cloud365.vn/huong-dan-gui-mail-dung-postfix/

https://blog-xtraffic.pep.vn/huong-dan-cach-cai-dat-mail-server-voi-postfix-dovecot-cyrus-sasl/