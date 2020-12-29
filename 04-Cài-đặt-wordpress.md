WordPress là một hệ thống quản lí nội dung miễn phí và mã nguồn mở phổ biến Bài viết này sẽ hướng dẫn bạn cách cài đặt WordPress trên máy CentOS.

1. Tổng quan
WordPress là một hệ thống quản lí nội dung miễn phí và mã nguồn mở xây dựng dựa trên PHP và MySQL. Được phát hành vào năm 2003, đến nay WordPress đã trở thành một trong những hệ thống quản lí website phổ biến nhất thế giới 

![anh1](https://image.prntscr.com/image/Kklyw8BGQ7OU7nrMkW1efA.png)

2. Các bước cài đặt

## Bước 1: Chuẩn bị.

Trước khi tiến hành cài đặt WordPress, bạn phải cài đặt bộ LAMP trên máy của bạn.

## Bước 2: Tạo cơ sở dữ liệu và tài khoản cho WordPress

Ở bước chuẩn bị, mình đã cài mariadb cho cơ sở dũ liệu. Bạn cũng có thể thao tác tương tự với MySQL. Đầu tiên, ta cần đăng nhập vào tài khoản root của cơ sở dữ liệu bằng câu lệnh

```
mysql -u root -p
```