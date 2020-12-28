# Cách đặt IP trên Centos-7

## Cách 1: Config Static IP sử dụng Network Manager


Khi sử dụng lệnh nmcli
(NetworkManager Command Line Interface) thì bản chất là cách dùng dòng lệnh để tạo ra file config cho các interface giống như các phiên bản CentOS trước kia. Điều này khá tiện lợi cho bạn khi thao tác thông qua CLI hoặc đưa và các bash shell sau này nếu có nhu cầu.

# Hiển thị mạng sẵn có

```
# nmcli device
```
![anh1](https://image.prntscr.com/image/GByvcpW6RhG6sgxhisv5Xw.png)

Lệnh này sẽ hiện thị ra toàn bộ các thiết bị mạng có sẵn trên hệ thống và trạng thái của chúng.

Tại cột STATE sẽ có 2 kiểu :

- managed: có nghĩa là thiết bị đó đặt dưới quyền kiểm soát của NetworkManager và thiết bị này có thể "connected" (Đã được config và active) hay disconnect (chưa được config những sẵn sàng để active trở lại)
- unmanaged: thiết bị mạng này chưa được dưới quyền kiểm soát của NetworkManager.

## Kiểm tra file config của card mạng ens33
```
# cat /etc/sysconfig/network-scripts/ifcfg-ens33
```
![anh2](https://image.prntscr.com/image/nB2wxONLQd_KewuSK7UK1A.png)

Đặt IP cho Interface ens33
Ta thấy ens33 đang nhận IP động, ta sẽ tiến hành đặt IP tĩnh. Ta sẽ đặt theo số liệu sau:

- IP address: 192.168.64.11
- Gateway: 192.168.64.1
- Subnetmask: 255.255.255.0/24
- DNS-nameserver: 8.8.8.8

1. Đặt IP:
```
nmcli connection modify ens33 ipv4.addresses 192.168.64.11/24

```
-> "con" = "connection"(chế độ kết nối)

   "mod" = "modify" (chế độ sửa đổi)

2. Đặt Gateway:
```
nmcli connection modify ens33 ipv4.gateway 192.168.64.1
```
3. Đặt DNS:
```
nmcli con mod ens33 ipv4.dns 8.8.8.8

```
4. Chọn phương thức method: ở đây ta sẽ để manual có thể hiểu là cấu hình bằng tay:
```
nmcli con mod ens33 ipv4.method manual
```
5. Chọn kiểu kết nối tự động:
```
nmcli con mod ens33 connection.autoconnect yes
```
## Kiểm tra lại xem IP đã đặt chính xác chưa

![anh3](https://image.prntscr.com/image/XvSB-G3sQUm36KDjZv6MlQ.png)

Chú thích:
– Dưới đây là các option bạn nên lưu ý khi cấu hình, còn lại để mặc định cũng được.

- DEVICE : tên card mạng đã được liệt kê ở phần 1, nên điền chính xác tên card mạng thì hệ thống mới nhận biết được card nào để cấu hình card mạng cho nó.
- NAME : nội dung y như phần DEVICE.
- NBOOT : phải để option ‘yes‘ thì khi reboot hệ thống, network mới tự động được bật lên với cấu hình card mạng tương ứng.
- BOOTPROTO : cấu hình IP tĩnh hay DHCP. Nếu là DHCP thì để giá trị ‘dhcp’.
- IPV6INIT : tắt chức năng hỗ trợ sử dụng IPv6 trên card mạng ens18.
- IPADDR : địa chỉ IP tĩnh.
- PREFIX : subnet mask của lớp mạng IP sử dụng.
- GATEWAY : địa chỉ IP cổng gateway.
- DNS1 : thông tin DNS server.

Ta sẽ cấu hình IP cho Interface ens37
Ta thấy phần CONNECTION của ens37 nhìn khá dài. Nên ta đổi lại thành ens37 cho đồng bộ với ens33:
```
nmcli con modify "Wired connection 1" connection.id ens37
```
Ta được kết quả như hình:

![anh4](https://image.prntscr.com/image/thUBNsKUTzaXY7QQPUeDXg.png)

Bây giờ ta sẽ đặt IP cho ens37 như sau:

IP address: 192.168.64.12/24
Subnet Mask: 255.255.255.0/24

Do ens3 đã có gateway để kết nối ra Internet nên ens7 không cần nữa.
```
nmcli con modify ens37 ipv4.addresses 192.168.64.12/24
nmcli con modify ens37 ipv4.method manual
nmcli con modify ens37 connection.autoconnect yes
```
Sau đó thực hiện lệnh ifdown và ifup để ens37 nhận IP vừa thiết lập. Có thể dùng cùng lúc 2 lệnh như sau:
```
[root@localhost ~]# ifdown ens37 && ifup ens37
```
![anh5](https://image.prntscr.com/image/oBZ4xLyFQzuPO04gDJFoEw.png)

Kiểm tra file /etc/sysconfig/network-scripts/ifcfg-ens37 để xem lại thiết lập bằng lệnh cat:

![anh6](https://image.prntscr.com/image/6Jbyae2dSTiLSaWnUAv7DQ.png)

# Cách 2: Config IP sử dụng cách sửa file cấu hình

Mỗi Network Interface(NI) đều có 1 file scrip cấu hình nằm bên trong folder /etc/sysconfig/network-scripts.

Và file cấu hình của các NI đều có dạng ifcfg-<ten_interface>

Ta sẽ thay đổi IP của ens37

![anh7](https://image.prntscr.com/image/6Jbyae2dSTiLSaWnUAv7DQ.png)

Một số dòng cấu hình cần quan tâm:

1. BOOTPROTO 
    - "none": khi chúng ta muốn sử dụng Static IP. 
    - "dhcp": khi chúng ta muốn đặt IP động nhận từ DHCP server
2. IPADDR - Địa chỉ IP
3. PREFIX(khi đã set Static IP) - Xác định Network Prefix (ví dụ: /24)
4. GATEWAY(khi đã set Static IP) - Xác định Default Gateway cho mạng
5. DNS(khi đã set Static IP) - Ta có thể sử dụng tùy chọn này để xác định nhiều DNS Server (Bắt đầu từ 1)
Mở file cấu hình bằng trình soạn thảo Vi để có thể đổi thông số của NI ens37:

[root@localhost ~]# vi /etc/sysconfig/network-scripts/ifcfg-ens37

Sau khi chỉnh sửa xong cấu hình ta chỉ cần ifdown và ifup NI của ens37 lên là được.

# Cách đặt IP trên ubutu 18.04


Cấp địa chỉ IP bằng cách cấu hình netplan

Kiểm tra các thiết bị đang có trong mạng:

![anh1](https://image.prntscr.com/image/yArg17NuTNmOIPxhlEoAOA.png)

Như vậy NIC ens38 đã tồn tại tuy nhiên nó chưa được cấp địa chỉ IP. Tiếp theo tôi sẽ cấu hình cho nó bằng cách vào thư mục `/etc/netplan/` và chỉnh sửa `file 50-cloud-init`.yaml. (Lưu ý khi bạn viết vào tệp *.yaml bạn phải tuân theo đúng cú pháp căn dòng của nó). Ở đây tôi muốn cấp IP động nên sẽ ghi vào nội dung file như sau:

`#sudo vi /etc/netplan/50-cloud-init`

```
# This file is generated from information provided by
# the datasource.  Changes to it will not persist across an instance.
# To disable cloud-init's network configuration capabilities, write a file
# /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg with the following:
# network: {config: disabled}
network:
    ethernets:
        ens33:
            dhcp4: true
        ens38:
            dhcp4: true
    version: 2
```

Trong trường hợp bạn muốn cấp IP tĩnh thì bạn có thể thiết lập các thông số như ví dụ dưới:
```
# This file is generated from information provided by
# the datasource.  Changes to it will not persist across an instance.
# To disable cloud-init's network configuration capabilities, write a file
# /etc/cloud/cloud.cfg.d/99-disable-network-config.cfg with the following:
# network: {config: disabled}
network:
    ethernets:                (đây là version của dhcp)
        ens33:            (tên giao diện mạng)
            dhcp4: true      (là ip version 4)
        ens38:
            addresses: [192.168.200.10/24] (địa chỉ ip và subnet mask)
            gateway4: 192.168.200.2  (default geteway)
            nameservers:   (tên máy chủ)
              addresses: [8.8.8.8,8.8.4.4]   (DNS)
            dhcp4: no
```
Lưu ý: Bạn nên đặt địa chỉ IP tĩnh nằm ngoài range IP DHCP của local subnet.

Tiếp theo bạn lưu thay đổi file và chạy lệnh netplan apply để thiết lập lại cấu hình.
```
netplan apply
```
Ta dùng lệnh ip a để kiểm tra kết quả:

![anh2](https://image.prntscr.com/image/18NuEheFSaSuhbX-0UC1wA.png)

# Cách đặt IP trên(ubutu 16.04)
Giả sử card mạng của máy cần cấu hình là eth0, chúng ta sẽ cấu hình từng trường hợp như sau:

Để thay đổi cấu hình địa chỉ IP, ta cần truy cập vào “/etc/network/interfaces” với câu lệnh sau:

```
sudo /etc/network/interfaces
```
1. Cấu hình địa chỉ IP động:

Sau khi truy cập vào interfaces bạn chỉnh sửa ở mục eth0 thành:
```
auto eth0
iface eth0 inet dhcp
```
![anh7](https://image.prntscr.com/image/ghaZtufbRrSjkQEwoRMHLA.png)

2. Cấu hình địa chỉ IP tĩnh:
```
auto eth0
iface eth0 inet static
address 192.168.0.100
netmask 255.255.255.0
gateway 192.168.0.1
```
![anh8](https://image.prntscr.com/image/zWe2AzrqQJe9fxdP1NaJTQ.png)

cấu hình dns

![anh9](https://image.prntscr.com/image/aD4sZHuWQEem3jiKh0HOpw.png)










# Cách đặt IP trên window
Bước 1: Tìm địa chỉ Default Gateway để nắm bắt dải IP của mình.

![anh3](https://image.prntscr.com/image/QM9qr3C6RievJ5Ek3nxKuA.png)

Bước 2: Cũng tại  hộp thoại Run, gõ ncpa.cpl và Network Connection.

![anh4](https://image.prntscr.com/image/2BGeK4LXSQiMhf7WpAVw_A.png)

Nhấn chuột phải và chọn Properties.

Tại đây bạn chọn Internet Protocol Vesion 4(TCP/IPv4) và chọn tiếp Properties.

![anh5](https://image.prntscr.com/image/LbCnFulUTu2pqiV0kQ5z9A.png)

Tiến hành nhập thông tin như hướng dẫn bên dưới. Số “15” trong dải wifi cung cấp là số bất kỳ và không được trùng lặp, nếu người khác nắm được thông tin này bạn sẽ không truy cập được mạng.

Cuối cùng chọn OK để hoàn tất.

![anh6](https://image.prntscr.com/image/wuaRFtAGRWCUwm60hSSHog.png)