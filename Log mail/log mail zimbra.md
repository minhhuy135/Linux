# Các lệnh thường dùng trong Zimbra Email Server

Ngoài các câu lệnh ra thì còn kiểm tra trên trang quản trị admin vào thư mục log

## Các lệnh thường dùng trong Zimbra Email Server

1. Check logs user zimbra
```
/opt/zimbra/libexec/zmmsgtrace -r '@gmail.com'

/opt/zimbra/libexec/zmmsgtrace -r​​ abc@gmail.com

```
Lưu ý logs này là logs của người nhận ví dụ​​ người nhận là có đuôi email là gmail thì sẽ​​ có logs gửi từ​​ 1 account nào đó trong zimbra ra gmail.

2. Check service antivirus
```
su zimbra

zmantivirusctl status

zmantivirusctl start

``` 


3. Check Logs zimbra

```
tail -100f /var/log/zimbra.log
```

