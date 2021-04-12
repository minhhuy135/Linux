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