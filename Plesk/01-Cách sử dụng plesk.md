
# III. hướng dẫn sử dụng Plesk

1. tạo gói Plan

2. Tạo user, Domain

3. Tạo tài khoản FTP

4. up site Wordpress

5. Cài đặt chứng chỉ SSL DAOUSIGN

6. Thực hiện Backups/Restore

6.1 thực hiện Backup
6.2 Đặt lịch Backups
6.3 Restore
7. Tạo mail theo tên miền khách hàng

8. Xác định file logs

3. Hướng dẫn cài đặt Plesk trên CentOS 7

- login vào server qua giao thức SSH sử dụng tài khoản root

- chạy lệnh cài đặt wget
```
sudo yum install wget
```
- Sau khi hoàn tất, chạy tiếp lệnh và chờ hệ thống cài đặt:
```
sh <(curl https://autoinstall.plesk.com/one-click-installer || wget -O - https://autoinstall.plesk.com/one-click-installer )

```
![anh2](https://image.prntscr.com/image/CfMNuwJaQFKNRfcXMT6ylQ.png)

sau khi đăng nhập thiết lập thông tin ban đầu: 

<img src="https://image.prntscr.com/image/-oEm7YmBQtqxbpQupCEEXQ.png">
 
 - chờ đợi hệ thống cài đặt:

 <img src="https://image.prntscr.com/image/hd1MNGtUSreHFlNqgpe80Q.png">

- kết thúc cài đặt bạn có 15 ngày dùng thử

<img src="https://image.prntscr.com/image/ACzjwLNuR8S0LPiSgXc_Dg.png">

## III. hướng dẫn sử dụng Plesk
### 1. tạo gói Plan
 Đối với tài khoản ` Admin ` và ` Reseller ` từ màn hình chính chọn mục ` Service Plans `

 <img src="https://image.prntscr.com/image/XOW_NRUeQ-6U-aY0wbqBew.png">

 - Ở mục ` Hosting Plans ` chọn ` Add a Plan ` để tạo gói plan mới 

 <img src="https://image.prntscr.com/image/HBbmfk-sSeC34EsNuXbM5w.png">

 - tiến hành đặt tên cho plan và xác định gói dung lượng và băng thông.

 <img src="https://image.prntscr.com/image/t69y49baQCa_98gHW4wgrQ.png">

# III. hướng dẫn sử dụng Plesk

1. tạo gói Plan

2. Tạo user, Domain

3. Tạo tài khoản FTP

4. up site Wordpress

5. Cài đặt chứng chỉ SSL DAOUSIGN

## III. hướng dẫn sử dụng Plesk

Thay đổi giao diện Plesk vào Tools & Settings > Interface Management


1. tạo gói Plan

Đối với tài khoản Admin và Reseller từ màn hình chính chọn mục Service Plans

Tại giao diện quản lý Plesk, chọn mục Service Plans sau đó chọn Add New Plan

![anh1](https://image.prntscr.com/image/AwV2YKVMQMOS_98hgAoq6w.png)

- Tiếp theo điền các thông tin cần thiết để tạo mới một Plan như:

  - Service plan name: tên hiển thị của Plan cần tạo
  - Disk space: Dung lượng cho Plan
  - Notify when disk space usage reaches: Thông báo khi đạt ngưỡng dung lượng
  - Traffic: Băng thông trong một tháng
  - Notify when traffic usage reaches: Thông báo khi đạt ngưỡng băng thông
  - Domains/Subdomains: Số lượng Domain chính và Sub Domain
  - Mailboxes/Mailbox size/Total mailboxes quota/Mailing lists: Số lượng hộp thư mail, dung lượng cấp cho mỗi mailbox của subscription (dùng để lưu trữ email và các file đính kèm), tổng dung lượng lưu trữ của các hộp thư của subscription và tổng số danh sách mail mà subscription có thể lưu trữ.
  - Additional FTP accounts: Số lượng tối đa tài khoản FTP được sử dụng để truy cập file và các thư mục được tạo trong subscription.
  - MySQL database/MS SQL database: Số lượng cơ sở dữ liệu tối đa được tạo trong Plesk server
  - Total MySQL databases quota/Total MS SQL databases quota: Dung lượng tối đa của MySQL/ MS SQL
  - MS SQL database file size: Dung lượng tối đa của file database
  - MS SQL database log file size: Dung lượng tối đa của file log
  - Expiration date: Thời hạn của Plan

![ANH2](https://image.prntscr.com/image/HjxQxwlqTcWcVxlERKQ5_g.png)

![anh3](https://image.prntscr.com/image/RJJ1As7qSnuc0TKLbkU5dA.png)

Sau khi điền đầy đủ thông tin, Click OK để tiến hành tạo mới Plan.

![anh4](https://image.prntscr.com/image/Sx7xbwRzTkGOLVYgIqL-3A.png)

![anh5](https://image.prntscr.com/image/ZUeDVnc1Q2mKFk-58tkwBQ.png)

# 2. Tạo user, Domain

## Bước 1 : Trên giao Home tìm mục “Customers”->Click “Add New Customer”

![anh6](https://image.prntscr.com/image/MDV7n_LPRn2Soh_ddj92QQ.png)

![anh7](https://image.prntscr.com/image/Tp3MErApTh_q3wDQrzswww.png)

## Bước 2 : Khai báo thông tin Domain cần tạo->Click “OK” hoàn tất

![anh8](https://image.prntscr.com/image/hhN-lKISTAutCqly-WIrzA.png)

## Bước 3: Sau khi tạo mới thành công

![anh9](https://image.prntscr.com/image/g02SA9iwTRaIKofRVD_GVQ.png)

# 3. Tạo tài khoản FTP

Để tạo tài khoản FTP login vào tài khoản domain cần tạo tài khoản FTP

![anh10](https://image.prntscr.com/image/YH4AG1qBRSa47Ddp8lB4ww.png)

## Bước 2: Điền nội dung thông tin tài khoản và bấm "OK"

![anh11](https://image.prntscr.com/image/Kg9OiW9PTNSAgcCj5LRWKg.png)

![anh12](https://image.prntscr.com/image/HTmlhQPSTPO2qk0d16WFzA.png)

## 4. up site Wordpress

Bước 1: tạo cơ sở dữ liệu

Ở màn hình Websites & Domains lựa chọn database để add Database

![anh13](https://image.prntscr.com/image/1fTB4GmrQaauv2xv9oNJlg.png)

Điền nội thông tin Database và user cho cơ sở dữ liệu

![anh14](https://image.prntscr.com/image/Ifv7J9SxS7ejvz_j5BM5FQ.png)

![anh15](https://image.prntscr.com/image/Tnv6omxTR5mg70BC_vSRZw.png)

## Bước 2: Cấu hình cài đặt Wordpress

- Giải nén file wordpress đã đẩy lên từ tài khoản FTP:

- truy cập thư mục httpdocs và giải nén file ta có thư mục Wordpress

![anh16](https://image.prntscr.com/image/xXKQOEQIROeUjIC3L3RNZw.png)

- Đổi tên file wp-config-sample.phph thành wp-config.php và cấu hình kết nối Database:

![anh17](https://image.prntscr.com/image/EX7sKgo7Q2qGtzb1pfUR1Q.png)

- Chuyển tất cả các file giải nén và thư mục httpdocs:

![anh18](https://image.prntscr.com/image/jUPJYGttTpKUzxzYTijAAw.png)

## Bước 3: cấu hình tài khoản quản trị trên web

![anh19](https://image.prntscr.com/image/No_axLB-SlOvSj13cK-B4Q.png)

chú ý xóa file index.html đi 

![anh20](https://image.prntscr.com/image/1OE3lHd8Qu_icy45fBDRZA.png)


# 5. Cài đặt chứng chỉ SSL DAOUSIGN

- Nhấn vào biểu tượng “Chứng nhận SSL/TLS” trên màn hình để bắt đầu cài đặt SSL cho website

![anh21](https://image.prntscr.com/image/SISh8FnhTnKc8E0SfikfAg.png)

- chọn Advanced Setting và Add SSL/TLS Certificate và tiến hành upload file chứng chỉ.

# 6. Thực hiện Backups/Restore

## 6.1 thực hiện Backup

Trên màn hình Websites & Domains kích chọn Database Manager

![anh22](https://image.prntscr.com/image/RAdULLruRvy2YgQ2ACG-Bw.png)

- Chọn Backup để lựa chọn nội dung backups

![anh23](https://image.prntscr.com/image/WraOk9yIT26hdOIfImNbbg.png)

- Sau khi Backup thành công hệ thống sẽ sinh ra file backups có tên chứa thời gian backup

![anh24](https://image.prntscr.com/image/CPT3YvdeTz2sJ6g60KXOzg.png)

- Tại màn hình Database Manager lựa chọn Schedule

- Chọn Activate this backup task này và chỉ định những điều sau

- Khi nào và tần suất chạy bản sao lưu.
Có thực hiện sao lưu gia tăng hay không và nếu có, tần suất sao lưu đầy đủ nên được thực hiện. Một bản sao lưu đầy đủ chứa tất cả cấu hình và nội dung (nếu bạn chọn sao lưu nội dung) nhưng chiếm nhiều dung lượng hơn. Bản sao lưu gia tăng chỉ chứa sự khác biệt giữa trạng thái hiện tại của tài khoản của bạn và trạng thái tại thời điểm sao lưu đầy đủ cuối cùng được thực hiện. Điều này giúp tiết kiệm dung lượng ổ đĩa, nhưng một bản sao lưu gia tăng sẽ vô dụng nếu bản sao lưu đầy đủ tương ứng bị xóa hoặc bị hỏng.
- Các tệp sao lưu sẽ được giữ trong bao lâu trước khi bị xóa.
- Có bao gồm cấu hình và nội dung thư cũng như tệp người dùng và cơ sở dữ liệu trong bản sao lưu hay chỉ sao lưu cấu hình miền.
- Lưu trữ bản sao lưu trên máy chủ hay trong bộ lưu trữ FTP. Nếu không có bộ lưu trữ FTP nào được định cấu hình, hãy nhấp vào Định cấu hình để thiết lập một bộ nhớ.
- Bạn cũng có thể gửi thông báo cho bạn trong trường hợp có bất kỳ sự cố nào với quy trình sao lưu hoặc tạm dừng tất cả các miền trong quá trình sao lưu để đảm bảo tính nhất quán của bản sao lưu. Trên Windows, bạn cũng có thể chọn sao lưu cơ sở dữ liệu Microsoft SQL Server bằng chức năng sao lưu gốc bất cứ khi nào có thể.
- Bấm OK Để chỉnh sửa cài đặt sao lưu đã lên lịch:

- Đi tới Tools & Utilities > Backup Manager.

- Nhấp vào Schedule và thực hiện các thay đổi mong muốn.

-  Để tắt các bản sao lưu đã lên lịch:

- Đi tới Tools & Utilities > Backup Manager.

- Click Schedule và bỏ chọn Activate this backup task checkbox.


![anh25](https://image.prntscr.com/image/xGgGIMKrQGyOfcIy64JVww.png)


## 6.3 Restore

Tại màn hình Database Manager hiển thị các bản Backup hiện có, để Restore bạn cọn 1 bản bất kỳ và lựa chọn nội dung Restore.

![anh30](https://image.prntscr.com/image/8jBVleUJSBWCaWRhznoBjw.png)




## 7. Tạo mail theo tên miền khách hàng

- Đi tới thư mục MAIL trên trang chủ

![anh26](https://image.prntscr.com/image/1jK4p2YDRMWTUd6Sbxev2Q.png)

- Nhấn vào Create Email Address

  - Nhập phần bên trái của địa chỉ email trước dấu @ và nếu bạn có nhiều tên miền trong tài khoản của mình, hãy chọn tên miền mà địa chỉ email sẽ được tạo.

  - Chỉ định một địa chỉ email bên ngoài. Nó sẽ được sử dụng để đặt lại mật khẩu của bạn nếu bạn mất quyền truy cập vào địa chỉ email chính của mình.

  - Chọn hộp kiểm Hộp thư . Xóa hộp kiểm này chỉ có ý nghĩa nếu bạn muốn sử dụng địa chỉ này làm trình chuyển tiếp thư, sẽ chuyển tiếp tất cả thư đến đến một địa chỉ khác.

  - Chỉ định kích thước hộp thư hoặc sử dụng kích thước mặc định được xác định bởi chính sách của nhà cung cấp hoặc gói dịch vụ của bạn.

  - Chỉ định mật khẩu bao gồm năm ký tự Latinh trở lên.

  - Bấm OK .

![anh27](https://image.prntscr.com/image/sfJqGZaMQdml70Tgth_CDw.png)

- Đăng nhập Roundcube để kiểm tra

![anh28](https://image.prntscr.com/image/ji_lkEwdSdWbrOrLFxTo4A.png)

- tiến hành Cài đặt mail lên outlock và test thử gửi 1 mail bất kỳ .

![anh29](https://image.prntscr.com/image/tSoDVQD7QzOPVxYwTvpjrA.png)


# 8. Xác định file logs

Vào mục Websites and Domains >>> Logs. tại đây hệ thống lưu trữ logs theo tài khoản người dùng bao gồm:
- logs/access_ssl_log
- logs/proxy_access_ssl_log
- logs/proxy_error_log
- logs/error_log

![anh32](https://image.prntscr.com/image/rdDvFYWSRju7sFlGNQltww.png)

Plesk hỗ trợ người dùng tính năng real-time trực tiếp để kiểm tra hệ thống

![anh33](https://image.prntscr.com/image/rmpSPkXWRZqJ4Kt9df13nA.png)

Đối với log hệ thống Plesk lưu trữ ở mục Action Log trong Tools & Settings

![anh34](https://image.prntscr.com/image/zGmj1sJATma1QBfqdFc8xg.png)

ở đây muốn đọc log ta tiến hành tải log về bằng cách chọn thời gian xem log cụ thể muốn đọc và tiến hành download

![anh35](https://image.prntscr.com/image/ZSgUsngYT-_qzmcoWCab7g.png)