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

### 2.2. Một số ví dụ

- Chạy script 30 phút 1 lần:

`30 * * * * command`

- Chạy script vào 3 giờ sáng mỗi ngày

`0 3 * * * command`

- Tạo một tác vụ hoạt động vào một giờ cụ thể. Ví dụ: Backup dữ liệu vào ngày 07 tháng 10 lúc 08:11 AM

`11 08 10 07 * /backups/backup-code/code-backup.sh`

Trong đó: - 11 – phút 11

          - 08 – lúc 8 giờ

          - 10 – ngày mùng 10

          - 07 – tháng 07

- Tạo 1 tác vụ thực hiện 2 lần trong một ngày. Ví dụ: Backup dữ liệu 2 lần trong một ngày lúc 7:00 và 21:00 hàng ngày.

`00 07,21  * * * /backups/backup-code/code-backup.sh`

Trong đó: - 00 – phút 00

          - 07,21: 07 giờ sáng và 21 giờ tối

          - Hàng ngày

          - Hàng tháng

          - Tất cả các ngày trong tuần

### 2.2. Một số giá trị thời gian cho Crontab

| Keyword | Equivalent          |
|---------|---------------------|
| @yearly | 0 0 1 1 *           |
| @daily  | 0 0 * * *           |
| @hourly | 0 * * * *           |
| @reboot | chạy lúc khởi động. |

Ví dụ:

- Tạo một tác vụ chạy vào phút đầu tiên của năm:

`@yearly /backups/backup-code/code-backup.sh`

- Tạo một tác vụ chạy vào phút đầu tiên của tháng

`@monthly /backups/backup-code/code-backup.sh`

- Tạo một tác vụ chạy khi khởi động lại

`@reboot CMD`

## Tài liệu tham khảo

https://viblo.asia/p/tim-hieu-crontab-tren-linux-WApGx3DbM06y