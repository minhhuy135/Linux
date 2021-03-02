# 1. Rsync là gì ?
Rsync (Remote Sync) là một công cụ dùng để sao chép và đồng bộ file/thư mục được dùng rất phổ biến. Với sự trợ giúp của rsync, bạn có thể đồng bộ dữ liệu trên local hoặc giữa các server với nhau một cách dễ dàng.

Tính năng của Rsync:

- Rsync hỗ trợ copy giữ nguyên thông số của files/folder như Symbolic links, Permissions, TimeStamp, Owner và Group.

- Rsync nhanh hơn scp vì Rsync sử dụng giao thức remote-update, chỉ transfer những dữ liệu thay đổi mà thôi.

- Rsync tiết kiệm băng thông do sử dụng phương pháp nén và giải nén khi transfer.

- Rsync không yêu cầu quyền super-user.

2. Cài đặt Rsync
Trên Red Hat/CentOS:
```
yum install rsync -y
```
Trên Debian/Ubuntu:
```
apt-get install rsysnc
```

## III. Sử dụng Rsync
Câu lệnh căn bản của rsync:
```
rsync options source destination
```
Trong đó:

- Source: dữ liệu nguồn
- Destination: dữ liệu đích
- Options: một số tùy chọn thêm
### Các tham số cần biết khi dùng Rsync

- -v: hiển thị trạng thái kết quả
- -r: copy dữ liệu recursively, nhưng không đảm bảo thông số của file và thư mục
- -a: cho phép copy dữ liệu recursively, đồng thời giữ nguyên được tất cả các thông số của thư mục và file
- -z: nén dữ liệu khi transfer, tiết kiệm băng thông tuy nhiên tốn thêm một chút thời gian
- -h: human-readable, output kết quả dễ đọc
- --delete: xóa dữ liệu ở destination nếu source không tồn tại dữ liệu đó.
- --exclude: loại trừ ra những dữ liệu không muốn truyền đi, nếu bạn cần loại ra nhiều file hoặc folder ở nhiều đường dẫn khác nhau thì mỗi cái bạn phải thêm --exclude tương ứng.

Rsync không tự động chạy nên thường được dùng kết hợp với crontab

Khi lần đầu chạy rsync, toàn bộ dữ liệu nguồn sẽ được copy đến server đích, từ lần chạy sau trở đi chỉ những dữ liệu chưa được copy mới được transfer – đây là quá trình đồng bộ dữ liệu. Do đó, bạn có thể hiểu rsync thực hiện việc copy hoặc đồng bộ đều đúng.
### 3.1. Copy file và thư mục giữa các Server