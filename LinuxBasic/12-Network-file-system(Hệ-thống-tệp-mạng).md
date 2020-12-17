# Network File System (NFS)
(Hệ thống tệp mạng)

NFS ( Network File System ) về cơ bản được phát triển để chia sẻ các tệp và thư mục giữa các hệ thống Linux Unix bởi Sun microsystems vào năm 1980. Nó cho phép bạn gắn kết các hệ thống tệp cục bộ của mình qua mạng và các máy chủ từ xa để tương tác với chúng khi chúng được gắn cục bộ trên cùng một hệ thống.

# Lợi ích của NFS
NFS cho phép truy cập cục bộ vào các tệp từ xa.
- Nó sử dụng kiến trúc client/server tiêu chuẩn để chia sẻ tệp giữa các máy
- Với NFS , không cần thiết cả hai máy đều chạy trên cùng một hệ điều hành.
Với sự trợ giúp của NFS, có thể định cấu hình các giải pháp lưu trữ tập trung.
- Người dùng có được dữ liệu của họ bất kể vị trí thực tế.
- Không cần làm mới thủ công cho các tập tin mới.
- Phiên bản mới hơn của NFS cũng hỗ trợ acl, mount root ảo.
- Có thể được bảo mật với Tường lửa và Kerberos.

## 1. Client server là gì?

- Client server là mô hình mạng máy tính bao gồm 2 thành phần chính là máy khách (client) và máy chủ (server). Trong mô hình này, server là nơi lưu trữ tài nguyên, cài đặt các chương trình dịch vụ và thực hiện các yêu cầu của client. Client đón vai trò gửi yêu cầu đến server. Client gồm máy tính và thiết bị điện tử nói chung.

