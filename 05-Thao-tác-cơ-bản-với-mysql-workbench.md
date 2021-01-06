1. Mô hình centos7 mariadb server 192.168.159.139

![anh1](https://image.prntscr.com/image/azA3dOo_SZeL7TGOSR2VAA.png)

Sử dụng 1 server cho mô hình và 1 máy đã cài đặt phần mềm MySQL Workbench(download tại đây):
– MariaDB Server sử dụng CentOS 7 OS
– Có kết nối Internet
– User database SSH vào MariaDB Server(bài viết này mình sử dụng user thường được cấp quyền)

2. Tạo connection
Ta kiểm tra đã bật cổng 3306 lên chưa
![anh2](https://image.prntscr.com/image/nu9CURAcTZS9_hq7BS9pKg.png)

Mở cổng (VD: 3306) trên zone đang active (Public Zone)
```
firewall-cmd --zone=public --add-port=3306/tcp --permanent
```
– Sau đó để luật mới có hiệu lực cần reload lại tường lửa bằng command sau:
```
firewall-cmd --reload
```

Kế tiếp, bạn cần mở dịch vụ http (mở port) trên Firewall đang được kích hoạt trên server (mặc định, tường lửa Firewalld được sử dụng trên CentOS 7) bằng những lệnh sau:
```
# systemctl restart firewalld
```
Bạn có thể kiểm tra lại kết quả mở port 3306 trên Firewalld bằng lệnh:

#firewall-cmd --list-all

![anh3](https://image.prntscr.com/image/O44jZvZsQQqfPbojcMX7Ug.png)

- SSH vào MariaDB Server, tạo 1 user và cấp quyền cho user đó

1, Đăng nhập vào databast
```
 mysql -u root -p
 ```
 `create user 'huydm'@'%' identified by '12345'; --> tạo user demo` user là huydm mk là 12345

`grant all on *.* to 'huydm'@'%'; --> cấp quyền cho user huydm trên tất cả database`

(*.* là tất cả các database và tất cả các bảng 
![anh4](https://image.prntscr.com/image/GJx9jnwiS1SQXeR2T3gOqQ.png)

- Chỉnh sửa bind-address trong file /etc/my.cnf.d/server.cnf cho phép người dùng trên MySQL Workbench kết nối vào Database trên tất cả các cổng (0.0.0.0 đại diện cho tất cả các ip và tất cả các máy kết nối vào database)
```
[mariadb] 
bind-address=0.0.0.0
```
- Dùng MySQL Workbench kết nối vào Database

Click vào biểu tượng dấu + như hình

Nhập vào các thông số của bạn

![anh5](https://image.prntscr.com/image/H8g48kAUQTeTru7rmSczRA.png)

Kiểm tra kết nối và hoàn thành kết nối

![anh6](https://image.prntscr.com/image/RBZg1WbBR06HoeAmT5cBhA.png)

Kết nối thành công, 1 kết nối nhanh được tạo trên giao diện home của MySQL Workbench

![anh7](https://image.prntscr.com/image/goaJVKpwSb6OxmCLsFrVZw.png)

Đây là giao diện sau khi bạn click vào kết nối ở home và cũng là nơi chúng ta trực tiếp sử dụng để quản trị database

![anh8](https://image.prntscr.com/image/IjU8pCAcSWK4PB0MdnookQ.png)