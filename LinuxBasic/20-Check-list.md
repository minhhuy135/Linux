# Check list các kỹ thuật Linux

## Kiểm tra tài nguyên sử dụng của MySQL, HTTP

Để kiểm tra tài nguyên sử dụng của các ứng dụng, ta có thể sử dụng lệnh ps cùng với các options để lọc ra những trường mà mình muốn.

Ta có thể sử dụng thêm lệnh sort để sắp xếp kết quả
- Kiểm tra tài nguyên RAM của MySQL, HTTP
```
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | grep mysqld

ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | grep httpd
```

![anh1](https://image.prntscr.com/image/aGKG01ZnTbiAGC5uyodKfw.png)

Trong đó:

- `-eo`: dùng để hiển thị các đầu ra cụ thể được in ra (PID,User, %RAM)

- `--sort`: Sắp xếp kết quả in ra theo thứ tự từ lớn đến bé với cột %mem

- `grep`: Tuỳ chọn xuất ra tiến trình MYSQL hoặc HTTP

Kiểm tra tài nguyên CPU của MySQL, HTTP
```
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | grep mysqld

ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | grep httpd
```
![anh2](https://image.prntscr.com/image/JzWiPDm9T9yeUFap6997QQ.png)

## Kiểm tra log tại thời điểm bị thông báo Out of Memory

Tại thời điểm có thông báo "Out of Memory", lúc này sẽ có log được lưu tại var/log/messages. Ta có thể truy cập vào đó để kiểm tra.
```
cat /var/log/messages | grep memory
```
Sử dụng lệnh grep để lọc ra các log có liên quan đến memory.

![anh3](https://image.prntscr.com/image/K3QGqIBwSQm-lOngRzQ4jw.png)

## Kiểm tra các tiến trình sử dụng nhiều tài nguyên

Để kiểm tra tài nguyên của hệ thống một cách đơn giản, ta sử dụng những lệnh sau:

- free -m: Kiểm tra dung lượng RAM.

![anh4](https://image.prntscr.com/image/NNU5fwrxTOS1SemfUheXSA.png)

- top -c: Kiểm tra CPU

![anh5](https://image.prntscr.com/image/JjlRs71cQeOPp_N0GlR9hA.png)

- df -h: Kiểm tra dung lượng DISK.

![anh6](https://image.prntscr.com/image/VhPCGAErToCHZcpuHA6gfA.png)

Để kiểm tra các tiến trình sử dụng nhiều tài nguyên, ta cũng sẽ sử dung lệnh ps cùng với các options để lọc ra các tiến trình chiếm nhiều tài nguyên nhất.
```
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 10
```
Lọc ra 10 tiến trình sử dụng nhiều tài nguyên được sắp xếp từ lớn đến bé với %Ram sử dụng nhiều nhất.

![anh7](https://image.prntscr.com/image/gUgcIw_zRHO205ezE820LQ.png)

```
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 10
```

Lọc ra 10 tiến trình sử dụng nhiều tài nguyên được sắp xếp từ lớn đến bé với %CPU sử dụng nhiều nhất.

![anh8](https://image.prntscr.com/image/igAwGuerSl65tPU4Ekfapg.png)

## Kiểm tra các IP truy cập vào Apache nhiều nhất

Để kiểm tra các IP truy cập vào Webserver nói riêng và Apache nói chung, ta sử dụng lệnh awk để in ra kết quả tại access_log của Apache. Ta có thể sử dụng thêm lệnh sort để lọc kết quả.

## Tài liệu tham khảo
- https://www.tecmint.com/find-top-ip-address-accessing-apache-web-server/

- https://www.tecmint.com/find-linux-processes-memory-ram-cpu-usage/

- https://phoenixnap.com/kb/check-cpu-usage-load-linux

- https://linuxhint.com/check_memory_usage_process_linux/

##  Kiểm tra các IP truy cập vào Apache nhiều nhất
Để kiểm tra các IP truy cập vào Webserver nói riêng và Apache nói chung, ta sử dụng lệnh awk để in ra kết quả tại access_log của Apache. Ta có thể sử dụng thêm lệnh sort để lọc kết quả.
```
awk '{ print $1}' /var/log/httpd/access_log-20200901 | uniq -c | sort -nr | head -n 10
```
![anh8](https://image.prntscr.com/image/3_LOl82dTwK9Hj323IJXfg.png)

Trong đó:

- awk '{ print $1}' đường dẫn access.log: In ra cột đầu tiên của access.log.

- uniq -c: Báo cáo các dòng lặp lại để tổng hợp IP truy cập nhiều.

- sort -nr: Kết quả khi in ra sẽ được sắp xếp theo thứ tự từ lớn đến bé.

- head -n 10: Hiển thị ra 10 dòng đầu tiên theo bộ lọc.