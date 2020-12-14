# Basic Security
Theo mặc định, Linux phân chia các loại tài khoản ra cho các tác vụ và chương trình:

1.Root

2.System

3.Normal

4.Network

Để có 1 môi trường làm việc an toàn, ta chỉ nên cấp các đặc quyền tối thiểu có thể và cần thiết cho từng tài khoản và gỡ bỏ các tài khoản không hoạt động.

Lệnh last sẽ cho ta biết lần cuối mỗi người dùng đăng nhập vào hệ thống. Từ đó, ta có thể xác định các tài khoản không hoạt động để có thể gỡ bỏ nếu tài khoản đó không cần thiết.

![anh1](https://image.prntscr.com/image/PrX1A1TWQgi9jIWmHedrmw.png)

Tài khoản root là tài khoản đặc quyền nhất trên hệ thống Linux/UNIX. Tài khoản này có thể thực hiện tất cả các khía cạnh của quản trị hệ thống, bao gồm: thêm tài khoản, thay đổi mật khẩu người dùng, kiểm tra các file log, cài đặt thêm phần mềm,...

Các tài khoản thông thường có thể thực hiện được một số thao tác mà cần yêu cầu quyền đặc biệt. Tuy nhiên, cấu hình hệ thống phải cho phép các khả năng đó được thực hiện. Chạy một network client hay truyền file qua mạng là những quyền không cần yêu cầu tài khoản root.

Trong Linux, bạn có thể sử dụng lệnh su hoặc sudo để có thể cấp quyền root cho các tài khoản bình thường. 2 lệnh này có những sự khác nhau:

# Lệnh su:

- Để nâng cấp đặc quyền, bạn cần phải nhập mật khẩu của tài khoản root. Việc cung cấp mật khẩu root cho người dùng sẽ không bao giờ được thực hiện.
- Khi người dùng đã nâng lên tài khoản root, người dùng bình thường có thể làm bất cứ điều gì mà tài khoản root có thể làm được mà không cần hỏi lại mật khẩu.
- Tuy nhiên, có 1 số tính năng bị hạn chế về việc đăng nhập.

# Lệnh sudo:

- Bạn sẽ nhập mật khẩu của tài khoản đang sử dụng chứ không phải tài khoản root.
- Những gì người dùng làm có thể được kiểm soát chính xác và hạn chế, mặc định người dùng sẽ luôn phải giữ mật khẩu để thực hiện các thao tác tiếp theo với sudo, hoặc có thể tránh làm như vậy trong một khoảng thời gian được cấu hình trước đó.
- Tính năng đăng nhập chi tiết có sẵn.