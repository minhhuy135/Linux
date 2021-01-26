# Bản ghi DNS là gì?

Bản ghi DNS (hay còn gọi là tệp vùng) là các hướng dẫn nằm trong máy chủ DNS có thẩm quyền và cung cấp thông tin về miền bao gồm địa chỉ IP nào được liên kết với miền đó và cách xử lý các yêu cầu cho miền đó. Các bản ghi này bao gồm một loạt các tệp văn bản được viết bằng cú pháp DNS. Cú pháp DNS chỉ là một chuỗi ký tự được sử dụng làm lệnh cho máy chủ DNS phải làm gì. Tất cả các bản ghi DNS cũng có ' TTL ', viết tắt của thời gian tồn tại và cho biết tần suất máy chủ DNS sẽ làm mới bản ghi đó.

Bạn có thể nghĩ về một tập hợp các bản ghi DNS giống như danh sách doanh nghiệp trên Yelp. Danh sách đó sẽ cung cấp cho bạn một loạt thông tin hữu ích về một doanh nghiệp như vị trí, giờ làm việc, các dịch vụ được cung cấp, v.v. Tất cả các miền được yêu cầu có ít nhất một vài bản ghi DNS cần thiết để người dùng có thể truy cập trang web của họ bằng cách sử dụng tên miền và có một số bản ghi tùy chọn phục vụ các mục đích bổ sung.

## Các loại bản ghi DNS phổ biến

# 1. Bản ghi SOA - Lưu trữ thông tin quản trị về một miền

### Bản ghi DNS SOA là gì?

DNS - Domain Name System ( hệ thống phân giải tên miền)
là 1 hệ thống cho phép thiết lập tương ứng giữa địa chỉ IP và tên miền trên Internet.

Nhiệm vụ cơ bản của DNS là ` dịch ` một tên miền (vd :zaraoder.xyz) thành địa chỉ (vd: 45.77.251.173) mà các máy tính sử dụng để nhận dạng chính xác nhau trên hệ thống mạng toàn cầu

## Vậy DNS: SOA để làm gì ?
Bản ghi SOA (SOA Record) là chữ viết tắt của `Start of Authority` là thông tin xác nhận từ phía máy chủ tiếp nhận của tên miền

