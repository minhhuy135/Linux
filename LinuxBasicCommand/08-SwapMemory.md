# Hoán đổi bộ nhớ

## 1. Swap Memory là gì?
- Swap memory được sử dụng khi hệ thống của bạn quyết định rằng cần thêm bộ nhớ RAM cho quá trình hoạt động và bộ nhớ Ram hiện tại không đủ để sử dụng . Nếu điều đó xảy ra , các ài nguyên và dữ liệu tạm thời không hoạt động trên bộ nhớ RAM sẽ di chuyển để lưu trữ vào không gian Swap để giải phóng bộ nhớ RAM và sử dụng cho công việc khác .
- Thời gian truy cập vào Swap chậm hơn rất nhiều , do đó bạn không nên coi việc sử dụng Swap là một phương pháp thay thế cho RAM
## 2. Khi nào cần Swap Memory ?
- Tối ưu hóa bộ nhớ : Hệ thống sẽ di chuyển các tài nguyên và dữ liệu hiện không được sử dụng trong bộ nhớ RAM đến Swap , điều này giúp hệ thống phục vụ cho các mục đích khác tốt hơn
- Tránh các trường hợp không lườn trước : trông một số trường hợp , bạn không dự tính được bộ nhớ dành cho các chương trình mà bạn chuẩn bị thử nghiệm , hoặc một chương trình bất kỳ nào đó bất thường .
- Linux Swap có 2 dạng : phân vùng và File để xem nó ở đâu hãy sử dụng lệnh :
 # :swapon

 ![Anh1](https://image.prntscr.com/image/G6UJR1sHShOqED9kqGUg5A.png)

 ## Tạo file Swap
 - Tạo file sẽ dùng làm file Swap , tùy biến dung lượng 1G:
 # sudo fallocate -l 1G /swapfile

![Anh2](https://image.prntscr.com/image/Octlr9aQRBmzKdB7dAvHVw.png)

- Nếu hệ thống không có sẵn fallocate Tạo Swap File :
# sudo dd if =/dev/zero of=/swapfile bs=1024 count =1048576

*note : 
bs : kích thước Swap File
count : tốc độ

![Anh3](https://image.prntscr.com/image/e3X71lduQj2s3q16zuRgBw.png)

- Phân quyền cho file vừa tạo . Set mod để cho chỉ có root user mới có quyền truy cập : sudo chmod 600 /swapfile
 - Sử dụng mkswap để thiết lập file swap
 # sudo mkswap /swapfile\

![Anh4](https://image.prntscr.com/image/Zkdl5ul8TWG_RrD1QF171Q.png)

- Khởi động swap file bằng lệnh sau : sudo /swapfile
- Mở file /etc/fstap và thêm vào cuối dòng sau 

![Anh5](https://image.prntscr.com/image/Iyac3LXBTuuTOMtC5BtM9w.png)

# 4. Kiểm tra lại vùng Swap

![Anh6](https://image.prntscr.com/image/6chqV5jbRyaThHOolVpHHw.png)