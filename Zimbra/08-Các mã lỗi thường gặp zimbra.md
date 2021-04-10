# TỔNG HỢP CÁC LỖI PHỔ BIẾN TRONG MAIL ZIMBRA

## Kiểm tra service :

```
su zimbra

zmcontrol status

```

![anh1](https://image.prntscr.com/image/NcN8wsF1TFmuTJ4kCb6RYw.png)

- Nếu có lỗi , tiến hành restart dịch vụ bằng câu lệnh sau ”

```
zmcontrol restart
```
![anh2](https://image.prntscr.com/image/qG7iLH2RSraSy0S5yM2pDQ.png)

Home / CNTT / Mail Server / Tổng hợp các lỗi phổ biến trong Mail Zimbra
TỔNG HỢP CÁC LỖI PHỔ BIẾN TRONG MAIL ZIMBRA
 CNTT , MAIL SERVER
VNITNEWS xin giới thiệu bạn đọc bài viết “Tổng hợp các lỗi phổ biến trongMail Zimbra” do trang sưu tầm và đúc kết kinh nghiệm được. Hi vọng đây bài viết sẽ hữu ích đối với các bạn trong quá trình quản trị hệ thống mail open source này.
Vào một ngày đẹp trời, tự nhiên hệ thống Mail của công ty bị gặp trục trặc , bạn sẽ cần phải thao tác thật nhanh sao cho hoạt động của hệ thống ổn định trở lại. Vậy đâu là nguyên nhân và cách khắc phục cho những lỗi đó, chúng ta hãy cùng tham khảo những lỗi phổ biến sau nhé.

Bước 1 : Kiểm tra service :
```
#su zimbra
#zmcontrol status
```
=> Nếu có lỗi , tiến hành restart dịch vụ bằng câu lệnh sau ”
```
#zmcontrol restart
```
= > Nếu service vẫn lỗi, các bạn hãy làm các bước tiếp theo sau
Bước 2 : Tiến hành Backup hệ thống Mail trước khi xử lí lỗi
Bước 3 : Đối chiếu lỗi với danh sách dưới đây để tìm cách khắc phục. Danh sách lỗi của Zimbra sẽ được VNITNEWS cập nhật liên tục trong bài viết này

# Danh sách lỗi phổ biến :

## Zimbra_01 ) mta stopped + postfix is not running

Khắc phục :
```
#service postfix stop
#chkconfig postfix off
#su – zimbra
$zmcontrol restart
```

## Zimbra_02 ) Ldap failed khi setup Zimbra
Khắc phục : 
```
#vi /etc/sudoers
```
Tìm đến dòng Defaults requiretty và thêm # đằng trước
```
#Defaults requiretty
```
## Zimbra_03 ) Starting zmconfigd…/opt/zimbra/bin/zmconfigdctl: line 94: 17418 Killed

Khắc phục :
```
#su root
#vi /etc/hosts
```
Thêm # như dòng sau :
```
##::1 localhost localhost.localdomain localhost6 localhost6.localdomain6
#su zimbra
#zmcontrol restart
```

## Zimbra_04 ) stat stoped
Khắc phục :
```
#vi /etc/hosts
```
Kiểm tra trong host đã đủ dòng sau chưa :
```
127.0.0.1 localhost
101.159.50.188 mail.zaraoder.xyz
```
## Zimbra_05 ) mysql , zmconfigd is not running 
Khắc phục :
```
#zmcontrol stop
#rm -rf /opt/zimbra/db/data/*
#/opt/zimbra/libexec/zmmyinit
#zmcontrol restart
```
## Zimbra_06 ) dnscache is not running
Khắc phục :
``` 
#su zimbra
#zmdnscachectl stop
```
## Zimbra_09 ) Zimbra zmconfigd not starting/running
Khắc phục : 
```
#su root
#yum install which
#su zimbra
#rm -rf /opt/zimbra/log/zmconfigd.pid
#zmconfigdctl start
```

## Zimbra_12 ) Not send mail by network IP 
Lỗi do MTA của Zimbra chưa được cấu hình thêm dải mạng khớp với IP Public MX của domain gây nên tình trạng thư không gửi được.
Khắc phục :
Kiểm tra dải mạng MTA Zimbra đang permit :
```
#su – zimbra
#zmprov gs zmhostname | grep zimbraMtaMyNetworks
```
hoặc
```
#su – zimbra
#postconf -d mynetworks
```
Nếu không có dải mạng IP Public. Thêm bằng câu lệnh sau :
VD: IP Public Zimbra : 1.1.1.1/24
#su – zimbra
#zmprov ms zmhostname zimbraMtaMyNetworks “127.0.0.0/8 1.1.1.1/24”
#zmcontrol restart

## Zimbra_13 ) Zimbra not send/receive email 
Nguyên nhân / Khắc phục :
Lỗi bản ghi MX => Kiểm tra bản ghi MX
Firewall chặn port => Kiểm tra port 25

Tài liệu tham khảo 
http://www.idz.vn/2016/06/ong-hop-cac-loi-pho-bien-trong-mail.html