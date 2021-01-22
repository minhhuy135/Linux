![anh1](https://image.prntscr.com/image/IHVtIB7ZTrik7rti5rezFw.png)

# DNS là gì? Tại sao cần sử dụng DNS?

DNS là “Domain Name Server” nhưng thực chất nó là viết tắt của Domain Name System – hệ thống tên miền – là một hệ thống cho phép thiết lập tương ứng giữa địa chỉ IP và tên miền trên Internet.

mỗi thiết bị(điện thoại, máy tính, tivi,…) khi đã kết nối vào mạng Internet thì sẽ đều được cấp cho 1 địa chỉ IP để sử dụng, địa chỉ IP đó là duy nhất trên và giúp các thiết bị có thể dễ dàng xác định được đường đi trên Internet. Tuy nhiên không phải ai cũng có khả năng ghi nhớ được hết 32 bits của địa chỉ IPv4 và 128 bits của địa chỉ IPv6 do đó khái niệm về “domain” đã xuất hiện bước đầu giúp giải quyết vấn đề ghi nhớ các địa chỉ cho con người. Tuy nhiên khi Internet ngày càng phát triển cùng với đó là sự gia tăng của hàng triệu triệu tên miền toàn thế giới thì bài toán phân giải giữa tên miền và địa chỉ IP cũng trở nên khó khăn hơn.

# Chức năng của DNS

- Tất cả các thiết bị trên Internet có thể giao tiếp được với nhau là nhờ có địa chỉ IP(IPv4 và IPv6). Khi bạn muốn truy cập vào 1 trang web như facebook.com, github.com, dantri.com.vn,… thì bản chất thực sự của nó là truy cập vào địa chỉ IP của server chứa dữ liệu của các trang web này. Tuy nhiên không phải ai cũng có thể nhớ được đúng và nhớ được hết địa chỉ IP của các trang web, từ đó DNS đã xuất hiện.

- DNS đóng vai trò như 1 người phiên dịch, dịch giữa địa chỉ IP và tên miền chứ không có tác dụng thay thế hoàn toàn cho địa chỉ IP. Bạn cũng có thể tải 1 website bằng cách nhập trực tiếp địa chỉ IP thay vì dùng tên miền nếu bạn biết và nhớ địa chỉ IP của trang web đó. Ví dụ, khi bạn gõ “www.google.com” vào trình duyệt, máy chủ DNS sẽ lấy địa chỉ IP của máy chủ Google là “74.125.236.37”. Sau đó, bạn sẽ nhìn thấy trang chủ Google tải trang trên trình duyệt. Đó là quá trình phân giải DNS.

- Mỗi DNS còn có chức năng ghi nhớ những tên miền mà nó đã phân giải và ưu tiên sử dụng cho những lần truy cập sau.

- Nhờ DNS, bạn có thể sử dụng nhiều dịch vụ mạng như tìm kiếm thông tin, xem phim, chơi game, đăng nhập các website,…Có thể nói nếu không có DNS, con người không thể duyệt Internet nhanh chóng và dễ dàng như ngày nay.

Cấu trúc của hệ thống tên miền:

Hiện nay hệ thống tên miền trên thế giới được phân bố theo cấu trúc hình cây. tên miền cấp cao nhất là tên miền gốc (ROOT) được thể hiện bằng dấu “.”.
Dưới tên miền gốc có hai loại tên miền là: tên miền cấp cao dùng chung- gTLDs (generic Top Level Domains) và tên miền cấp cao quốc gia – ccTLD (country code Top Level Domains) như .vn, .jp, .kr, .…

![anh2](https://image.prntscr.com/image/2LhWc4v2Q_e6dxYn82FLCw.png)

## Top Level Domain Names (TLDs)
- TLDs được chia dựa trên các khu vực địa lý hoặc các lĩnh vực liên quan.
- Tại thời điểm của bài viết, trên thế giới hiện có khoảng 800 TLDs.
### Danh mục TLDs hiện tại:
- Generic top-level domain, ví dụ: .org, .com, .net, .gov, .edu,…
- Country-code top-level domains(tên miền cấp cao quốc gia), ví dụ: .us, .ca, .vn,…
- New branded top-level domains(tên miền cấp mới cho các thương hiệu), ví dụ: .linux, .microsoft, .companyname,…
- Infrastructure top-level domains(tên miền cấp cao cho cơ sở hạ tầng), ví dụ: .arpa,…

# Máy chủ tên miền DNS ROOT server

Máy chủ tên miền ở mức cao nhất (ROOT name server) là máy chủ tên miền chứa các thông tin để tìm kiếm các máy chủ tên miền lưu trữ (authority) cho các tên miền thuộc mức cao nhất (top-level-domain).
Máy chủ ROOT có thể đưa ra các truy vấn (query) để tìm kiếm tối thiểu là các thông tin về địa chỉ của các máy chủ tên miền authority thuộc lớp top-level-domain chứa tên miền muốn tìm. Sau đó, các máy chủ tên miền ở mức top-level-domain có thể cung cấp các thông tin về địa chỉ của máy chủ authority cho tên miền ở mức second-level-domain chứa tên miền muốn tìm. Quá trình tìm kiếm tiếp tục cho đến khi chỉ ra được máy chủ tên miền authority cho tên miền muốn tìm

# 2. Cách thức hoạt động của DNS là gì?

DNS hoạt động từng bước theo cấu trúc của nó. Mỗi máy chủ của nó đều chưa tên miền cục bộ khác nhau. 

![anh2](https://image.prntscr.com/image/0VjIfN2CShSpR7vJvNrI9g.png)

Đầu tiên nó sẽ thực hiện bước truy vấn để lấy thông tin còn được gọi là DNS Query. Có nghĩa là, khi bạn truy cập vào website bằng cách gõ tên miền trên thanh công cụ. DNS server sẽ bắt đầu kiểm tra cơ sở dữ liệu nằm ở hệ điều hành. Nếu DNS server có cơ sở dữ liệu này, nó sẽ thực hiện chuyển đổi và trả kết quả cho người dùng.

Trong trường hợp DNS server không có được câu trả lời. DNS này có thể truy vấn các DNS server khác cao cấp hơn. Tại DNS server cao cấp, DNS này sẽ đóng vai trò là một khách hàng để thực hiện truy vấn.

Tiếp đến, DNS server cao cấp sẽ kiểm tra bộ cache của mình để xem có dữ liệu này không. Nếu có nó sẽ tiếp tục kiểm tra thẩm quyền. Trong trường hợp không có thẩm quyền, DNS sẽ trả kết quả là không tồn tại. Nếu có thẩm quyền và có dữ liệu nó sẽ gửi địa chỉ IP này về DNS server ban đầu. Sau đó DNS này sẽ mã hóa địa chỉ IP và trả kết quả trên máy chủ của người dùng. Người dùng sẽ dùng địa chỉ IP đã được chuyển đổi để kết nối với server chứa website mình cần.

Nhưng thực tế dns hoạt động như này

![anh3](https://image.prntscr.com/image/xgmfXjdWTg6gA7kYttwEbw.png)

