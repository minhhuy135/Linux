# Reset pass root single-mod linux

## 1. Khởi động lại hệ thống
 - Khởi động lại hệ thống và tinh chỉnh chế độ GRUB2 ở màn hình boot GRUB2. – Bấm nút ESC để màn hình dừng lại, sau đó ấn nút ‘e’ để thực hiện chỉnh sửa.

![anh1](https://image.prntscr.com/image/iMnnCBBHSGy3BczxKBQXkg.png)

## Bước 2: chỉnh thông số entry cần thiết

- Tìm đến dòng entry cấu hình “linux16” hoặc “linuxefi” đối với hệ thống UEFI.
- Xoá 2 thông số “rhgb quiet” để kích hoạt log message hệ thống khi thực hiện đổi mật khẩu root.
- Thêm vào cuối dòng “linux16..” thông số sau.

```
rd.break

```

![anh2](https://image.prntscr.com/image/6qR9xDMyTlm3JGGsZCVqDQ.png)

- Ấn Ctrl+X để lưu và tự động boot vào môi trường initramfs.

![anh3](https://image.prntscr.com/image/YwgYpjIGT8OqF3d6UL6fCw.png)

# Bước 3: remount filesystem và chuyển chế độ chroot

- Hệ thống filesystem hiện tại đang ở chế độ “read only” được mount ở thư mục /sysroot/, để thực hiện khôi phục mật khẩu root thì ta cần thêm quyền ghi (write) trên filesystem. Ta sẽ tiến hành remount lại filesystem /sysroot/ với quyền đọc-ghi (read-write).

- Kiểm tra lại xem filesystem đã được remount quyền đọc-ghi hay chưa.

```
switch_root:/# mount -o remount, rw /sysroot
switch_root:/# mount | grep -w “/sysroot“
```

![anh4](https://image.prntscr.com/image/mWHlspC5TgWOxtOvGEYb8Q.png)

- Lúc này filesystem đã được mount và ta sẽ chuyển đổi sang môi trường filesystem (prompt: sh-4.2#).
```
switch_root:/# chroot /sysroot

```
Tiến hành reset password user root.
```
sh-4.2# passwd root
```

![anh5](https://image.prntscr.com/image/4oMe2spsTsSlQNul7oG4Wg.png)

Bước 4: relabel SELINUX

- Chạy lệnh sau để update lại các thông số cấu hình SELINUX, nếu bạn có sử dụng SELINUX. Nguyên nhân khi ta update file /etc/passwd chứa mật khẩu thì các thông số SELINUX security contex sẽ khác nên cần update lại.
```	
sh-4.2# touch /.autorelabel

```

Bước 5: remount và reboot

- Remount filesystem “/“ ở chế độ read-only.
```
sh-4.2# mount -o remount, ro /

```
- Thoát môi trường chroot và Khởi động lại hệ thống
```
sh-4.2# exit
switch_root:/# exec /sbin/reboot
```