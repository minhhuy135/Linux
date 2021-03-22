# Hướng dẫn đọc hiểu lệnh TOP trên linux

## I. Giới thiệu
Lệnh TOP là một trong những lệnh cực kì quan trong cho admin quản trị hệ thống linux. Quản trị được các thông số, CPU, RAM, I/O , các tiến trình đang hoạt động trên hệ thống.

Lệnh trên giúp cho admin có thể giám sát hệ thống của mình một cách chuyên nghiệp và nắm rõ từng thông tin của hệ thống. Lệnh TOP tương tự Task manager trên windows. 

Hôm nay bài viết sẽ hướng dẫn bạn một cách chi tiết cách đọc lệnh TOP, giúp bạn thông suốt và rõ ràng hơn trong quá trình quản lý và sử dụng lệnh TOP.

Đọc hiểu các tham số

![anh1](https://image.prntscr.com/image/dL-YQZjJQ5_Of0bFOt_G0g.png)

Kết quả dòng 1 : Liên quan đến thời gian của server

Dòng đầu tiên cung cấp một số thông tin cấp cao cơ bản về hệ thống:

- Thời gian
- Máy tính đã chạy bao lâu rồi
- Số lượng người dùng
- Tải trung bình

DÒNG 2
Dòng thứ hai tóm tắt số lượng nhiệm vụ đang diễn ra

- Tổng số tiến trình1
- Số lượng tiến trình đang chạy
- Số lượng nhiệm vụ ngủ
- Số lượng nhiệm vụ đã dừng
- Tiến trình chờ stop từ tiến trình khác

DÒNG 3
Dòng thứ ba tóm tắt hiệu suất CPU:

- %us: Mức sử dụng CPU theo tỷ lệ phần trăm của người dùng
- %sy : CPU được dùng cho từng tiến trình của hệ thống
- %ni : Tỷ lệ sử dụng CPU theo tỷ lệ phần trăm bởi các quy trình ưu tiên thấp
- %id CPU ở trạng thái nghỉ
- %wa : CPU trong trạng thái chờ I/O
- %hi CPU được dùng phục vụ cho phần cứng khi bị gián đoạn
- %si CPU được dùng phục vụ cho phần mềm bị gián đoạn
- %ni CPU ảo chờ đợi CPU thục xử lý các tiến trình

Kết quả dòng 4: Liên quan đến thông tin RAM

- Tổng dung lượng ram
-  Dung lượng ram đã được sử dụng
- Dung lượng ram trống
- Bộ đệm

DÒNG 5
Dòng thứ năm nêu bật không gian hoán đổi có sẵn và tổng bộ nhớ bao gồm hoán đổi:

- Dung lượng swap ram
- Dung lượng swap ram đang sử dụng 
- Dung lượng Swap trống
- Bộ nhớ khả dụng

Các tham số các tiến trình đang hoạt động

- PID : mã PID của tiến trình
- User : Người sử dụng
- PR : Sự ưu tiên của tiến trình
- NI : Mức độ đẹp của tiến trình
- VIRT : Bộ nhớ ảo được sử dụng bởi tiến trình
- RES : Dung lượng ram thực chạy một tiến trình
- SHR : Dung lượng ram share cho tiến trình
- S : Trạng thái tiến trình đang hoạt động
- %CPU : CPU được quy trình sử dụng 
- %MEM : Bộ nhớ được quy trình sử dụng 
- TIME+ : Tổng thời gian thực hiện một tiến trình
- COMMAND : Tên của tiến trình

Các tham số chính cho lệnh top

- -h  Hiển thị phiên bản hiện tại
- -c  Tham số này chuyển đổi trạng thái cột lệnh từ hiển thị lệnh sang hiển thị tên chương trình và ngược lại
- -d  Chỉ định thời gian trễ khi refresh màn hình
- -o  Sắp xếp theo trường được đặt tên
- -p  Chỉ hiển thị các tiến trình với ID được chỉ định
- -u  Chỉ hiển thị những tiến trình của người dùng được chỉ định
- -i  Không hiển thị các idle task

# Lệnh ps (Process status)
Lệnh ps liệt kê các process đang chạy và PID của chúng cùng một số thông tin khác phụ thuộc vào các tùy chọn khác nhau.

Nó sẽ đọc thông tin quá trình từ các tệp ảo trong hệ thống /proc.

ps có nhiều option để có thể chọn lọc đầu ra theo nhu cầu.

Cú pháp
```
ps [option]
```

## Ý nghĩa một số trường thông tin
|Tên|Ý nghĩa|
|-|-|
|CMD|Câu lệnh thực thi tiến trình|
|%CPU|Lượng cpu sử dụng|
|%MEM|Lượng Ram tiêu thụ|
|PID|Mã tiến trình|
|PPID|Mã của tiến trình cha|
|UID|Mã người dùng|
|USER|Tên người dùng|
|PRI|Độ ưu tiên của tiến trình|
|RSS|Lượng bộ nhớ sử dụng thực|
|VSZ or SZ|Lượng bộ nhớ ảo sử dụng|
|S or STAT|Chứa đoạn mã code mô tả trạng thái của tiến trình|
|Start or STIME|Thời gian mà câu lệnh đó khởi động. Nhỏ hơn 24h là “HH:MM:SS”, lớn hơn là “Mmm dd”|
|TTY|Terminal liên quan tới tiến trình|






1. Xem thông tin shell hiện tại
```
ps
```
OUTPUT

![anh1](https://image.prntscr.com/image/SZqhp7FbThGpHENQWJpnkA.png)

Thông tin trong bảng:

PID:	Id của tiến trình

TTY :	Thông tin terminal mà người dùng đăng nhập

TIME : 	Lượng CPU tính bằng phút giây mà tiến trình đó chạy

CMD: 	Câu lệnh để thực hiện process đó

## Hiển thị tất cả các tiến trình
```
ps -eF
```
![anh2](https://image.prntscr.com/image/nfBfXaAUSt_ARNFvH0DyRA.png)



2. Xem các tiến trình theo user
```
ps -FG [user]
```
![anh3](https://image.prntscr.com/image/AQrONWp4Q2ClL6FC23iSeQ.png)

3. Xem thông tin các tiến trình chạy dưới quyền root
```
ps -U root -u root u
```
![anh4](https://image.prntscr.com/image/kqYhsaQTRdiFdhG6HDCj8w.png)

4. Hiển thị các process sử dụng nhiều RAM nhất theo thứ tự từ cao xuống thấp.
```
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head
```
![anh5](https://image.prntscr.com/image/odr_JB8FTVeuHoQ2WY3O8g.png)

5. Hiển thị các process sử dụng nhiều CPU nhất từ cao tới thấp
```
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head
```
![anh6](https://image.prntscr.com/image/VeixQKpZQ5CNQguQ3aTaqQ.png)

6. Theo dõi xem process nào đang sử dụng nhiều CPU nhất
```
watch -n 1 'ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu'
```
![anh7](https://image.prntscr.com/image/GapWlCIyQFmJT2qkjNBWgQ.png)

7. Theo dõi xem process nào đang sử dụng nhiều RAM nhất
```
watch -n 1 'ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem'
```
![anh8](https://image.prntscr.com/image/tWmbRtvOQ9mlTJOgPPNdTQ.png)