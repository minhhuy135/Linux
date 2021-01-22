![anh1](https://image.prntscr.com/image/IHVtIB7ZTrik7rti5rezFw.png)

# DNS là gì? Tại sao cần sử dụng DNS?

DNS là “Domain Name Server” nhưng thực chất nó là viết tắt của Domain Name System – hệ thống tên miền – là một hệ thống cho phép thiết lập tương ứng giữa địa chỉ IP và tên miền trên Internet.

mỗi thiết bị(điện thoại, máy tính, tivi,…) khi đã kết nối vào mạng Internet thì sẽ đều được cấp cho 1 địa chỉ IP để sử dụng, địa chỉ IP đó là duy nhất trên và giúp các thiết bị có thể dễ dàng xác định được đường đi trên Internet. Tuy nhiên không phải ai cũng có khả năng ghi nhớ được hết 32 bits của địa chỉ IPv4 và 128 bits của địa chỉ IPv6 do đó khái niệm về “domain” đã xuất hiện bước đầu giúp giải quyết vấn đề ghi nhớ các địa chỉ cho con người. Tuy nhiên khi Internet ngày càng phát triển cùng với đó là sự gia tăng của hàng triệu triệu tên miền toàn thế giới thì bài toán phân giải giữa tên miền và địa chỉ IP cũng trở nên khó khăn hơn.

# Chức năng của DNS

- Tất cả các thiết bị trên Internet có thể giao tiếp được với nhau là nhờ có địa chỉ IP(IPv4 và IPv6). Khi bạn muốn truy cập vào 1 trang web như facebook.com, github.com, dantri.com.vn,… thì bản chất thực sự của nó là truy cập vào địa chỉ IP của server chứa dữ liệu của các trang web này. Tuy nhiên không phải ai cũng có thể nhớ được đúng và nhớ được hết địa chỉ IP của các trang web, từ đó DNS đã xuất hiện.

- DNS đóng vai trò như 1 người phiên dịch, dịch giữa địa chỉ IP và tên miền chứ không có tác dụng thay thế hoàn toàn cho địa chỉ IP. Bạn cũng có thể tải 1 website bằng cách nhập trực tiếp địa chỉ IP thay vì dùng tên miền nếu bạn biết và nhớ địa chỉ IP của trang web đó. Ví dụ, khi bạn gõ “www.google.com” vào trình duyệt, máy chủ DNS sẽ lấy địa chỉ IP của máy chủ Google là “74.125.236.37”. Sau đó, bạn sẽ nhìn thấy trang chủ Google tải trang trên trình duyệt. Đó là quá trình phân giải DNS.

- Mỗi DNS còn có chức năng ghi nhớ những tên miền mà nó đã phân giải và ưu tiên sử dụng cho những lần truy cập sau.

- Nhờ DNS, bạn có thể sử dụng nhiều dịch vụ mạng như tìm kiếm thông tin, xem phim, chơi game, đăng nhập các website,…Có thể nói nếu không có DNS, con người không thể duyệt Internet nhanh chóng và dễ dàng như ngày nay.