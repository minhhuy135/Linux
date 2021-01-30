# Lab SSH Keypair

1. Tạo khóa trên server

# Phía server

- Tạo 1 cặp ssh keys

```
ssh-keygen -t rsa
```
![anh1](https://image.prntscr.com/image/KERnb7KQRgixbqt0ZF6LGA.png)

- `Chọn nơi lưu key: (ở đây, ta sẽ để ở thư mục home của root /root/.ssh/id_rsa)`
   - Keys được tạo sẽ được lưu tại thư mục của user tạo keys. (Ví dụ: tạo keys bằng tài khoản root thì keys sẽ được lưu tại /root/tên_file)

   - Gõ ENTER để lưu cặp key vào thư mục con .ssh/ nằm trong thự mục home của user hiện hành

   ![anh2](https://image.prntscr.com/image/kRaEjwv4R3SJYnaKsxvbIg.png)

   - Đây là tùy chọn thêm 1 chuỗi mật khẩu , được khuyến nghị để tăng tính bảo mật . Nếu nhập chuỗi passphrase này , bạn sẽ phải gõ thêm chúng bất kỳ lúc nào sử dụng key ( chỉ trừ khi sử dụng phần mềm để SSH đã lưu trữ passphrase ) . Nếu không muốn sử dụng passphrase , có thể ENTER để bỏ qua. Ta nhập passphrase huy1998

   ![anh3](https://image.prntscr.com/image/uTjTzzwKRRW-__uQySHcaA.png)

- Phân quyền cho cặp key.
  
    Lưu ý: nếu bạn không chỉnh sửa cấu hình ssh thì bạn phải chuyển public keys tới thư mục mặc định (~/.ssh/authorized_keys) thì server mới có thể xác nhận.

    ```
    mv /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys

    chmod 600 /root/.ssh/authorized_keys

    chmod 700 .ssh

    ```

- Cấu hình file /etc/ssh/sshd_config để khai báo thư mục đặt key, cũng như cho phép user root login.

```
vi /etc/ssh/sshd_config

```
![anh4](https://image.prntscr.com/image/gNDEBabTRmi8syHMsjiXuw.png)

- khởi động lại ssh
```
Restart service ssh

```
- Dowload id_rsa chứ private key

![anh5](https://image.prntscr.com/image/MfvA_Lx0QFm-KSGQj9KrIA.png)

# Phía Client
1. Window

Nếu bạn sử dụng Windows để SSH đến, tiến hành copy file private key ra máy và load bằng PuTTY hoặc MobaXterm. Ở đây mình dùng MobaXterm để load private key.

![anh6](https://image.prntscr.com/image/u9Yw4j2ZQO6yuEFN1j9B8w.png)