![anh1](https://image.prntscr.com/image/wEDzECJ6TaW5H2DzPewILQ.png)

- Mô hình Client server cho phép mạng tập trung các ứng dụng và chức năng tại một hoặc nhiều máu dịch vụ file chuyên dụng. Các máy này trở thành trung tâm của hệ thống. Hệ điều hành của Client server cho phép người dùng chia sẻ đồng thời cùng một tài nguyên, không quan trọng vị trí địa lý. 

## 2.1 Ưu điểm của Client server là gì?
- Client server có khả năng chống quá tải mạng
- Client server đảm bảo toàn vẹn dữ liệu khi có sự cố xảy ra
- Dễ dàng mở rộng hệ thống mạng
- Chỉ cần chung định dạng giao tiếp mà không cần chung nền tảng là có thể hoạt động được
- Client server cho phép tích hợp các kỹ thuật hiện đại như GIS, mô hình thiết kế hướng đối tượng,…
- Với mô hình Client server, người dùng có thể truy cập dữ liệu từ xa, thực hiện các thao tác gửi, nhận file hay tìm kiếm thông tin đơn giản


Ví dụ

- Web server: Người dùng nhập địa chỉ website => client gửi yêu cầu đến web server => web server gửi toàn bộ nội dung của website về cho client
- Mail server: Người dùng soạn mail => client gửi đến mail server => mail server tiếp nhận, lưu trữ, tìm kiếm địa chỉ email được gửi đến & gửi mail đi
- File server: File server nhận tập tin từ phía client, lưu trữ và truyền tập tin đi. Người dùng có thể upload, download các tập tin lên server qua giao thức FTP hay web browser

- 3.1 Client
Client hay chính là máy khách, máy trạm – là nơi gửi yêu cầu đến server. Nó tổ chức giao tiếp với người dùng, server và môi trường bên ngoài tại trạm làm việc. Client tiếp nhận yêu cầu của người dùng sau đó thành lập các query string để gửi cho server. Khi nhận được kết quả từ server, client sẽ tổ chức và trình diễn những kết quả đó.  

- 3.2 Server
Server xử lý yêu cầu gửi đến từ client. Sau khi xử lý xong, server sẽ gửi trả lại kết quả, client có thể tiếp tục xử lý các kết quả này để phục vụ người dùng. Server giao tiếp với môi trường bên ngoài và client tại server, tiếp nhận yêu cầu dưới dạng query string (xâu ký tự). Khi phân tích xong các xâu ký tự, server sẽ xử lý dữ liệu và gửi kết quả về cho client. 
    
## Dịch vụ NFS
 Đây là một System V-launched. NFS bao gồm portmap và nfs-utils package:

- portmap: Nó ánh xạ các cuộc gọi được thực hiện từ các máy khác đến dịch vụ RPC chính xác (không bắt buộc với NFSv4 ).
- nfs: Nó dịch các yêu cầu chia sẻ tệp từ xa thành các yêu cầu trên hệ thống tệp cục bộ.
- rpc.mountd: Dịch vụ này có trách nhiệm lắp và unmount toàn bộ các hệ thống tập tin.

## Các tệp quan trọng cho cấu hình NFS
- /etc/export: Đây là tệp cấu hình chính của NFS, tất cả các tệp và thư mục đã xuất được xác định trong tệp này ở cuối Máy chủ NFS.
- /etc/fstab: Để gắn một thư mục NFS trên hệ thống của bạn trên các lần khởi động lại , chúng ta cần tạo một mục trong /etc/fstab.
- /etc/sysconfig/nfs: Tệp cấu hình của NFS để kiểm soát cổng rpc và các dịch vụ khác đang nghe.
# Triển khai NFS
## Mô hình
   2 máy Centos-7:
   - Clien
   - Server

Cài đặt và cấu hình NFS để chia sẻ giữa Client với Server.
```

$ sudo yum install -y nfs-utils
```

![anh1](https://image.prntscr.com/image/k1QtdQzSR8q-U3XmgQnyAA.png)

### IP của 2 máy
IP của 2 máy
Cấu hình IP 2 máy Client và Server:

Cấu hình IP 2 máy Client và Server:
|Hostname|Network|Interface|IP Address|NetMask|Gateway|DNS|
|-|-|-|-|-|-|-|
|Client|VMnet8|ens33|192.168.64.138|24|0.0.0.0|8.8.8.8|
|Server|VMnet8|ens33|192.168.64.143|24|0.0.0.0|8.8.8.8|

### Thiết lập NFS_Server
Ta tạo 1 thư mục chứa tài nguyên chia sẻ:

$ sudo mkdir /var/shared/

![anh2](https://image.prntscr.com/image/qX0GYX3HTQGsJ7b-mp_LBA.png)

Cấu hình thư mục chia sẻ : /etc/exports, mở /etc/exports và thêm vào dòng sau:

/var/shared 192.168.64.138/24(no_root_squash,no_all_squash,rw,sync)

![anh4](https://image.prntscr.com/image/2Ggov-JDRhKshl2H2HgSYQ.png)

![anh3](https://image.prntscr.com/image/aO3vcyKAR4uld4xcSfFPvQ.png)

Trong đó:

- /var/shared: là đường dẫn thư mục được chia sẻ
- 192.168.64.138/24: là dải ip hoặc ip của client
- rw: là quyền truy cập thư mục chia sẻ
- sync: đồng bộ hóa thư mục share
- root_squash: vô hiệu hóa đặc quyền root
- no_root_squash: cho phép đặc quyền root
- no_all_squash: cho phép người dùng có quyền truy cập

Start nfs và rpcbind:
# Khởi động NFS Server
```

$ sudo systemctl start rpcbind
$ sudo systemctl start nfs-server
$ sudo systemctl enable rpcbind
$ sudo systemctl enable nfs-server
$ sudo systemctl status rpcbind
$ sudo systemctl status nfs-server
```

![anh7](https://image.prntscr.com/image/A9-tZywMT2ygoE_u9WtDzw.png)

- Các quy trình RPC thông báo cho rpcbind khi chúng bắt đầu, đăng ký các cổng mà chúng đang nghe và số chương trình RPC mà chúng dự kiến ​​sẽ phục vụ. Hệ thống máy khách sau đó liên lạc với rpcbind trên máy chủ với số chương trình RPC cụ thể. Dịch vụ rpcbind chuyển hướng máy khách đến số cổng thích hợp để nó có thể giao tiếp với dịch vụ được yêu cầu

Để kiểm tra điều này, tôi đã thiết lập máy chủ và máy khách NFS và theo dõi lưu lượng giữa chúng. Từ những gì tôi thấy, khách hàng đã biết rằng dịch vụ NFS trên máy chủ đang lắng nghe trên cổng 2049.

## Kiểm tra port sử dụng bởi NFS
```
rpcinfo -p
```
![anhaa](https://image.prntscr.com/image/pqobYbC-RVSrBQc_umrHdg.png)

Vì vậy, khi nào RCpbind đi vào chơi? Khi tôi làm rpcinfo trên máy chủ, tôi nhận được như sau:

![anh5](https://image.prntscr.com/image/DDsE34rGRVqygSEKntKjOA.png)

Bây giờ chúng ta đang đi vào lãnh thổ kỳ lạ. "0.0.0.0.8.1" nằm trong cột "địa chỉ" của đầu ra rpcinfo. Vì đó là "địa chỉ chung" của quy trình máy chủ NFS, tôi đặt cược tiền tố "0.0.0.0" là địa chỉ IP (INADDR_ANY trong trường hợp này) mà máy chủ đã sử dụng trong bind() gọi hệ thống khi nhận được số cổng. Tôi không chắc hậu tố "8.1" là gì, nhưng nhìn vào đầu ra rpcinfo, nó phải có một cái gì đó để làm với máy chủ NFS về cơ bản là một luồng nhân.





# Định cấu hình tường lửa để cho phép NFS
- Cho phép cổng TCP và UDP 2049 cho NFS.
- Cho phép cổng TCP và UDP 111 ( rpcbind/ sunrpc).
- Cho phép cổng TCP và UDP được chỉ định với MOUNTD_PORT="port"
- Cho phép cổng TCP và UDP được chỉ định với STATD_PORT="port"
- Cho phép cổng TCP được chỉ định với LOCKD_TCPPORT="port"
- Cho phép cổng UDP được chỉ định với LOCKD_UDPPORT="port"

 hãy khởi động lại dịch vụ NFS bằng cách sử dụng service nfs restart. Chạy rpcinfo -p lệnh để xác nhận các thay đổi.

# Mở port cho phép truy cập 
## Cấu hình Firewall để cho phép truy cập
```
$ sudo firewall-cmd --permanent --add-service=rpc-bind
success
$ sudo firewall-cmd --permanent --add-service=mountd
success
$ sudo firewall-cmd --permanent --add-port=2049/tcp
success
$ sudo firewall-cmd --permanent --add-port=2049/udp
success
$ sudo firewall-cmd --reload
success
```

![anh8](https://image.prntscr.com/image/rzKXaeRPRh6FsFAiidOdfw.png)

## Kiểm tra mount point trên server
```
showmount -e localhost
```
![anhaaa](https://image.prntscr.com/image/MPlvOWihTkOXa1rrUT3a0Q.png)
# Thiết lập NFS_Client
Ta tạo 1 thư mục NFS và mount thư mục shared từ phía Server
```
[client@localhost ~]$ mkdir /NFS/
[client@localhost ~]$ mount 192.168.64.143:/var/shared /NFS/

```
![anh10](https://image.prntscr.com/image/PehHjsD8S6CcYTcq5QPIYQ.png)

Tạo 1 tập tin Test.txt trong thư mục NFS:

[client@localhost NFS]$ touch Test.txt

![anh11](https://image.prntscr.com/image/h3Ut9d9aT4OPZxTSWwJrlA.png)

Với nội dung:
```
Chao
Nguoi
Dep
Trai
```
Kiểm tra phía Server:
```
[server@localhost ~]$ cd /var/shared
[server@localhost shared]$ ll
total 4
-rw-r--r--. 1 root root 16 Dec 12 16:20 Test.txt
[server@localhost shared]$ cat Test.txt

Chao
Nguoi
Dep
Trai
```
![anh12](https://image.prntscr.com/image/1pShBHbkSXOi3Y-qcSFjhQ.png)

Cấu hình Client tự động mount thư mục được chia sẻ
Các bước trên đã hoàn thành việc share giữa Server và Client, tuy nhiên sau khi hệ thống tắt thư mục shared được mount ở phía Client sẽ bị mất, để tự động mount mỗi khi khởi động ta cần thêm vào file cấu hình /etc/fstab như sau:
```
192.168.64.143:/var/shared/ /NFS/ nfs defaults 0 0
```