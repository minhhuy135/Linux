 
 # Tìm hiểu về SSL Certificates
1. SSL là gì?
SSL là viết tắt của từ Secure Sockets Layer, là tiêu chuẩn của công nghệ bảo mật, truyền thông mã hoá giữa máy chủ Web server và trình duyệt (browser). Tiêu chuẩn này hoạt động và đảm bảo rằng các dữ liệu truyền tải giữa máy chủ và trình duyệt của người dùng đều riêng tư và toàn vẹn. SSL hiện tại cũng là tiêu chuẩn bảo mật cho hàng triệu website trên toàn thế giới, nó bảo vệ dữ liệu truyền đi trên môi trường internet được an toàn.

2. Tại sao nên sử dụng SSL?
Bảo mật dữ liệu: dữ liệu được mã hóa và chỉ người nhận đích thực mới có thể giải mã.

Toàn vẹn dữ liệu: dữ liệu không bị thay đổi bởi tin tặc.

Chống chối bỏ: đối tượng thực hiện gửi dữ liệu không thể phủ nhận dữ liệu của mình.

3. Lợi ích khi sử dụng SSL
Xác thực website, giao dịch.

Bảo mật các giao dịch giữa khách hàng và doanh nghiệp, các dịch vụ truy nhập hệ thống.

Bảo mật webmail và các ứng dụng như Outlook Web Access, Exchange, và Office Communication Server.

Bảo mật các ứng dụng ảo hó như Citrix Delivery Platform hoặc các ứng dụng điện toán đám mây.

Bảo mật dịch vụ FTP.

Bảo mật truy cập control panel.

Bảo mật các dịch vụ truyền dữ liệu trong mạng nội bộ, file sharing, extranet.

Bảo mật VPN Access Servers, Citrix Access Gateway …

4. CA
Certificate Authority (CA): là tổ chức phát hành các chứng thực các loại chứng thư số cho người dùng, doanh nghiệp, máy chủ (server), mã nguồn, phần mềm.

Nhà cung cấp chứng thực số đóng vai trò là bên thứ ba (được cả hai bên tin tưởng) để hỗ trợ cho quá trình trao đổi thông tin an toàn.

5. Phân loại chứng chỉ SSL
DV-SSL
Chứng chỉ xác thực tên miền (Domain Validated SSL): DV-SSL dành cho các khách hàng cá nhân với khả năng mã hóa cơ bản với giá rẻ. DV-SSL chỉ yêu cầu xác minh quyền sở hữu tên miền. Thời gian đăng ký và xác minh rất nhanh.

OV-SSL
Chứng chỉ xác thực tổ chức (Organization Validation SSL): OV SSL dành cho các tổ chức và doanh nghiệp có độ tin cậy cao. Ngoài việc xác minh quyền sở hữu tên miền còn phải xác minh doanh nghiệp đăng ký đang tồn tại và hoạt động bình thường. Tên doanh nghiệp cũng sẽ được hiển thị chi tiết trên chứng chỉ OV được cấp.

EV-SSL
Chứng chỉ xác thực mở rộng (Exented Validation SSL): EV SSL có độ tin cậy cao nhất chỉ dành cho các tổ chức và doanh nghiệp đang hoạt động. Tuân thủ nghiêm ngặt các quy định của tổ chức CA-Browser Forum trong quá trình xác minh doanh nghiệp. Khi người dùng Internet truy cập vào các website được trang bị chứng chỉ số EV, thanh địa chỉ của trình duyệt sẽ chuyển sang màu xanh lá cây, đồng thời hiển thị tên doanh nghiệp sở hữu website đó. Điều này gia tăng độ tin cậy của website đó đối với người dùng.

Wildcard SSL
Wildcard SSL dành cho các website có nhu cầu sử dụng SSL cho nhiều subdomain khác nhau. Wildcard SSL khác với các loại SSL bình thường là có thể chạy cho không giới hạn tên miền phụ với một chứng chỉ ssl duy nhất.
 # 1 Xác nhận Tên miền (DV)

 Phương pháp truyền thống



  -  Phương pháp truyền thống qua DCV-Email. Bạn sẽ nhận được một email xác nhận cho một tên miền của bạn. Các email sẽ chứa một mã xác nhận duy nhất và một liên kết. Nhấp vào liên kết và nhập mã để xác nhận việc sở hữu tên miền.

Địa chỉ email hợp lệ là: Bất kỳ địa chỉ email mà hệ thống của chúng tôi có thể tạo ra từ việc truy cập thông tin whois của tên miền; Các địa chỉ quản trị chung sau @tenmien đang được áp dụng là: admin@, administrator@, postmaster@, hostmaster@, webmaster@

