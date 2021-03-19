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