# Mail kerio

- kerio thì vào trang quản trị admin để xem logs

- hoặc ssh vào server truy cập đường dẫn /opt/kerio/mailserver/store/log





# Mail zimbra



ssh vào sever truy cập đường dẫn log zimbra /var/log/maillog


Link : https://fixloinhanh.com/cac-lenh-thuong-dung-trong-zimbra-email-server/


Các lệnh thường dùng trong Zimbra Email Server
Check logs user zimbra
```
/opt/zimbra/libexec/zmmsgtrace -r '@gmail.com'

/opt/zimbra/libexec/zmmsgtrace -r​​ abc@gmail.com

```

Lưu ý logs này là logs của người nhận ví dụ​​ người nhận là có đuôi email là gmail thì sẽ​​ có logs gửi từ​​ 1 account nào đó trong zimbra ra gmail.

Check service antivirus
```
su zimbra

zmantivirusctl status

zmantivirusctl start
```
Check Logs zimbra
```
tail -100f /var/log/zimbra.log

```