![anh1](https://image.prntscr.com/image/utHEPbcJTJG42vohpzAcsQ.png)

Thông thường mỗi tên miền sẽ sử dụng một cặp DNS nào đó đẻ trỏ về 1 hoặc nhiều máy chủ DNS. Sau đó , các máy chủ DNS có trách nhiệm cung cấp thông tin bản ghi DNS của hệ thống cho tên miền này để nó hoạt động . trong quá trình này , SOA được coi như dấu hiệu nhận biết của hệ thống về tên miền nà

# Cấu trúc SOA :

CÚ PHÁP :

[tên miền] IN SOA [tên-server-dns] [địa-chỉ-email](serial number;refresh number;retry number;experi number;time-to-live-number)

Ví dụ một cấu trúc SOA

ns1.somedomnain.co.uk abuse.somedomnain.co.uk 2006030501 28800 3600 604800 3600

![anh2](https://image.prntscr.com/image/88G31yftRJWBRAfnFOLTUg.png)

Trong đó :
 
 -ns1.somedomnain.co.uk : giá trị dns chính của tên miền hoặc máy chủ

 -abuse.somedomnain.co.uk chuyển đổi từ dạng  abuse@somedomnain.co.uk thể hiện chủ thể sở hữu tên miền này

- 2006030501 : Thời gian cập nhật DNS cho ten miền mới nhất

- 28800 : số giây trước khi bản ghi DNS được tự động cập nhật lại

- 3600 : số giây trước khi bản DNS bị lỗi không thể tự động cập nhật lại và cần lấy lại thông tin DNS lần tiếp theo

- 604800 : giới hạn thời gian tính bằng giây sau khi bản ghi DNS được gỡ bỏ trên server và không còn hiệu lực trên server

- 3600 : TTL xác định thời gian cache của bản ghi

# Lưu ý khi nhập cú pháp SOA

![anh3](https://image.prntscr.com/image/mUBIW6ZjQSCrTAIi5J6XAw.png)

- serial : hiển thị phiên bản (version) hay là số lần mà zone(khu) được thay đổi , cứ mỗi lần dữ liệu trong zone(khu) hay đổi thì con số này lại tăng lên . Nó được dùng để so sánh và nhật dữ liệu giữa các máy chủ secondary(thứ 2) DNS và máy chủ master . nếu serial của master server lớn hơn , máy secondary sẽ tiến hành cập nhật . serial áp dụng cho mọi dữ liệu trong zone và là một số nguyên . định dạng theo kiểu YYYYMMDDNN , trong đó YYYY là năm , MM là tháng DD là ngày , NN là số lần sửa đổi dữ liệu zone trong ngày .

- Refresh : chỉ ra khoảng thời gian máy chủ máy chủ Secondary(thứ 2) kiểm tra dữ liệu zone(khu) trên máy Primary(sơ cấp) để cập nhật nếu cần

- Retry : nếu máy chủ Secondary(thứ2) không kết nối được máy chủ Primary thong thời gian mô tả trong refresh (ví dụ máy chủ Primary bị shutdonw vào lúc nào đó thì máy chủ secondary phải tìm cách kết nối lại với máy chủ Primary theo mọt chu kỳ thời gian mô tả trong Retry . Thông thường giá trị này nhỏ hơn gái trị refresh )

- Expire : nếu sau khoảng thời gian này mà máy chủ Secondary không kết nối được với máy chủ Primary thì dữ liệu zone trên máy Secondary sẽ bị quá hạn

- TTL (time to live ): giá trị này áo dụng cho mọi record(ghi lại) trong zone(khu) và được đính kèm trong thông tin trả lời một truy vấn , múc đích của nó là chỉ ra thời gian mà các máy chủ name server khác cache lại thông tin trả lời .việc cache(bộ nhớ đệm) thông tin trả lời giúp giảm lưu lượng truy vấn DNS trên mạng

## 2. Name Server

Record tiếp theo cần có trong zone là NS (name server) record. Mỗi name server cho zone sẽ có một NS record. Chứa địa chỉ IP của DNS Server cùng với các thông tin về domain đó.

Ví dụ:

```
cloud365.vn. IN NS ns1.zonedns.vn.
cloud365.vn. IN NS ns2.zonedns.vn.
```

## 3. Record A

Là một record căn bản và quan trọng, dùng để ánh xạ từ một domain thành địa chỉ IP cho phép có thể truy cập website. Đây là chức năng cốt lõi của hệ thống DNS. Record A có dạng như sau:

`cloud365.vn   A    103.101.161.201`

Tên miền subdomain (tên miền con):

`sub.cloud365.vn   A   103.101.161.201`

## 4. Record AAAA

Có nhiệm vụ tương tự như bản ghi A, nhưng thay vì địa chỉ IPv4 sẽ là địa chỉ IPv6.

## 5. Record PTR

Hệ thống tên miền thông thường cho phép chuyển đổi từ tên miền sang địa chỉ IP. Trong thực tế, một số dịch vụ Internet đòi hỏi hệ thống máy chủ DNS phải có chức năng chuyển đổi từ địa chỉ IP sang tên miền. Tên miền ngược thường được sử dụng trong một số trường hợp xác thực email gửi đi.

Ví dụ:

- Đối với IPv4:

`90.163.101.103.in-addr.arpa       IN PTR     masterdns.tuanda.com.`

- Đối với IPv6:

`0.0.0.0.0.0.0.0.0.0.0.0.d.c.b.a.4.3.2.1.3.2.1.0.8.c.d.0.1.0.0.2.ip6.arpa  IN PTR masterdns.tuanda.com.`

## 6. Record SRV

Bản ghi SRV được sử dụng để xác định vị trí các dịch vụ đặc biệt trong 1 domain, ví dụ tên máy chủ và số cổng của các máy chủ cho các dịch vụ được chỉ định.

Ví dụ: 

`_ldap._tcp.example.com. 3600  IN  SRV  10  0  389  ldap01.example.com.`

Một Client trong trường hợp này có thể nhờ DNS nhận ra rằng, trong tên miền example.com có LDAP Server ldap01, mà có thể liên lạc qua cổng TCP Port 389 .

Trong đó:

- **Service**: có giá trị _ldap.

- **Protocol**: có giá trị  _tcp.

- **example.com.**: Tên miền (domain name).

- **TTL**: Thời gian RR được giữ trong cache, giá trị trong ví dụ là 3600.

- **Class**: standard DNS class, luôn là IN.

- **Priority**: ưu tiên của host, số càng nhỏ càng ưu tiên.

- **Weight**: khi cùng bậc ưu tiên, thì trọng lượng 3 so với trọng lượng 2 sẽ được lựa chọn 60% (hỗ trợ load balancing).

- **Port**: của dịch vụ (tcp hay udp).

- **Target**: chỉ định FQDN cho host hỗ trợ dịch vụ.

## 7. Record CNAME (Canonical Name)

Cho phép tên miền có nhiều bí danh khác nhau, khi truy cập các bí danh sẽ cũng về một địa chỉ tên miền. Để sử dụng bản ghi CNAME cần khai báo bản ghi A trước. Ví dụ bản ghi CNAME phổ biến nhất:

```
www   CNAME   example.com

mail CNAME example.com

example.com   A   103.101.161.201
```

Khi một yêu cầu đến địa chỉ www.example.com thì DNS sẽ tìm đến example thông qua bản ghi CNAME, một truy vấn DNS mới sẽ tiếp tục tìm đến địa chỉ IP: 103.101.161.201 thông qua bản ghi A.

## 8. Record MX

Bản ghi MX có tác dụng xác định, chuyển thư đến domain hoặc subdomain đích. Bản ghi MX có dạng:

```
example.com    MX    10    mail.example.com.
mail.example.com    A    103.101.161.201
```

Độ ưu tiền càng cao thì số càng thấp.

```
example.com MX 10 mail_1.example.com
example.com MX 20 mail_2.example.com
example.com MX 30 mail_3.example.com
```

Bản ghi MX không nhất thiết phải trỏ đến hosting – VPS- Server của người dùng. Nếu người dùng đang sử dụng dịch vụ mail của bên thứ ba như Gmail thì cần sử dụng bản nghi MX do họ cung cấp.

## 9. Record TXT

Bản ghi TXT(text) được sử dụng để cung cấp khả năng liên kết văn bản tùy ý với máy chủ. Chủ yếu dùng trong mục đích xác thực máy chủ với tên miền.

## 10. Record DKIM

Là bản ghi dùng để xác thực người gửi bằng cách mã hóa một phần email gửi bằng một chuỗi ký tự, xem như là chữ ký.

Khi email được gửi đi máy chủ mail sẽ kiểm so sánh với thông tin bản ghi đã được cấu hình trong DNS để xác nhận. Bản ghi DKIM có dạng:

`mail._domainkey.cloud365.vn     TXT  k=rsa;p=MIIBIjANBgkqhkiG9w0BA`

## 11. Record SPF

Record SPF được tạo ra nhầm đảm bảo các máy chủ mail sẽ chấp nhận mail từ tên miền của khách hàng chỉ được gửi đi từ server của khách hàng. Sẽ giúp chống spam và giả mạo email. Bản ghi SPF thể hiện dưới dạng:

`cloud365.vn   SPF     "v=spf1 ip4:103.101.162.0/24 -all" 3600`

Tùy vào hệ thống DNS mà có thể hiển thị bản ghi SPF hoặc TXT Với bản ghi SPF, máy chủ tiếp nhận mail sẽ kiểm tra IP của máy chủ gửi và IP của máy chủ đã đăng kí bản ghi SPF example.com. Nếu Khách hàng có nhiều máy chủ mail nên liệt kê tất cả trong bản ghi SPF giúp đảm bảo thư đến được chính xác và đầy đủ.

## Tài liệu tham khảo

https://blog.cloud365.vn/linux/dns-record/