Phương pháp thay thế DCV (chỉ Comodo)



- HTTP-based DCV. Các CSR bạn gửi đến Comodo sẽ được phân tích. Các giá trị hash được cung cấp cho bạn và bạn phải tạo một tập tin văn bản đơn giản đơn giản và đặt trong thư mục gốc của website với giao thức HHTP!

- DNS CNAME-based. Các CSR bạn gửi đến Comodo sẽ được phân tích. Các giá trị hash được cung cấp cho bạn và phải được nhập như một bản ghi DNS CNAME cho tên miền của bạn.


# Cài đặt SSL Trên cpanel

## 1. Truy cập Vào hosting


![anh0](https://image.prntscr.com/image/S-_WIsmQQvuJYu50nayJ3Q.png)

## 2. Truy cập Manage SSL sites

![anh1](https://image.prntscr.com/image/ilXKHecpTKaPcdXRG8FR3w.png)

## 3. Hoàn thành cài đặt 
![anh2](https://image.prntscr.com/image/xG6DCdzNQr_zivkL1PIH6g.png)


# Cài đặt SLL trên Diarecadmin

## 1.  Đăng nhập vào VPS chọn Show All Users để tìm website muốn cài đặt 

![anh3](https://image.prntscr.com/image/9-gj2KqFRfmG01m8x9UCrQ.png)

## 2. Chọn SSL Certificates

![anh4](https://image.prntscr.com/image/tAuOVW2rSJyOdskPP_3mkQ.png)

## 3. ADD các file 

![anh5](https://image.prntscr.com/image/H1h7AiCATZihRin4MWtGDA.png)

![anh6](https://image.prntscr.com/image/m3TlSwu9QF_KhdVGgvBX9g.png)


![anh7](https://image.prntscr.com/image/vBBK9GJrQVWGleSk2u7w6w.png)

# Cài đặt SSL Pleck

## 1. Truy cập vào hosting

- Đăng nhập vào tên miền muốn cài SSL , chọn SSL/TLS Certificate

![anh8](https://image.prntscr.com/image/oCu7mQQ0RJSIC33kERX_Jg.png)


## 2. Chọn phần Advanced Settings

![anh9](https://image.prntscr.com/image/eEkAuSDSTKuzkCVJtswJSw.png)


![anh10](https://image.prntscr.com/image/UlfSImuCRI_SaM3Tjr8ZNw.png)


![anh11](https://image.prntscr.com/image/YTOvtNhRS__-VC5lJo-ryw.png)

## 3.  Đến bước cuối chọn tên Chúng chỉ SSL vừa đặt tên , ấn vào phần Hosting Settings


![anh12](https://image.prntscr.com/image/7wagDReKQLSXjhc6tAdypw.png)


![anh13](https://image.prntscr.com/image/mTpnKqq8T72bKkiSjBwohA.png)


# Cài đặt SSL web4S

## 1. SSH vào VPS của web 4S

gõ lệnh để xem mọi người trước cài ở phần nào rồi

```

history 

```

## 2. Sau đó vào file config để thêm các đường dẫn 

```
vi /var/www/domain/zone/serverssl.conf

```

ấn Shift G để đến dòng cuối cùng trong file


```
<VirtualHost *:443>
        SSLProtocol all -SSLv2 -SSLv3
        SSLEngine on
        SSLCertificateFile /var/www/domain/zone/ssl/megaradcenter.com/public.crt
        SSLCACertificateFile /var/www/domain/zone/ssl/megaradcenter.com/ca.crt
        SSLCertificateKeyFile /var/www/domain/zone/ssl/megaradcenter.com/private.key
    ServerAdmin report@nhanhoa.com
    DocumentRoot /var/www/domain/source/megaradcenter.com
    ServerName megaradcenter.com
    ServerAlias www.megaradcenter.com
    ErrorLog logs/megaradcenter.com-error_log
    CustomLog logs/megaradcenter.com_log common
</VirtualHost>

```


![anh14](https://image.prntscr.com/image/1NNI8YjYQd2rbJYRTf1QEw.png)


## 3. Truy cập đến đườn dẫn thư mục tên miền megaradcenter.com 

```
cd /var/www/domain/zone/ssl/megaradcenter.com/

```
![anh15](https://image.prntscr.com/image/rz9anRUlR62aSVsg0jLvRw.png)


Sau khi đã tạo và add thông tin vào 3 file , gõ lệnh httpd -t để kiểm tra thấy xanh thì ok

Tiếp đến gỗ lệnh để khởi động lại http

```
service httpd restart

```






