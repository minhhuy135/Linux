# Hướng dẫn cấp quyền sudo user và xóa vô hiệu hóa root

## I. CentOS 7

### 1. Cấp quyền sudo user

#### Bước 1: Tạo mới user bằng lệnh adduser
```
# adduser huydm
```
#### Bước 2: Thiết lập passwork cho huydm bằng lệnh passwd
```
# passwd abcd1234   
```
#### Bước 3: Thêm tài khoản huydm vào nhóm wheel bằng lệnh usermod
```
usermod -aG wheel huydm
```
#### Bước 4 : Kiểm tra user đã sử dụng được sudo chưa
```
su - huydm
sudo ls -la
```
# 2. Chặn truy cập SSH tren Root
- Để vô hiệu hóa đăng nhập root, mở tập tin cấu hình ssh /etc/ssh/sshd_config
```
# vi  /etc/ssh/sshd_config
```
- Tìm kiếm cho các dòng sau đây trong tập tin.
```
#PermitRootLogin no
```
![anh1](https://image.prntscr.com/image/V8r2lnbXR1egNDG2zIRXKw.png)

Loại bỏ các '#' từ đầu dòng.
```
PermitRootLogin no
```
![anh2](https://image.prntscr.com/image/XpsPJXODQRu_Ssuyq2ZWuw.png)