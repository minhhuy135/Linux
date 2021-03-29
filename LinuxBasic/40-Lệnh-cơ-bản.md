# Một số lệnh cơ bản trên CentOS cho người mới sử dụng Linux

1. Kiểm tra phiên bản hệ điều hành Linux đang chạy
```
cat  /etc/centos-release
```
![anh1](https://image.prntscr.com/image/uaTa_VZaSK2X2aFXz5C1Kg.png)

2. Kiểm tra các ổ hiện tại trên hệ thống
```
fdisk -l
```
![anh2](https://image.prntscr.com/image/UAd3ajthS1_nizeL_uwplA.png)

3. Kiểm tra các phân vùng và mức độ sử dụng trên các phân vùng
```
df -h
```
![anh3](https://image.prntscr.com/image/XPQDh1V2So2Dow4QNBrImQ.png)

4. Kiểm tra số lượng CPU của VPS:
```
 nproc
 ```
Kiểm tra dung lượng RAM
```
free -m
```
![anh4](https://image.prntscr.com/image/BBZCeyUsRwaTwTezuW7MEQ.png)

6. Kiểm tra
```
top -c
```
![anh5](https://image.prntscr.com/image/x-vEyvO-TLyPf55dyo3F-A.png)

7. Các lệnh xử lý file
- [root@localhost ~]# cd /dir  - Di chuyển tới 1 thư mục dir

- [root@localhost ~]# pwd - Hiển thi đường dẫn thư mục hiện hành

- [root@localhost ~]# mkdir inet - Tạo 1 thư mục có tê inet

- [root@localhost ~]# rm tesst.txt - Xóa 1 file test.txt

- [root@localhost ~]# rm -rf  dir/ - Xóa toàn bộ thư mục dir và các file bên trong

- [root@localhost ~]# mv dir1 dir2 - Đổi tên thư mục dir1 thành dir2

- [root@localhost ~]# cp file1 file2 - Copy file 1 thành file 2

- [root@localhost ~]# cat huytx.txt - Xem nội dung 1 file có tên huytx.txt

- [root@localhost ~]# tail -f /var/log/message - Hiện nội dung của file message và cập nhật liên tục, khởi đầu với 10 dòng cuối.

8. Lệnh quản lý tiến trình

 - [root@localhost ~]# ps -ef| grep ..... Kiểm tra một tiến trình mong muốn đang hoạt động

 - [root@localhost ~]# top -c - Hiển thị các tiến trình đang chạy.

 - [root@localhost ~]# kill pid - Dừng ép 1 tiến trình đang chạy


9. Quyền sử dụng tập tin

- [root@localhost ~]# chmod 755 huytx.txt - Phân quyền sử dụng tập tin huytx.txt

(Chú ý:Mỗi chữ số ứng với từng tài khoản có được bằng cách cộng các số sau: 4 – đọc (r); 2 – ghi (w); 1 – thực thi (x))

 [root@localhost ~]# chown huytx:huytx test.txt - Phân quyền sở hữu file test.txt cho user huytx

 [root@localhost ~]# chown -R huytx:huytx inet/ - Phân quyền sở hữu toàn bộ thư mục và các file; các thư mục inet

10. Nén và giải nén

- [root@server ~]# zip -r folder.zip folder-  Nén một thư mục folder

- [root@server ~]# unzip file.zip - Giải nén 1 file.zip.

- [root@server ~]# tar -zcf folder.tar.gz folder - Nén một thư mục dạng .gz.

- [root@server ~]# tar -zxvf file.tar.gz - Giải nén.

11. Cài đặt và gỡ bỏ phần mềm

- [root@localhost ~]# rpm -ivh đường_dẫn_package => Cài đặt 1 phần mềm (Cài Offline) ví dụ:

- [root@localhost ~]# rpm -ivh /media/CentOS/gcc-4.1.2-51.el5.i386.rpm

Kiểm tra 1 phần mềm đã được cài đặt hay chưa:

- [root@localhost ~]# rpm -qa| grep 

Gỡ bỏ 1 phần mêm đã cài đặt, VD gỡ bỏ phần mềm htop

[root@localhost ~]# rpm -e htop

Cài đặt một phần mềm với máy chủ có kết nối mạng với yum, VD cài đặt phần mềm MC

[root@localhost ~]# yum install -y mc  (-y nghĩa là đồng ý cài đặt không cần hỏi)

Update cho 1 gói phần mềm với yum, VD update phần mềm rdesktop

[root@localhost ~]# yum update rdesktop -y

Gỡ bỏ một phần mềm với yum:

[root@localhost ~]# yum remove rdesktop -y

Tải một phần mềm về server, VD tải phần mềm xvnkb có link như bên dưới.

[root@localhost ~]# wget 

http://ncu.dl.sourceforge.net/xvnkb/0.2.11/xvnkb-0.2.11.tar.gz

VD: Check xem phần mềm htop đã được cài đặt hay chưa

[root@localhost ~]# rpm -qa| grep htop
htop-2.0.1-1.el7.x86_64

II. Các câu lệnh Linux
https://ss64.com/bash/