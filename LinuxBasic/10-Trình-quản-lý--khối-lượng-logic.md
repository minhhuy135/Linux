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

# Kiểm tra các phân vùng có sẵn
Để xem các thiết bị hiện có và các hệ thống tệp riêng biệt của chúng, chỉ cần sử dụng lệnh sau:

![anhd](https://image.prntscr.com/image/MP1gPAB5RVm7vWh5Ph9dnQ.png)

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

VG: Tên Volume Group
- PV: Physical Volume sử dụng trong Volume Group
- VFree: Hiển thị không gian trống có sẵn trong Volume Group
- VSize: Tổng kích thước của Volume Group
- LV: Logical Volume nằm trong volume group
- SN: Số lượng Snapshot của volume group
Attr: Trạng thái của Volume group có thể ghi, có thể đọc, có thể thay đổi,

- Xem lại thông tin về VG0 ta vừa tạo:
[root@localhost ~]# vgdisplay

![anh5](https://image.prntscr.com/image/8EsK5mWqRw6LbGCv9op2bQ.png)

- Ý nghĩa các thông tin của Volume group khi chạy lệnh vgdisplay:
- VG Name: Tên Volume Group.
- Format: Kiến trúc LVM được sử dụng.
- VG Access: Volume Group có thể đọc và viết và sẵn sàng để sử dụng.
- VG Status: Volume Group có thể được định cỡ lại, chúng ta có thể mở rộng thêm nếu cần thêm dung lượng.
- PE Size: Mở rộng Physical, Kích thước cho đĩa có thể được xác định bằng kích thước PE hoặc GB, 4MB là kích thước PE mặc định của LVM
- Total PE: Dung lượng Volume Group có
- Alloc PE: Tổng PE đã sử dụng
- Free PE: Tổng PE chưa được sử dụng
# Tạo Logical Volume
Lệnh kiểm tra xem có những LV nào: # lvs

![anh6](https://image.prntscr.com/image/R1SMFbvcSOqMBz9NsaJG6w.png)

- Ta tạo 2 Logical volume là Data và Backups như đã nói ở trên.

![anh7](https://image.prntscr.com/image/LLn8fioqTHOjaIZAbSHvpg.png)

Trong đó:

- -n <'ten_logical_volume>
- -L : Sử dụng kích thước cố định
- -l : Sử dụng % của không gian còn lại trong Volume

- Ta kiểm tra thông tin các Logical Volume vừa tạo : # lvdisplay

![anh8](https://image.prntscr.com/image/1qMtZq6KQ_eX5PRTsFMBvQ.png)

![anh9](https://image.prntscr.com/image/X0D73JjWTwqIt5DY23k8Fw.png)

- Định dạng Logical Volume
Ext4: cũng giống như Ext3, lưu giữ được những ưu điểm và tính tương thích ngược với phiên bản trước đó. Như vậy, chúng ta có thể dễ dàng kết hợp các phân vùng định dạng Ext2, Ext3 và Ext4 trong cùng 1 ổ đĩa trong Ubuntu để tăng hiệu suất hoạt động. Trên thực tế, Ext4 có thể giảm bớt hiện tượng phân mảnh dữ liệu trong ổ cứng, hỗ trợ các file và phân vùng có dung lượng lớn... Thích hợp với ổ SSD so với Ext3, tốc độ hoạt động nhanh hơn so với 2 phiên bản Ext trước đó, cũng khá phù hợp để hoạt động trên server, nhưng lại không bằng Ext3.

Ta sẽ định dạng Logical Volume ở dạng ext4:

- # mkfs.ext4 /dev/VG0/Data
- # mkfs.ext4 /dev/VG0/Backups

![anh10](https://image.prntscr.com/image/mGJBlLViS1Go6U5kLwK2yw.png)

# Mount logical volume(Gắn kết khối lượng hợp lý)
- Ta cần Mount Logical volume để kiểm tra việc tạo thành công:

![anh11](https://image.prntscr.com/image/BwGUbmKfR9OPZkCzX8nY7g.png)

![anh12](https://image.prntscr.com/image/smJocDCxRrqInDo4fanyTw.png)

- Thay đổi kích thước Logical Volume Giảm kích thước LV Trước khi bắt đầu, cần sao lưu dữ liệu vì vậy sẽ được tránh sự cố xảy ra. Cần thực hiện cẩn thận 5 bước dưới đây:

- Ngắt kết nối file system.
- Kiểm tra file system sau khi ngắt kết nối.
- Giảm file system.
- Giảm kích thước Logical Volume hơn kích thước hiện tại.
- Kiểm tra lỗi cho file system.
- Mount lại file system và kiểm tra kích thước của nó. Ta sẽ giảm kích thước của LV Backups từ 2.99GB xuống còn 2GB mà không làm mất dữ liệu.

# Kiểm tra dung lượng của Logical Volume và kiểm tra file system trước khi thực hiện giảm

- #lvdisplay vg0

![anh13](https://image.prntscr.com/image/n_eZ1QpsQYSMtKvGFzac0A.png)

# df -TH

![anh14](https://image.prntscr.com/image/1pQDhz9RTymuoIQl6-UN-g.png)

# Unmount Logical volume Backups và Kiểm tra trạng thái mount(ngắt kết nối khối lượng logic và kiểu tra trạng thái gắn kết)

#umount /Backups/

![anh14](https://image.prntscr.com/image/j-Gvyef6QQiuTaboyy-Ckg.png)

-> Ta thấy không còn /VG0-Backups nữa.

# Kiểm tra lỗi

- Ta dùng lệnh: # e2fsck -f /dev/VG0/Backups

![anh15](https://image.prntscr.com/image/pcbqKftVROunL4M1SXKXFA.png)

-> Không thấy lỗi