# Tìm hiểu về câu lệnh dig trong linux

## 1. Dig là gì ?

DIG là iết tắt của Domain Information Groper là một công cụ dòng lệnh quản trị mạng được dùng để truy vấn DNS name servers. Với lệnh dig, bạn có thể truy vấn thông tin về các bản ghi DNS, bao gồm: host addresses, mail exchanges, và name servers. Đây là công cụ được các quản trị viên hệ thống sử dụng phổ biến nhất để khắc phục sự cố DNS vì tính linh hoạt và dễ sử dụng của nó.

2. Cài đặt dig trên Linux

- Cài đặt trên Ubuntu:
apt-get install dnsutils

- Cài đặt trên CentOS7:
yum install bind-utils

- Kiểm tra version của dig:
dig -v
DiG 9.11.4-P2-RedHat-9.11.4-16.P2.el7_8.6

## 3. Cú phát sử dụng câu lệnh dig

```
dig [server] [name] [type]
```

Trong đó:

- [server] – địa chỉ IP hoặc hostname của name server sẽ dùng để thực hiện truy vấn.

   - Nếu bạn cung cấp cho đối số server thông tin về hostname thì nó sẽ giải quyết hostname trước khi tiếp tục truy vấn name server.

   - Đây là tùy chọn nên bạn cũng có thể không khai báo ở đây, trong trường hợp không khai báo thì dig sẽ lấy thông tin này trong file /etc/resolv.conf.

- [name] – tên của bản ghi resource sẽ được truy vấn.

- [type] – loại truy vấn được yêu cầu bởi dig. Nó có thể là 1 trong số các bản ghi: A, MX, SOA,…Nếu không có bản ghi nào được chỉ định thì dig sẽ mặc định đó là bản ghi A.

## 4. Cách sử dụng câu lệnh dig

Ví dụ: Truy vấn tên miền dominhhuy.com

![anh1](https://image.prntscr.com/image/nk_4ga2IS4mc0emIt_mB2g.png)

Kết quả nhận được bao gồm các phần sau:

- Dòng đầu tiên của đầu ra hiển thị version đã cài đặt và truy vấn được gọi. Dòng thứ hai hiển thị các tùy chọn(theo mặc định của câu lệnh).

```
; <<>> DiG 9.11.4-P2-RedHat-9.11.4-16.P2.el7_8.6 <<>> google.com
;; global options: +cmd
```

- Phần tiếp thep, dòng đầu tiên của phần này là tiêu đề, bao gồm opcode và trạng thái của hành động. Trong trường hợp này, trạng thái NOERROR có nghĩa là yêu cầu truy vấn truy vấn DNS không gặp lỗi.

```
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 59757
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1
```

- Phần này được hiển thị theo mặc định chỉ trên các phiên bản mới hơn.
```
;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
```
- Đây là phần mà lệnh dig hiển thị truy vấn của chúng ta. Theo mặc định, dig sẽ yêu cầu bản ghi A.

```
;; QUESTION SECTION:
;dominhhuy.com.                    IN      A
```

- Đây là phần cuối cùng của đầu ra bao gồm số liệu thống kê về truy vấn.

Query time: Cho biết thời gian của kết nối tốn bao lâu.

SERVER: 10.10.34.115: Cho biết name resolver đang dùng.

WHEN: Thời gian thực hiện truy vấn DNS.

MSG SIZE rcvd: Kích thước gói tin trả lời truy vấn DNS.

```
;; Query time: 2 msec
;; SERVER: 10.10.34.155#53(10.10.34.155)
;; WHEN: Web Jan 27 04:29:03 EST 2021
;; MSG SIZE  rcvd: 95
```

# 4.2. Truy vấn địa chỉ IP

Để truy vấn ngắn gọn kết quả, ta sử dụng thêm tùy chọn +short trong câu lệnh. Kết quả chỉ bao gồm các địa chỉ IP của bản ghi A:

![anh2](https://image.prntscr.com/image/94r8SeHqST6DBhKEkRlqvQ.png)

Để có kết quả chi tiết hơn bằng cách sử dụng các tùy chọn +noall và tùy chọn +answer:

![anh3](https://image.prntscr.com/image/N-ETq_tgTk2UyNO7qBwyKA.png)

# 4.3. Truy vấn bản ghi MX cho tên miền

Để truy vấn các bản ghi MX, ta chỉ việc thêm tùy chọn MX vào câu lệnh. Sử dụng thêm tùy chọn +noall và +answer để làm ngắn gọn kết quả in ra:

![anh4](https://image.prntscr.com/image/6IGersQeQQSLUT1VKvLAww.png)

# 4.4. Truy vấn bản ghi SOA cho tên miền

Tùy chọn truy vấn cũng giống như truy vấn bản ghi `MX`, ta thêm tùy chọn `SOA` vào câu lệnh:

![anh5](https://image.prntscr.com/image/-EQAxgKJTOWSV3inuXYdug.png)

# 4.6. Tra cứu DNS ngược

Để truy vấn tên máy chủ được liên kết với một địa chỉ IP cụ thể, hãy sử dụng tùy chọn -x.

![anh6](https://image.prntscr.com/image/eSszM7JCR_2Dq54J1NREcQ.png)

# 4.8. Truy vấn DNS bằng TCP
Theo mặc định thì lệnh dig truy vấn DNS qua udp, để có thể dùng lệnh dig truy vấn DNS qua tcp chúng ta thực hiện như sau:

```
dig +tcp [domain]

```

# Tài liệu tham khảo

https://news.cloud365.vn/tim-hieu-ve-lenh-dig/
