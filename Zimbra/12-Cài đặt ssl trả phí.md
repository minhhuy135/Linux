# Cài đặt ssl trả phí email zimbra

Bước 1 : SSL vào Email Server 
```
# su - zimbra
```
```
#cd /opt/zimbra/ssl/zimbra/commercial
```


#vi commercial.key     ( Paste nội dung file Private key )
#vi commercial.crt      ( Paste nội dung file cert .pem )
#vi commercial_ca.crt ( Paste nội dung file Chain_RootCA_Bundle )

•	#Tạo file xong cấp lại quyền : 
```
chown zimbra:zimbra * -R
```
Bước 2 : Kiểm tra chứng chỉ số SSL 
```
 /opt/zimbra/bin/zmcertmgr verifycrt comm commercial.key commercial.crt commercial_ca.crt
```

Nếu kết quả trả về là “Certificate is OK” thì có thể chuyển sang bước tiếp theo
-	Link ảnh chi tiết : https://prnt.sc/thh9hu 
           
Ghi chú: Nếu bạn không tự tạo CSR trên Zimbra, trước tiên đặt file private key cho           certificate của bạn vào folder: /opt/zimbra/ssl/zimbra/commercial/
            Private key file cần phải đặt tên là commercial.key.
           Bước 3 : Chạy lệnh sau để deploy chứng thư số:
            # /opt/zimbra/bin/zmcertmgr deploycrt comm commercial.crt commercial_ca.crt

           Bước 4 : Reset service zimbra
          #exit
          #service zimbra restart
