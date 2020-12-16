# **Logical Volume Manager(LVM)**


Phần 1. Giới thiệu về LVM
1. LVM là gì ?
LVM là một công cụ để quản lý phân vùng logic được tạo và phân bổ từ các ổ đĩa vật lý. Với LVM bạn có thể dễ dàng tạo mới, thay đổi kích thước hoặc xóa bỏ phân vùng đã tạo.

Với kỹ thuật Logical Volume Manager (LVM), ta có thể thay đổi kích thước mà không cần phải sửa lại partition table của OS. Nếu muốn mở rộng dung lượng của nó, ta chỉ cần ấn định lại dung lượng mà không cần phân vùng lại, cũng không phải đối mặt với nguy cơ mất dữ liệu khi thay đổi dung lượng như khi thao tác trên Partition.

2. Cấu trúc LVM

<img src="https://imgur.com/VtGksx7.png">

- **Hard Drives:** Thiết bị lưu trữ dữ liệu. 

- **Partition:** Partitions là các phân vùng của Hard drives, mỗi Hard drives có 4 partition. Có 2 loại Partition:

    - **Primary partition:** Phân vùng chính, có thể khởi động , mỗi đĩa cứng có thể có tối đa 4 phân vùng này.

    - **Extended partition:** Phân vùng mở rộng.

- **Physical Volumes:** Một ổ đĩa vật lý có thể phân chia thành nhiều phân vùng vật lý gọi là Physical Volumes.

- **Volume Group:** Là một nhóm bao gồm nhiều Physical Volume trên 1 hoặc nhiều ổ đĩa khác nhau được kết hợp lại thành một Volume Group. Volume Group được sử dụng để tạo ra các Logical Volume, trong đó người dùng có thể tạo, thay đổi kích thước, lưu trữ, gỡ bỏ và sử dụng.

<img src="https://imgur.com/gHIAFxL.png">

- **Logical Volume:** Một Volume Group được chia nhỏ thành nhiều Logical Volume. Nó được dùng để mount tới hệ thống tập tin (File System) và được format với những chuẩn định dạng khác nhau như ext2, ext3, ext4…

<img src="https://i.imgur.com/UNmyHQI.png">

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

Mount lại file system và kiểm tra kích thước của nó. # mount /dev/VG0/Backups /Backups/

![anh16](https://image.prntscr.com/image/GAltt6WZSCa80vaZ5Ij8IQ.png)

# Thay đổi dung lượng
Thay đổi dung lượng physical volume ta sử dụng lệnh theo cú pháp

lvextend -L (n) /dev/(tên group)/(tên logical)

Trong đó

- lvextend : là lệnh tăng dung lượng
- lvreduce : là lệnh dùng để giảm dung lượng
- -L : là option của lệnh
- (n) : là số dùng để tăng giảm dung lượng theo ý muốn của ta

Giảm kích thước Logical volume Backups

Ta sử dụng lệnh # lvreduce -L (n) /dev/<tên_group>/<tên_logical>

![anh18](https://image.prntscr.com/image/hOMEVfI0T_K2KmleCM6G-w.png)

Tăng kích thước Logical volume Backups

Ta sẽ tăng kích thước LV Data lên ~3G(dung lượng còn lại của tổng sdb và sdc) Ta sử dụng lệnh : # lvextend -l +100%FREE /dev/vg0/Backups

[root@localhost ~]# lvextend -l +100%FREE /dev/vg0/Backups

![anh19](https://image.prntscr.com/image/VmaeKiwtQN6B21_p-hlhxA.png)

# Xóa 1 Logical Volume và 1 Group Volume
Ta sẽ xóa LV Data theo các bước sau:

- Kiểm tra những LV hiện có:

![anh20](https://image.prntscr.com/image/YoMiZTU9TWavjvhA2GerSw.png)

- Umount Data: # umount /Data/
- Disable LV Data# lvchange -an /dev/VG0/Data
- Xóa LV Data:

![anh21](https://image.prntscr.com/image/CFOrcmtTQqaa3p0UbtNFxA.png)

- Kiểm tra các danh sách GV: # vgs

![anh22](https://image.prntscr.com/image/dObjW46ZQQ2gL0t16F3sbg.png)

# Xóa 1 Group Volume
 #vgremove /dev/<tên_Group_Volume>
- Disable Volume Group : # vgchange -an /dev/vg0
- Remove GV:

![anh23](https://image.prntscr.com/image/54VsEZlCQ0yWWzlNzqrYSA.png)

Xóa Physical Volume
Cuối cùng là xóa Physical Volume:

# pvremove /dev/sdb

## Mounting Logical Volume

Chúng ta cần phải gắn kết vĩnh viễn. Để thực hiện gắn kết vĩnh viễn phải nhập trong tệp /etc/fstab. Bạn có thể sử dụng trình soạn thảo vi để nhập vào:

```
[root@localhost ~]# vi /etc/fstab

#
# /etc/fstab
# Created by anaconda on Thu Apr 11 21:36:46 2019
#
# Accessible filesystems, by reference, are maintained under '/dev/disk'
# See man pages fstab(5), findfs(8), mount(8) and/or blkid(8) for more info
#
/dev/mapper/cl-root     /                       xfs     defaults        0 0
UUID=8c1d2c4f-13d0-4ec9-ae3d-f706311400ad /boot                   xfs     defaults        0 0

UUID=9a749152-5f96-4f30-9c28-71a2126388ab /Data ext4 defaults 0 0
UUID=54005d93-b2d0-4748-8d6c-7f0632f02b59 /Backups ext4 defaults 0 0

```
Để xác định UUID trên mỗi đĩa. Chúng ta chạy lệnh sau:
```
[root@localhost ~]# blkid /dev/vg0/Data
```

![anh24](https://image.prntscr.com/image/EJRJ9CcqSIeqz5I_vUPSmw.png)

Lưu lại file /etc/fstab và chạy lệnh sau lưu các thay đổi và gắn kết LV:
```
[root@localhost ~]# mount -a
[root@localhost ~]# mount | grep backups
/dev/mapper/vg0-backups on /backups type ext4 (rw,relatime,seclabel,data=ordered)
[root@localhost ~]# mount | grep projects
/dev/mapper/vg0-projects on /projects type ext4 (rw,relatime,seclabel,data=ordered)
```
Nếu có lỗi, không reboot server để tránh tình trạng server không thể khởi động. Kiểm tra cấu hình trong file /etc/fstab và chạy lại lệnh cho tới khi không có thông báo lỗi.

![anh25](https://image.prntscr.com/image/F8cL4qLLRCWdmP1Th_7AXg.png)