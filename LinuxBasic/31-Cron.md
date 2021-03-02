# Tìm hiểu về Crontab trên Linux
Crontab (CRON TABLE) là một tiện ích cho phép thực hiện các tác vụ một cách tự động theo định kỳ, ở chế độ nền của hệ thống. Crontab là một file chứa đựng bảng biểu (schedule,lịch trình) của các entries(mục) được chạy.

Bằng cách sử dụng các lệnh trong Linux Crontab ta có thể tạo những task chạy vào những giờ cụ thể đặt trước, như vào giờ nào trong ngày, vào giờ nào trong ngày vào thứ mấy trong tuần….

## Tùy chọn Crontab
- Để cài đặt hoặc cập nhật lệnh trong crontab, hãy sử dụng tùy chọn -e:
```
$ crontab -e
```
- Để liệt kê các mục nhập Crontab, hãy sử dụng tùy chọn -l:
```
$ crontab -l
```
- Để gỡ cài đặt công việc từ crontab, hãy sử dụng tùy chọn -r:
```
$ crontab -r
```
- Để xác nhận gỡ cài đặt công việc từ crontab, hãy sử dụng tùy chọn -i:
```
$ crontab -i -r
```
- Để thêm bảo mật SELINUX vào tệp crontab, hãy sử dụng tùy chọn -s:
```
$ crontab -s
```
## I. Cài đặt crontab
```
yum install cronie
```

Start crontab và tự động chạy mỗi khi reboot:
```
service crond start
chkconfig crond on
```
- Cấu trúc của crontab

Một crontab file có 5 trường xác định thời gian, cuối cùng là lệnh sẽ được chạy định kỳ, cấu trúc như sau:
![anh1](https://image.prntscr.com/image/Ve_r6dwdQ7GlJhEP90gfuQ.png)

Nếu một cột được gán ký tự *, nó có nghĩa là tác vụ sau đó sẽ được chạy ở mọi giá trị cho cột đó.
![anh2](https://image.prntscr.com/image/ePq0yX9UQ2_0JPu3oXBrbA.png)

## 3.1. Copy file và thư mục giữa các Server
Copy thư mục từ Local lên Remote Server:
```
rsync -avz rpmpkgs/ root@192.168.0.101:/home/
```
Lệnh trên copy thư mục rpmpkgs từ Local lên Remote Server có IP 192.168.0.101, lưu ở thư mục /home/.

- Copy thư mục từ Remote Server về Local
```
rsync -avzh root@192.168.0.100:/home/tarunika/rpmpkgs /tmp/myrpms
```
- Lệnh trên sẽ copy dữ liệu ở thư mục /home/tarunika/rpmpkgs trên Remote Server 192.168.0.100 về máy Local lưu ở thư mục /tmp/myrpms

## 3.2. Rsync qua SSH
Với Rsync, bạn có thể transfer qua giao thức SSH, qua đó dữ liệu được bảo mật an toàn hơn.

- Copy file từ Remote Server về Local Server qua SSH:

Để xác định giao thức sẽ sử dụng với rsync, bạn cần thêm tùy chọn -e cùng với tên giao thức, ở đây là ssh.
```
rsync -avzhe ssh root@192.168.0.100:/root/install.log /tmp/
```

Lệnh trên copy file /root/install.log trên Remote Server 192.168.0.100 về thư mục /tmp/ trên máy Local.

- Copy file từ Local lên Remote Server qua SSH:
```
rsync -avzhe ssh backup.tar root@192.168.0.100:/backups/
```
Lưu ý: Nếu sử dụng port SSH custom, không phải port tiêu chuẩn 22, bạn cần chỉ rõ port muốn dùng trong câu lệnh. Ví dụ port 22:
```
rsync -avzhe "ssh -p 22" root@192.168.0.100:/root/install.log /tmp/
```
## 4. Sử dụng Rsync kết hợp với SSH Key pair để Tự động hóa việc đồng bộ
### 4.1. Kiểm tra việc đồng bộ bằng tay
Tham khảo bào viết về SSH Key pair tại đây

Ở bài viết về SSH Key pair, có đoạn gõ Passphrase, ta sẽ bỏ qua việc đặt mật khẩu Passphrase để tự động hóa việc đồng bộ thư mục.

Trước tiên ta thử thực hiện việc đồng bộ bằng lệnh sau:
```
rsync -avzhe "ssh -p port" user@IP:/backup/ /backups/
```
Trong đó:

- rsync -avzhe: Câu lệnh rsync cùng với các tùy chọn.

- ssh -p port: Là việc sử dụng rsync qua SSH với tùy chọn port nếu máy chủ đích thay đổi port cho SSH.

- user@IP:/backup/: Thư mục của máy chủ đích mà ta muốn đồng bộ.

- /backups/: Thư mục của máy chủ hiện tại ta sẽ lưu các đồng bộ.

Do đã cấu hình SSH Keypair không có Passphrase nên rsync sẽ tự đồng đồng bộ các thư mục. Thông báo đồng bộ xong:
```
[root@localhost backups]# sh rsync.sh
receiving incremental file list
./
```
sent 30 bytes  received 467 bytes  10.25 bytes/sec
total size is 52.28M  speedup is 105,194.40
### 4.2. Cấu hình tự đồng hóa rsync
#### Bước 1: Tạo tệp Shell Scripts
```
vi /backups/rsync.sh
```
Ta thêm dòng lệnh rsync ở trên vào Scripts sau đó lưu lại. Vì đã có SSH Key pair nên chúng ta chỉ cần 1 dòng này trong scripts:
```
rsync -avzhe "ssh -p port" user@IP:/backup/ /backups/
```
#### Bước 2: Lưu lại và phần quyền thực thi cho tệp Shell Scripts vừa tạo
```
chmod +x /backups/rsync.sh
```
#### Bước 3: Đưa Script vào Crontab để tự động hóa
```
crontab -e
```
Thêm nội dung sau:
```
0 8 * * * /backups/rsync.sh
```
Tại đây có nghĩa là việc đồng bộ sẽ được diễn ra vào lúc 8 giờ sáng hàng ngày. Ta lưu lại là thành công.

Tài liệu tham khảo
https://hocvps.com/rsync/

https://viblo.asia/p/rsync-command-dong-bo-du-lieu-tren-linux-djeZ1R7YlWz