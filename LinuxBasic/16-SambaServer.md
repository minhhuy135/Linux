# Samba Server và SBM
Samba là một phần mềm nguồn mở nó cho phép chia sẻ file (tạo file server) với giao thức SMB Nó cho phép kết nối mạng của Microsoft Windows®, Linux, UNIX và các hệ điều hành khác. Samba cho phép máy chủ Linux, UNIX xuất hiện dưới dạng Windows Server tới Windows Client.

Samba Server được xem là một máy chủ tập tin (File Server)sử dụng trong mạng nội bộ

`File server` (hay máy chủ tập tin) là một máy tính nối mạng cung cấp không gian để lưu trữ và chia sẻ dữ liệu như văn bản, hình ảnh, âm thanh, video. Các dữ liệu này có thể được truy cập bởi các workstation (máy trạm). Workstation này có thể kết nối được tới máy chủ khi các máy này chia sẻ quyền truy cập thông qua một mạng máy tính.

Với Samba, quản trị viên có thể làm được:
 
1. Cung cấp dịch vụ cây thư mục và máy in cho Linux, UNIX và Windows Client.

![anh1](https://image.prntscr.com/image/2n-ClZQjSiuz_kgyhuZnRQ.png)

2. Hỗ trợ trình duyệt mạng dù có hay không NetBIOS.
NetBIOS (Network Basic Input/Output System) là một ngôn ngữ lập trình ứng dụng ghép nối tương thích API cho các máy khách kết nối tới tài nguyên các máy trong mạng LAN ,`đóng vai trò như một cổng giao tiếp chung nhằm giúp tạo kết nối hoặc từ chối các kết nối đến các dịch vụ của mạng`

Samba bao gồm các dịch vụ sau: smb, nmb, winbind

Mặc định Samba Server sử dụng cổng 139 và 445 (giao thức TCP), nhớ cổng này để mở firewall hoặc ánh xạ cổng nếu sử dụng với Docker ...

nmbd : trình nền máy chủ hiểu và trả lời NetBIOS qua các yêu cầu dịch vụ bởi SMB trong các hệ thống dựa trên Windows. Cổng mặc định mà máy chủ lắng nghe lưu lượng NMB là cổng UDP 137.

winbindd : là dịch vụ phân giải thông tin người dùng và nhóm nhận được từ máy chủ chạy Windows. Điều này giúp cho người dùng Windows và thông tin các nhóm có thể hiểu được bởi các nền tảng Linux và UNIX. Nó cho phép người dùng Windows xuất hiện và hoạt động như người dùng Linux, UNIX trên máy Linux và UNIX.

# Samba Lab

# Mô hình lab
Ta sẽ tạo 1 Samba Server trên CentOS-7 để chia sẻ tệp cho máy Window 10.