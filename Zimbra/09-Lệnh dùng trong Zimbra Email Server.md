# Các lệnh thường dùng trong Zimbra Email Server

## 1./ Check logs user zimbra
```
/opt/zimbra/libexec/zmmsgtrace -r '@gmail.com'

/opt/zimbra/libexec/zmmsgtrace -r​​ abc@gmail.com
```
Lưu ý logs này là logs của người nhận ví dụ​​ người nhận là có đuôi email là gmail thì sẽ​​ có logs gửi từ​​ 1 account nào đó trong zimbra ra gmail.

## 2./ Check service antivirus
```
su zimbra

zmantivirusctl status

zmantivirusctl start
```
## 3./ Start service amavisd
```
zmamavisdctl start
```
## 4./ Check Logs zimbra
```
tail -100f /var/log/zimbra.log
```
## 5./ Check Logs cbpolicyd
```
tail -100f /opt/zimbra/log/cbpolicyd.log
```
## 6./ Check status service bất kỳ, ví dụ​​ antivirus
```
zmantivirusctl stop

zmantivirusctl start

zmantivirusctl status

```
## 7./ Kiểm tra clamd có đang hoạt động hay không, điều chỉnh thời gian update signature clamd
```
zmclamdctl status
```
Tư động update clamd sau mỗi 2h
```
zmprov mcf zimbraVirusDefinitionsUpdateFrequency 2h
```
check logs fresh clam
```
/opt/zimbra/log/freshclam.log
```
https://wiki.zimbra.com/wiki/Antivirus

## 8./ Kiểm tra Logs virus
```
tail -100f /opt/zimbra/log/clamd.log
```
Kết quả:​​ 

Wed Jun ​​ 3 13:30:06 2020 -> SelfCheck: Database status OK.

Wed Jun ​​ 3 13:38:51 2020 -> /opt/zimbra/data/amavisd/tmp/amavis-20200603T133848-08980-BGyhxkrX/parts/p006: Win.Trojan.Hacktool-1505 FOUND

Wed Jun ​​ 3 13:38:52 2020 -> /opt/zimbra/data/amavisd/tmp/amavis-20200603T133848-08980-BGyhxkrX/parts/p003: Win.Trojan.Hacktool-1505 FOUND

## 9./ Cấu hình giới hạn dung lượng tối đa email được phép gửi và nhận zimbraMtaMaxMessageSize and message_size_limit
```
#su - zimbra
````
$ postconf message_size_limit

$ zmprov modifyConfig zimbraMtaMaxMessageSize 2048000

$ postfix reload

Xác nhận lại cấu hình đã sửa

$ postconf message_size_limit

## 10./ Bypasss amavis trong mạng Local

Mặc định mạng local amavis vẫn scan và hoạt động bình thường, nếu setup bypass amavis trong mạng local thì amavis sẽ​​ Bypass SpamAssassin.
```
su - zimbra

zmprov mcf zimbraAmavisOriginatingBypassSA TRUE​​ 

zmantispamctl restart​​ 

zmantivirusctl restart​​ 

zmamavisdctl restart​​ 
```
## 11./ Chặn block users hoặc domain blacklist

tạo 1 file như dưới và list các domain, users blacklist vào

/opt/zimbra/common/conf/postfix_reject_sender​​ 

 

nano /opt/zimbra/common/conf/postfix_reject_sender

 

zimbra@mail ~# zmprov ms mail.yourdomain.com​​ +zimbraMtaSmtpdSenderRestrictions "check_sender_access lmdb:/opt/zimbra/common/conf/postfix_reject_sender"

zimbra@mail ~# /opt/zimbra/common/sbin/postmap /opt/zimbra/common/conf/postfix_reject_sender

zimbra@mail ~# zmmtactl restart

# 12./​​ Đổi tên Domain​​ Email Zimbra
```
zmprov -l rd [olddomain.com] [newdomain.com]
```
Sau đó khởi động lại server.

# 13./​​ Kiểm tra show tất cả​​ cài đặt trong zimbra
```
zmlocalconfig
```
# 14./​​ Lệnh show list​​ block domains hoặc user
```
postconf | grep smtpd_sender_restrictions
```
# 16./ File config của Zimbra​​ 
```
/opt/zimbra/common/conf/main.cf
```
# 17./​​ Check hostname zimbra
```
zmhostname 
```
# 18./Kiểm tra version của zimbra
```
zmcontrol -v
```
# 19./​​ Kiểm tra queue zimbra
```
postqueue -p
```

Tài liệu tham khảo 
https://fixloinhanh.com/cac-lenh-thuong-dung-trong-zimbra-email-server/