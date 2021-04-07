# Dựng Plesk Sharewindows

1. Cài IIS

![anh1](https://image.prntscr.com/image/AzoxweVBQ3_mnAymWM6YVg.png)

![anh2](https://image.prntscr.com/image/z2-brvtVSva-PngUR2t5nQ.png)

![anh3](https://image.prntscr.com/image/Yn3WpxXlRSWR0JxL7cr0Sg.png)

chọn web server (IIS)

![anh4](https://image.prntscr.com/image/V8RoKoNgQ4290DLaI9eIgQ.png)

![anh5](https://image.prntscr.com/image/dfhHKn7pSVS4R0Y4hRwFXg.png)

![anh6](https://image.prntscr.com/image/1Wnga_20TM6xUSeHotWS_Q.png)

- Tích chọn hết

![anh7](https://image.prntscr.com/image/L-k9W0SxQiieC2GvIi9iBg.png)

![anh8](https://image.prntscr.com/image/pwOKRX9ISxCj-CZGCSg92g.png)

![anh9](https://image.prntscr.com/image/SCZmdLIZSJ_SuTX7PDQ5Sw.png)

- Nếu lúc cài IIS mà gặp lỗi như trong ảnh dưới thì thực hiện như hướng dẫn.

![anh10](https://image.prntscr.com/image/sLCTzYNcSlOA9NK4HXrrpQ.png)

- Mở Command Promt (CMD)

Chạy lệnh dưới cho tới khi Sucessfulll là được.
```
dism /Online /Enable-Feature /FeatureName:NetFX3 /All /Source:D:\Sources\SxS\ /LimitAccess
```

+ Cài xong reboot server

# 2. Cài MS SQL 2016

- Downloaf cài JRE Oracle
- 123xuzu@gmail.com/Thanh123
https://www.oracle.com/technetwork/java/javase/downloads/jre8-downloads-2133155.html

![anh11](https://image.prntscr.com/image/mcwbpl4xTgONfuswgIswrQ.png)

Khi cài đặt song java

![anh12](https://image.prntscr.com/image/FYKSLjekT2WFYp4iDzz_xA.png)

- Cài đặt sql 2016

# II. Các bước chuẩn bị

1. Tải về và thực thi file cài đặt SQL Server 2016 SP2 Express từ trang chủ Microsoft.

2. Chọn chế độ cài đặt Custom để thiết lập những tính năng mặc định không được bật ở chế độ cài đặt Basic

![anh13](https://image.prntscr.com/image/0zn6hAu9SJqbc8ZxYAyFdg.png)

3. Chỉ định đường dẫn lưu trình cài đặt và nhấn chọn Install để khởi động tiến trình cài đặt.


Quá trình cài đặt bắt đầu diễn ra, bạn hãy đợi cho đến khi hoàn thành việc cài đặt

![anh14](https://image.prntscr.com/image/eDw8Y7olQ0mHr6grYc5RWw.png)

## III. Các bước cài đặt SQL Server Express

Khi trình cài đặt xuất hiện, bạn hãy thực hiện các bước sau

+ Bước 1: Chọn New SQL Server stand-alone installation để cài đặt SQL Server từ đầu. Hoặc cần nâng cấp một số tính năng trước đó.

![anh15](https://image.prntscr.com/image/qLUUNSIpTaydbhiYCtp30Q.png)

![ANH16](https://image.prntscr.com/image/9lBV_29JQ-azLi0KUxwu3w.png)

+ Bước 2: Check vào ô Accept the licensing terms => và nhấn Next

![ANH17](https://image.prntscr.com/image/1ZZZ6tcgRVSdgvnLFxYAyw.png)

+ Bước 3: tính năng Windows Update để cài đặt các bản cập nhật mới nhất từ Microsoft. Bạn nhấn Next để tiếp tục.

![Anh18](https://image.prntscr.com/image/1ZZZ6tcgRVSdgvnLFxYAyw.png)

![anh19](https://image.prntscr.com/image/N8WuPPFrTSOrDVAH61xt5A.png)

![anh20](https://image.prntscr.com/image/Wuqx9vfrSCqrvNjPq4eaCw.png)

![anh21](https://image.prntscr.com/image/IQeFcsBnQhKsC441WvDPvg.png)

![anh22](https://image.prntscr.com/image/5DMISOFSSAye4d6BIdp7yw.png)

![anh23](https://image.prntscr.com/image/jOgvqmR7QkC8W87rMCLtxw.png)

![anh24](https://image.prntscr.com/image/PIooY7IER7mObFvq49lMsg.png)

![anh25](https://image.prntscr.com/image/g3ZlEuSnQPSot0Y4_Ine0Q.png)

![anh26](https://image.prntscr.com/image/2iTwAe16Rna6UCpt3gWpmQ.png)

![anh27](https://image.prntscr.com/image/TutTfNcYTqqfBomfv2YQnA.png)

![anh28](https://image.prntscr.com/image/CEyR-WeYR3qhqWWfaAiTmw.png)

![anh29](https://image.prntscr.com/image/aBWUG3GgTtS2uUyZLrYaaw.png)

![anh30](https://image.prntscr.com/image/XHL15NOxR3SFre6wXpmccg.png)

- Chờ 30 phút để cài xong.

![anh31](https://image.prntscr.com/image/lwXEUNZQSDqiqo5qrXPpRw.png)

![anh32](https://image.prntscr.com/image/pFw8LzSQTa6q5UQxGg_9PQ.png)

- Cài studio mngt 2016

https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms?view=sql-server-ver15

- Reboot lại server

## 3. Cài Plesk

![anh33](https://image.prntscr.com/image/UJSU7hZWQm2oHLVs5amP9w.png)

- Mở với chrome

![anh34](https://image.prntscr.com/image/RM0AkbqhRx_kMp0hojjltw.png)

- Login cài đặt Plesk với pass của server

![anh35](https://image.prntscr.com/image/qWlGlL9vRviMQAtX69vsiQ.png)

![anh36](https://image.prntscr.com/image/KQx2zkhMSsSL5on8Qqca9w.png)

- Lựa chọn cài đặt thêm các gói bổ sung

![anh37](https://image.prntscr.com/image/ZIhn496CRbS4KvrQICd_pg.png)

![anh38](https://image.prntscr.com/image/77-f01OsRa2sDS2LjWvj0Q.png)

![anh39](https://image.prntscr.com/image/oJPE7zZWQc2eDp4vdSUDeg.png)

![anh40](https://image.prntscr.com/image/ZMmOyj8PQKasKZKHHpxTcQ.png)

![anh41](https://image.prntscr.com/image/ZMmOyj8PQKasKZKHHpxTcQ.png)

- Set pass cho admin Plesk và cài đặt

![anh42](https://image.prntscr.com/image/CrubMSwKTWOiXJ9oEqxXXA.png)

- Quá trình cài đặt đang diễn ra

![anh43](https://image.prntscr.com/image/4xMyz7VMSIeNa9jC0NUiWw.png)

- Cài đặt thành công

![anh44](https://image.prntscr.com/image/JbjOvYnIRSGptRZTz2CmTw.png)

- Login

https://ip-server:8443

![anh45](https://image.prntscr.com/image/KvcVroi9QoaLwCj6s82YHA.png)

- Điền thông tin lần đầu

![anh46](https://image.prntscr.com/image/RSS7AgyITgajC_gFGCw2ww.png)

![anh47](https://image.prntscr.com/image/STLM6ZDmQZSP5HvzWUaNXg.png)

![anh48](https://image.prntscr.com/image/Wry9uWXlRxmDb-N2ez69XA.png)

- Crack Windows
Download: http://103.57.210.13/plesk.zip (user: nhanhoa | pass: 15935700)
Giải nén file plesk.zip (pass: Atula), chạy file plesk.bat

Cần thiết reset pass admin bằng lệnh: Mở cmd admin gõ 2 lệnh dưới.
```
plesk login
plesk bin admin --set-admin-password -passwd "new_password"

```

4. Cài các thành phận phụ trợ theo check list

- Install IIS: ASP, .NET 3.5, .NET 4.7, PHP 5.6, 7.x (Đã cài lúc cài IIS, Plesk)
- Download và cài ASP Upload

- Download và cài ASP mail, ASP jpeg

5, Đổi port remote 3389

- Vào Start, chọn Run (hoặc bấm phím Windows + R)
- Gõ dòng lệnh sau đây vào hộp thoại Run: regedit và nhấn Enter
Tìm đến đường dẫn: HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp
Double click PortNumber và chọn Decimal sau đó nhập vào số port cần change ở mục Value data:

![anh49](https://image.prntscr.com/image/cMFhbFwdSlSK4J_pg7ohXA.png)

+ On firewall, mở ICMP

![anh50](https://image.prntscr.com/image/LCxBi6tpTFyURecheobayg.png)

5. Setting một số phần trong Plesk

Add binding cho webmail => Để có thể truy cập qua port 8425 vào IIS

![anh51](https://image.prntscr.com/image/MPuku4fRTkqi92blnsbqqg.png)

![anh52](https://image.prntscr.com/image/V-IrnRPKQmORmFbHLP4IxA.png)

![anh53](https://image.prntscr.com/image/B8IvYT1xSpuEXKuNRPmsOw.png)

Tài liệu tham khảo

https://www.evernote.com/shard/s504/client/snv?noteGuid=7a9430bf-d515-45bc-ac0c-ee37a9fca8bb&noteKey=10865fa6b26a907f&sn=https%3A%2F%2Fwww.evernote.com%2Fshard%2Fs504%2Fsh%2F7a9430bf-d515-45bc-ac0c-ee37a9fca8bb%2F10865fa6b26a907f&title=D%25E1%25BB%25B1ng%2BPlesk%2BSharewindows