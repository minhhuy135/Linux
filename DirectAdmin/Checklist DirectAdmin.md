## Check list Directadmin

# Mục Lục

1. Cài đặt DirectAdmin (DA)
2. Tạo gói
3. Tạo client
4. Tạo domain, tài khoản FTP, database, up site ví dụ wordpress
5. Tạo email cho các khg theo tên miền.
6. Gửi email khi tạo gói cho KHG hoặc thay đổi các thông tin của client
7. Backup / restore code, db trên chính máy DA
8. Cấu hình SSL Let's encrypt
9. Sử dụng custombuid để thay đổi phiên bản các ứng dụng (hay dùng PHP, MySQL, build Multil version PHP)
10. Xác định file log của DA.
11. Đặt lịch backup code + DB định kỳ
12. KIểm tra log http, ram, cpu
13. Change IP của các máy DA khi đổi máy chủ
14. Add thêm IP cho các domain chạy các IP khác nhau
15. Cấu hình chuyển các mode httpd
16. Cài đặt và sử dụng CSF

# Thực Hiện

## 1. Cài đặt DA

## 2. Tạo gói (Packages)

Để tạo gói ( package ) Reseller trong DirectAdmin, bạn có thể làm các bước như sau:

- Đăng nhập vào tài khoản admin.

- Chọn mục Manage Reseller Packages:

![anh1](https://image.prntscr.com/image/dVnK_2igSFC2fZa3xa5_lw.png)

- Tiếp theo chọn Add Package:

![anh2](https://image.prntscr.com/image/hTVGgswKRPKEY60IoRgoXQ.png)

- Tiếp theo bạn điền các thông số cho gói ( package ) Reseller muốn tạo, ở đây bạn cần quan tâm tới các thông số sau:

*) Chú ý: Nếu bạn muốn 1 thông số nào đó không bị giới hạn thì click chọn Unlimited tương ứng với thông số đó.

![anh3](https://image.prntscr.com/image/zq44UPqbQr_a1a0Yz00KxQ.png)

1. Bandwidth (MB): Dung lượng băng thông tối đa hàng tháng.

2. Disk Space (MB): Dung lượng ổ cứng lưu dữ liệu tối đa.

3. Domains: Số lượng domain tối đa cho 1 tài khoản ( user ) thuộc gói này. Nghĩa là nếu bạn muốn những user thuộc gói này có thể thêm được 9 addon domain thì bạn điền 10.

4. Sub-Domains: Số lượng sub-Domains tối đa cho 1 tài khoản thuộc gói này.

5. MySQL Database: Số lượng cơ sở dữ liệu tối đa cho 1 tài khoản thuộc gói này.

6. Domains Pointers: Số lượng parked domain tối đa cho 1 tài khoản thuộc gói này.

Sau đó bạn kéo xuống cuối trang điền tên cho gói Reseller này( mặc định đang để là newpackage), giả sử tôi đặt tên cho gói này là Basic, sau đó nhấn Save:

![anh4](https://image.prntscr.com/image/vH9CisTzRAKgpNlA0mr9xw.png)

Như vậy là tôi đã tạo xong 1 gói Reseller tên là Basic có các thông số như sau:

Bandwidth (MB): 5000MB

Disk Space (MB): 1000MB

Domains: 10

Sub-Domains: Không giới hạn

MySQL Database: 3

Domains Pointers: 10

## 3. Tạo client

- Trước hết để tạo tài khoản Reseller bạn cần tạo gói ( package ) Reseller.

- Sau khi đã có các gói Reseller bạn nhấn vào Home để quay lại trang chủ của tài khoản admin, sau đó chọn Create Reseller:

![anh5](https://image.prntscr.com/image/b4sUA-mzRgSsQ9NZR1dfMw.png)

- Tiếp theo bạn điền đầy đủ thông tin và chọn gói package cho tài khoản Reseller này ở mục Use Reseller Package:

![anh6](https://image.prntscr.com/image/vAlW7XF0RHynmme1AbRhXQ.png)

- Trong đó:
  - Username: Tên của user, dùng để đăng nhập vào quản lý hosting của user đó.
  - E-mail: E-mail dùng để liên lạc với user đó, bao gồm việc gửi thông tin về tài khoản và các thông báo từ Reseller.
  - Enter Password: Đặt mật khẩu cho user.
  - Re-enter Password: Gõ lại mật khẩu cho user ( cần gõ chính xác với mật khẩu ở trên)
  - Domain: Tên miền của user.

- Sau đó bạn ấn vào Submit để hoàn thành việc tạo 1 user mới.

4. Tạo domain, tài khoản FTP, database, up site ví dụ wordpress
Tạo tên miền : sau khi đăng nhập bằng tài khoản user hệ thống yêu cầu nhập thông tin tên miền hoặc tạo mới. Chọn Domain setup và nhập tên miền.

![anh7](https://image.prntscr.com/image/gmdkhkvBTJO6QVO2q5X7Ew.png)

- Tạo tài khoản FTP:

  - Chọn vào FTP managenment rồi tạo tài khoản FTP:

![anh8](https://image.prntscr.com/image/3cG7XdPkTrWoWdGx1oDaXA.png)

- Tạo database: Create database

![anh9](https://image.prntscr.com/image/KpqC2YJUTxiarz3_s7LFTg.png)