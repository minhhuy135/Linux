# Mạng cơ bản

Network interface (Giao diện mạng) là kênh kết nối giữa thiết bị vầ mạng. Bạn có thể có nhiều interface hoạt động cùng lúc, các interface có thể được kích hoạt (activated) hoặc bỏ kích hoạt (de-activated).

Về mặt vật lý, giao diện mạng có thể tiến hành thông qua thẻ giao diện mạng (NIC) hoặc có thể được triển khai trừu tượng hơn dưới dạng phần mềm

File cấu hình network ở những nơi khác nhau tùy vào mỗi nền tảng:

- Debian: /etc/network/interfaces
- CentOS: /etc/sysconfig/Network-scripts/
- SUSE: /etc/sysconfig/network

# Lệnh ip :
## Lệnh trả lại thông tin trên từng thiết bị Ethernet được kết nối.
#ip addr show

![anh1](https://image.prntscr.com/image/un4UkM90Si_bNc6nO6fKUA.png)

Để xem thông tin về ens33:
[root@localhost ~]# ip addr show ens33

![anh2](https://image.prntscr.com/image/tauQb8luTwGWFUigh4b12A.png)

# Hiện thị bảng định tuyến
#ip route show

![anh3](https://image.prntscr.com/image/zw-AJJ2vSVCnDj6PV10ycg.png)

# Gán IP cho một giao diện mạng:
#ip addr add (dia chi ip) dev ens33

![anh4](https://image.prntscr.com/image/tw_JtHmfRPe3FKnsKy6T3w.png)

# Gỡ bỏ IP từ giao diện mạng
#ip addr del 192.168.64.138/32 dev ens33

![anh5](https://image.prntscr.com/image/SZVv62AvTMKyD4E9rliPaQ.png)

# Hiển thị thông tin về một giao diện mạng

![anh6](https://image.prntscr.com/image/f3CipLJYSyudvtqHg4qf0A.png)

Hiện thị bảng định tuyến
#ip route

![anh7](https://image.prntscr.com/image/fYCWJrfDSV_VFrdZUo01SA.png)

# Thêm một định tuyến mới
#ip route add 192.168.64.0/24 via 192.168.64.1

![anh8](https://image.prntscr.com/image/SN5muYsrRmyxR6TU2Qg9uA.png)

# Xóa một định tuyến
Hoặc chỉ định định tuyến cần xóa.
ip route del <dia_chi_ip> via <gateway>

![anh9](https://image.prntscr.com/image/RPIFsOvOS7i1J3blLGycQA.png)

# Lệnh Route
Hiện tại bộ công cụ iproute2 đã được thay thế mặc định cho bộ công cụ net-tools ở các bản phân phối Linux mới như RHEL7, CentOS 7 ...vv, dẫn tới bạn sẽ hay gặp lỗi -bash: ifconfig: command not found trên CentOS 7. Cài đặt net-tools trên Centos 7:

#yum install net-tools

Lệnh route được sử dụng để xem hoặc thay đổi bảng định tuyến IP. Bạn có thể muốn thay đổi bảng định tuyến IP để thêm, xóa hoặc sửa đổi các tuyến tĩnh thành các máy chủ hoặc mạng cụ thể

![anh10](https://image.prntscr.com/image/V7-QwYKASpm1tnoUgNHOag.png)

# Hiện thị bảng định tuyến
#route -n

![anh11](https://image.prntscr.com/image/zOda0bSlRoKBEKK7SM5o6w.png)

# Thêm 1 định tuyến
#route add -net 192.168.1.0 netmask 255.255.255.0 dev ens33

![anh12](https://image.prntscr.com/image/a9IlBaxFTre4YQbSAr0Uyg.png)

# Xóa 1 định tuyến
#route del -net 192.168.1.0 netmask 255.255.255.0 dev ens33

![anh13](https://image.prntscr.com/image/ASVo3ahPTvGfgVtph0Q-8g.png)