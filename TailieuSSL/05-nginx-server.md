# NGINX là gì? Nó hoạt động như thế nào?
![anh1](https://image.prntscr.com/image/rKaId6BjTCeEW33RLZa2sQ.png)
## NGINX là gì?
NGINX, đọc là “engine-ex,”  là một phần mềm web server mã nguồn mở nỗi tiếng. Ban đầu nó dùng để phục vụ web HTTP. Tuy nhiên, ngày nay nó cũng được dùng làm reverse proxy, HTTP load balancer và email proxy như IMAP, POP3, và SMTP

Nhà sáng lập của phần mềm này là Igor Sysoev, triển khai dự án từ năm 2002 để giải quyết vấn đề C10k. C10k là giới hạn của việc xử lý 10 ngàn kết nối cùng lúc. Ngày nay, có nhiều web server còn phải chịu nhiều kết nối hơn vậy để xử lý. NGINX sử dụng kiến trúc hướng sự kiện (event-driven) không đồng bộ (asynchronous). Tính năng này khiến NGINX server trở nên đáng tin cậy, tốc độ và khả năng mở rộng lớn nhất.


Vì khả năng mạnh mẽ, và để có thể xử lý hàng ngàn kết nối cùng lúc, nhiều website có traffic lớn đã sử dụng dịch vụ NGINX. Một vài trong số những ông lớn công nghệ dùng nó là Google, Netflix, Adobe, Cloudflare, WordPress, và còn nhiều hơn nữa.

## NGINX server hoạt động như thế nào?

Trước khi học về NGINX, chúng ta cần biết cách web server hoạt động thế nào đã. Ví dụ như, khi ai đó gửi một yêu cầu để mở một trang web. Trình duyệt sẽ liên lạc với server chứa website đó. Sau đó, server sẽ tìm kiếm đúng file yêu cầu của trang đó và gửi ngược về cho server. Đây là một loại truy vấn đơn giản nhất

## Tóm lại, NGINX là gì?
NGINX là web server có thể hoạt động như là email proxy, reverse proxy và load balancer. Cấu trúc của phần mềm này là bất đồng bộ và hướng sự kiện; vì vậy cho phép phần mềm xử lý nhiều truy vấn cùng lúc. NGINX dễ dàng để mở rộng cho website hơn, đồng nghĩa với việc dịch vụ này có thể đi theo suốt qua trình phát triển của website, cũng như traffic web.

## Nginx có tính năng gì?
Những tính năng của máy chủ HTTP Nginx
1. Có khả năng xử lý hơn 10.000 kết nối cùng lúc với bộ nhớ thấp.
2. Phục vụ tập tin tĩnh (static files) và lập chỉ mục tập tin.
3. Tăng tốc reverse proxy bằng bộ nhớ đệm (cache), cân bằng tải đơn giản và khả năng chịu lỗi.
4. Hỗ trợ tăng tốc với bộ nhớ đệm của FastCGI, uwsgi, SCGI, và các máy chủ memcached.
5. Kiến trúc modular, tăng tốc độ nạp trang bằng nén gzip tự động.
6. Hỗ trợ mã hoá SSL và TLS.
Cấu hình linh hoạt; lưu lại nhật ký truy vấn