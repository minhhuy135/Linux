## Check list Directadmin
a
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

- Điền thông tin database rồi chọn pass random và bấm vào Create để tạo mới database:

![anh10](https://image.prntscr.com/image/vQjqBg4iRKGb7lw2OA2qcA.png)

- sau khi hoàn thành hệ thống sẽ hiển thị thông tin database

![anh11](https://image.prntscr.com/image/6XJ72vHWQaixvOVWThUnLw.png)

- Up site wordpress

  - Đầu tiên phải tải file của wordpress: https://wordpress.org/download/

  - Các bước up site:
1. 
  ![anh12](https://image.prntscr.com/image/ct0s95nyTvCMCXhuSBFPdg.png)

2 .
![anh13](https://image.prntscr.com/image/h3yFYaiRTkCyg-1eOEY-YQ.png)

3. 
![anh14](https://image.prntscr.com/image/ACgu4ISVSjGADN1DRirTLA.png)

4. 
![anh15](https://image.prntscr.com/image/xX_imIgIQrSRhIZ9mLZgwg.png)

Chú ý : Để ý phần dung lượng để up file 

![anh16](https://image.prntscr.com/image/RE8knA-5Tkq8OboDYoVOdA.png)

5. Ta đã thấy file wordpres và tiến hành giải nén

![anh17](https://image.prntscr.com/image/mI-DVcsQTxSTmE8hz6LvXA.png)

Giải nén

![anh18](https://image.prntscr.com/image/kqdBASpxSg2VojPIxpLtDQ.png)

![anh19](https://image.prntscr.com/image/5kN3cKAHRC2fUexEk8aw3A.png)

6. 
- chuyển dữ liệu trong thư mục wordpress sang thư mục public_html

add to clipboard : thêm vào khay nhớ tạm

![anh20](https://image.prntscr.com/image/2EBnh4VuTdO68Llh3EtV7Q.png)

- sang thư mục public_html chọn move clipboard files here để chuyển các file sang thư mục này

![anh21](https://image.prntscr.com/image/-oDx8dhcTyeV_ziOUOxqvw.png)

## kết nối source code với mysql

Chọn File wp-config.php để cấu hình.

Lưu ý : Bạn cần đổi tên wp-config-sample.php thành wp-config.php trước.

![anh22](https://image.prntscr.com/image/pKdLzfDBQ-SGzq5Ic6JCSQ.png)

![anh23](https://image.prntscr.com/image/x019QzgpSVK1RteLvQJKGg.png)

## Trỏ domain về hosting
Nếu bạn đã có domain : thì trỏ record A domain về IP và kiểm tra
Nếu bạn chưa mua domain mà bạn cần test trước thì bạn làm như sau:


C:\Windows\System32\drivers\etc\hosts

![anh24](https://image.prntscr.com/image/JfACG2c8S0maKRKCUOlb1w.png)

Kiểm tra lại xem domain domain đã trỏ về hosting chưa.

start -> run -> cmd

Ping pichianho.vn

![anh25](https://image.prntscr.com/image/tWGMljYFTROzIGRD63JWxQ.png)

Nếu domain của bạn đã trỏ về hosting thì bạn đã trỏ domain local thành công.

Vào trình duyệt và nhập domain pichianho.vn

![anh26](https://image.prntscr.com/image/RefZ83qtQ06Vv8Q0S2LOLQ.png)

# 5. Tạo email cho các khg theo tên miền.

Chọn tên miền muốn sử dụng, ở đây tôi chọn tên miền huydm.xyz

![anh29](https://image.prntscr.com/image/oC84Nim3SSKnvnKkaiajWA.png)

![anh27](https://image.prntscr.com/image/TMntsAJATwSeUNmBnkxqyw.png)

Sau khi tạo thành công:

![anh28](https://image.prntscr.com/image/azZ8XDVOT7_6QHYFhhbupw.png)

Đăng nhập Webmail:

trình duyệt gõ : http://103.159.50.188/roundcube/

![anh30](https://image.prntscr.com/image/neqJssjBT9mFIlajTXc8dQ.png)

Giao diện của webmaill

![ANH31](https://image.prntscr.com/image/cHgVC0zKT76r4fXgywNF_A.png)

6. Gửi mail khi tạo gói cho khg hoặc thay đổi các thông tin của client

7. Backup / restore code, db trên chính máy DA

- Backup:

  - user: chọn Create Restore/Backups bỏ tick phần E-mail và FTP sau đó chọn create backups:

![anh32](https://image.prntscr.com/image/5ugC4tJ5QiaA0W1oY3Q1Jg.png)

Sau khi hoàn thành backup thì ta có thể xem lại: trong phần File Manager > backups

![anh33](https://image.prntscr.com/image/1RMT4jT_TZ6qsFxw_JBK6Q.png)

# admin:
- Đối với tài khoản admin có thể đặt lịch backup hay chọn backup theo user hoặc tất cả user
- có thể sử dụng tính năng backup lưu trữ sang server khác

![anh34](https://image.prntscr.com/image/yXAJDjykTqalFTSOIasGIQ.png)


8. Cấu hình SSL Let's encrypt

Đăng nhập DA bằng tài khoản user kéo xuống phần advanced features chọn SSL Certificates

![anh35](https://image.prntscr.com/image/j5dUJbqXTZymfcesXSSIkQ.png)

- Tích chọn ô 1 và 2 như ảnh dưới đây. Mục 3 điền email của quý khách vào . Key Size (bits), Certificate Type chọn như hình dưới đây. Sau đó kéo chuột xuống dưới và click “save” Chú ý: SSL is currently enabled for this domain.

![anh36](https://image.prntscr.com/image/bwhcZa2lT3e6zg5acQuzWA.png)

- Sau khi cài đặt hệ thống sẽ sinh ra keyl, tiếp tục điều hường ssl sang https và chứng thực chứng chỉ với tổ chức phát hành

![anh37](https://image.prntscr.com/image/856jIyYJSmucwfrTmYK8cw.png)

chú ý tên domain phải là tên miền đăng ký thật và được trỏ về hosting

# 9. Sử dụng custombuid để thay đổi phiên bản các ứng dụng (hay dùng PHP, MySQL, build Multil version PHP)

- Đăng nhập hệ thống với tài khoản Admin và phần CustomBuild 2.0

![anh38](https://image.prntscr.com/image/ZRCTa-BPRDSguQheMxdbXg.png)

- tới phần ` Edit Opition` chọn các phiên bản muốn cài đặt và lưu lại

![anh39](https://image.prntscr.com/image/5iLziIiQQn6Vo9wGdbOLTg.png)

# 10. Xác định file log của DA
- Sau khi bạn đăng nhập vô tài khoản DirectA dmin bằng quyền user, xong rồi các bạn vô trong mục site summary / statistics / logs như hình bên dưới

![anh40](https://image.prntscr.com/image/dIo18sq5QnSpiQ5Zaq1TbA.png)

Bạn có thể xem log ở nhiều dạng khác nhau: xem toàn bộ log, xem 100 dòng đầu tiên hoặc 10 dòng đầu tiên

![anh41](https://image.prntscr.com/image/snI9HzzLRkGGtA-dj02ldQ.png)


41.10.21.60 - - [28/Sep/2016:17:40:33 +0700] "GET /wp-login.php HTTP/1.1" 200 3702 "-" "Mozilla/5.0 (Windows NT 5.1; rv:29.0) Gecko/20100101 Firefox/29.0"
41.10.21.60 ip khách truy cập
 [28/Sep/2016:17:40:33 +0700] thời gian truy cập
 GET : phương thức GET
 /wp-login.php tập tin truy cập
 "-": thông tin referer
 HTTP/1.1 chuẩn http, lâu lâu vẫn còn dạng cổ xưa là HTTP/1.0 thường dùng trong tool ddos
 Mozilla/5.0 (Windows NT 5.1; rv:29.0) Gecko/20100101 Firefox/29.0: user agent của trình duyệt

- ip: những ip nào thường xuyên truy cập, đối với ddos thì điều này rất quan trọng.
- thời gian: thời gian cho chúng ta biết đối tượng phá hoại hành động vào lúc nào, từ đó mình sẽ dễ theo dõi và xác định đối tượng dùng tool hay dùng tay.
- đường dẫn: đây là một thông tin khá quan trọng, nhất là đối với lỗ hổng website, giúp bạn biết được đối tượng đánh vào vị trí nào, file nào.
- thông tin trình duyệt cũng là một yếu tố cũng rất có lợi cho bạn, bạn có thể ngăn chặn ddos, thường thì đối tượng nếu dùng tool đời cũ sẽ có lỗ hổng về chỗ này, các trình duyệt nó thống nhất với nhau, bạn có thể dễ dàng chặn được.

# 11. Hướng dẫn đặt lịch backup trên Directadmin

Để đặt lịch Backup cho DA bạn đăng nhập hệ thống bàng tài khoản Admin.

Bước 1: Vào phần Admin Backup/Transfer

![anh42](https://image.prntscr.com/image/f2qBmeEHQW_0rCzsUPVr5A.png)

Bước 2: Thực hiện backup và lập lịch

![anh43](https://image.prntscr.com/image/Wg5QrBDLTOSkLOtUW50RWg.png)

Thông tin các thông số của cron

- Minute : 0-59 : có nghĩa là từ 0 phút đến 59 phút

- Hour : 0-23 : từ 0 giờ đến 23 giờ

- Day of Month : 1-31 : ngày nào trong tháng

- Month :1-12 : Tháng nào trong năm

- Day of week : 0-7 : ngày nào trong tuần. (0 là ngày chủ nhật)

- Nếu tùy chọn như hình trên thì Quý Khách đang cấu hình backup tự động tất cả các user hàng ngày vào lúc 5 giờ sáng, tất cả các dữ liệu của user sẽ backup vào thư mục /home/admin/admin_backups.

- Nếu muốn 1 tuần backup 1 lần vào lúc 5h sáng ngày thứ 7 thì Quý Khách chỉnh lại mục Day of week như trên hình thành số 6 => Submit

Bước 3: Kiểm tra việc cron có hoạt động hay không : Nếu xuất hiện như hình là đúng

![anh44](https://image.prntscr.com/image/yEYMLt7rRA6sa3bw0ticlA.png)

# 12. Hướng dẫn kiểm tra log truy cập với Direct Admin

B1- Truy cập vào giao diện Direct Admin và chọn vào Log Viewer.

![anh45](https://image.prntscr.com/image/pkrHb7FjS56HYBY8tnQgPg.png)

B2- Khi vào Log Viewer, chúng ta có thể chọn xem các log đã được Direct Admin liệt kê ở cửa sổ tùy thuộc vào từng dịch vụ. Giả sử chúng ta muốn xem log truy cập của Web Server, ta chọn /var/log/httpd/access_log. Sau khi chọn xong click vào Show Log

![anh46](https://image.prntscr.com/image/k3DV52y2Q-y3G6OqUz2Utw.png)

B3- Kết quả hiển thị của /var/log/httpd/access_log như sau:

![anh47](https://image.prntscr.com/image/5miRPujfQh2M0q9_G15YpA.png)

- Dịch vụ mail server: Exim
- Dịch vụ FTP: PureFTP
- Kernel Log: chứa các log liên quan đến nhân của hệ điều hành
- Direct Admin Log: chứa các log liên quan đến Direct Admin như: login, security, ....

## kiểm tra thông số VPS, server qua DirectAdmin

Login vào DA chọn chức năng System Infomation 

![anh48](https://image.prntscr.com/image/2Fs8Uy_JQOKPDfwE7ANM9Q.png)

Dựa vào 3 tiêu chí cơ bản:

- Số lượng CPU, thông số và cấu hình của CPU
- Lượng RAM được cấp chovps hoặc server
- Các thông số cơ bản của hệ thống như phiên bản sử dụng PHP, MySQL, Exim, DirectAdmin,...

# 13. Add thêm IP cho các domain chạy các IP khác nhau

Phần này bao gồm việc hiểu các danh mục IP, thêm, chỉ định và xóa địa chỉ IP. Từ menu Administrator menu, nhấp vào liên kết "IP ManagerP". Bạn sẽ thấy một trang trông giống như sau:

![anh49](https://image.prntscr.com/image/1lKnxtjcR9_ao4kUQWaioQ.png)

![anh50](https://image.prntscr.com/image/nTUGo7WVSYKGib56vGCQDg.png#)

## 14. Cấu hình chuyển các mode httpd

Sử dụng tính năng custombuild 2.0 để chuyển đổi các chế đội httpd

![anh51](https://image.prntscr.com/image/KzG066k6SUG7yQckZGTaCQ.png)

![anh52](https://image.prntscr.com/image/l9ahJna9S8K7qFKzoqXzbw.png)

MPM (Multi processing module) là một cơ chế hoạt động của Web Server Apache, cơ chế này sẽ quyết định cách thức tiếp nhận và xử lý các kết nối request từ người dùng. Apache hỗ trợ 3 cơ chế MPM tới thời điểm hiện tại tuỳ theo nhu cầu sử dụng. 

Lưu ý :
- Có 3 cơ chế MPM mà Apache hỗ trợ : event, prefork và worker.
- MPM không phải là module, nó được compile với source code khi cài đặt.
- Apache chỉ có thể chạy 1 MPM vào 1 thời điểm.

# 15. Cài đặt và sử dụng CSF