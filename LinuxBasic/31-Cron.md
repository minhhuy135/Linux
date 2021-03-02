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

