# Command Line
Biến PS1 là chuỗi ký tự được hiển thị dưới dạng dấu nhắc trên dòng lệnh. Hầu hết, các phiên bản đều đặt PS1 thành một giá trị mặc định đã biết. Ví dụ: tên người dùng và máy chủ tương ứng:

[root@localhost ~]#

Nó thật sự hữu dụng vì luôn hiển thị để người dùng biết họ đang làm việc ở chế độ người dùng nào.

Ta có thể tùy chỉnh bằng cách thay đổi giá trị của PS1.

Ta xem giá trị mặc định của PS1: 

![anh1](https://image.prntscr.com/image/ptmdymN1RI_IWtAvpxgZeA.png)

Trong đó:

\u : tên user
\h : hostname
\W : thư mục đang làm việc
\$ : kí tự đại diện cho loại tài khoản

Để tùy biến ta chỉ cần thay đổi giá trị của PS1, ta sử dụng lệnh export. Ví dụ:

![anh2](https://image.prntscr.com/image/YNzIis-eR5eWXbAwp_NhBw.png)