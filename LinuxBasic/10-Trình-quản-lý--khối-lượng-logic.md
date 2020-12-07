# **Logical Volume Manager(LVM)**


## **Giới thiệu về LVM**
---
-LVM là một công cụ để quản lý phân vùng logic được tạo và phân bổ từ các ổ đĩa vật lý. Với LVM bạn có thể dễ dàng tạo mới, thay đổi kích thước hoặc xóa bỏ phân vùng đã tạo.

LVM được sử dụng cho các mục đích sau
- Tạo 1 hoặc nhiều phần vùng logic hoặc phân vùng với toàn bộ đĩa cứng (hơi giống với RAID 0, nhưng tương tự như JBOD), cho phép thay đổi kích thước volume.
- Quản lý trang trại đĩa cứng lớn (Large hard Disk Farms) bằng cách cho phép thêm và thay thế đĩa mà không bị ngừng hoạt động hoặc gián đoạn dịch vụ, kết hợp với trao đổi nóng (hot swapping).
- Trên các hệ thống nhỏ (như máy tính để bàn), thay vì phải ước tính thời gian cài đặt, phân vùng có thể cần lớn đến mức nào, LVM cho phép các hệ thống tệp dễ dàng thay đổi kích thước khi cần.
- Thực hiện sao lưu nhất quán bằng cách tạo snapshot nhanh các khối một cách hợp lý.
- Mã hóa nhiều phân vùng vật lý bằng một mật khẩu.

Cơ bản, **LVM**(Logical Volume Manager) bao gồm :
- **Physical volumes**: là những đĩa cứng vật lý hoặc phân vùng trên nó.
(`/dev/fileserver/share, /dev/fileserver/backup, /dev/fileserver/media`)
- **Volume groups**: là một nhóm bao gồm các Physical volumes. Có thể xem Volume group như 1 “ổ đĩa ảo”.
(`fileserver`)
- **Logical volumes**: có thể xem như là các “phân vùng ảo” trên “ổ đĩa ảo” bạn có thể thêm vào, gỡ bỏ và thay đổi kích thước một cách nhanh chóng. (`/dev/sda1, /dev/sdb1, /dev/sdc1, /dev/sdd1`)

## **Thao tác trên LVM**
Liệt kê các phân vùng ổ cứng trong hệ thống.
`fdisk -l`. (hoặc để đơn giản. Ta dùng `# ls -la /dev/sd*`)
- Có 3 ổ cứng: sda, sdb, sdc
- sda : ổ cài đặt hệ điều hành
- sdb(2GB) và sdc(4GB): ổ để lưu trữ data

![anh1](https://image.prntscr.com/image/XdUPA8epTCqQhymp0NZJKA.png)

# Tạo Physical Volume
- Tạo 2 Physical Volume từ 2 ổ `sdb` và `sdc`: 
`# pvcreate /dev/sdb /dev/sdc`


[root@localhost ~]# pvcreate /dev/sdb /dev/sdc

![anh2](https://image.prntscr.com/image/43iHI9pWT2G-4eCRxqpMig.png)

# Tạo Volume Groups (VG)

- Tạo 1 VG có tên VG0 từ 2 Physical Volume vừa tạo ở trên: # vgcreate VG0 /dev/sdb /dev/sdc

![anh3](https://image.prntscr.com/image/aJSKSPN6RnacqrLpJP8SAA.png)

- Lệnh kiểm tra những VG hiện có: # vgs

![anh4](https://image.prntscr.com/image/6njzUtxoRqKD1X1x71oclg.png)

- Xem lại thông tin về VG0 ta vừa tạo:
[root@localhost ~]# vgdisplay

![anh5](https://image.prntscr.com/image/8EsK5mWqRw6LbGCv9op2bQ.png)

- Ý nghĩa các thông tin của Volume group khi chạy lệnh vgdisplay: