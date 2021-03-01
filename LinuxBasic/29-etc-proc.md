# Tìm hiểu về /etc/proc - Process Information
## Mục lục
### 1. Hệ thống file /proc ( proc FS)
Chứa các thông tin về System Process(quá trình hệ thống).

Proc là hệ thống file ảo (pseudo file system), một hệ thống file thời gian thực (real time) và thường trú trong bộ nhớ (memory resident) để theo dõi các process đang chạy cùng với trạng thái của hệ thống.

Proc là hệ thống file ảo bởi vì trên thực tế nó không tồn tại trong bất kì phương tiện lưu trữ nào. Nó tồn tại dựa trên bộ nhớ ảo và dữ liệu luôn thay đổi động cùng với trạgn thái của hệ thống. Hầu hết các dữ liệu trong proc FS được cập nhật liên tục để phù hợp với trạng thái hiện tại của hệ điều hành. Nội dung của proc FS có thể được đọc bởi user có quyền thích hợp, trong đó một số phần chỉ dó thể đọc bởi owner của process và root. Nếu liệt kê thư mục root (/) ra bạn sẽ thấy

![anh1](https://image.prntscr.com/image/H1a__RLiTlSoh2mo6gVnpw.png)

Thư mục proc có kích thước luôn = 0 và thời điểm modify cuối cùng là thời điểm hiện tại.

## 2. Nội dung thư mục /proc
Sử dụng lệnh ls /proc sẽ thấy tập tin và các thư mục:
![anh2](https://image.prntscr.com/image/CUkWL19nTCCikv975SnB-w.png)

Một số nội dung và mô tả ngắn gọn:
file:/proc/cmdline 

- / proc / buddyinfo : Tệp này được sử dụng chủ yếu để chẩn đoán các vấn đề phân mảnh bộ nhớ.
- / proc / cmdline : Tệp này hiển thị các tham số được truyền cho hạt nhân tại thời điểm nó được khởi động.
- / proc / cpuinfo : Tệp ảo này xác định loại bộ xử lý được hệ thống của bạn sử dụng.
- / proc / crypto : Tệp này liệt kê tất cả các mật mã đã cài đặt được nhân Linux sử dụng, bao gồm các chi tiết bổ sung cho từng loại.
- / proc / devices : Tệp này hiển thị các ký tự khác nhau và khối các thiết bị hiện được định cấu hình (không bao gồm các thiết bị có mô-đun không được tải).
- / proc / dma : Tệp này chứa danh sách các kênh ISA DMA đã đăng ký đang được sử dụng.
- / proc / executedomains : Tệp này liệt kê các miền thực thi hiện được hỗ trợ bởi nhân Linux, cùng với phạm vi các tính năng mà chúng hỗ trợ.
- / proc / filesystems : Tệp này hiển thị danh sách các loại hệ thống tệp hiện được hạt nhân hỗ trợ. Cột đầu tiên cho biết liệu hệ thống tệp có được gắn trên thiết bị khối hay không. Những thứ bắt đầu bằng nodev không được gắn trên một thiết bị. Cột thứ hai liệt kê tên của hệ thống tệp được hỗ trợ. Lệnh mount chuyển qua các hệ thống tệp được liệt kê ở đây khi một hệ thống không được chỉ định làm đối số.
- / proc / interrupts : Tệp này ghi lại số lần ngắt trên mỗi IRQ trên kiến ​​trúc x86.
- / proc / iomem : Tệp này hiển thị cho bạn bản đồ hiện tại của bộ nhớ hệ thống cho từng thiết bị vật lý.
- / proc / ioports : Tệp này cung cấp danh sách các khu vực cổng hiện đã đăng ký được sử dụng để giao tiếp đầu vào hoặc đầu ra với thiết bị.
- / proc / kcore : Tệp này đại diện cho bộ nhớ vật lý của hệ thống và được lưu trữ ở định dạng tệp lõi. Nội dung của tệp này được thiết kế để trình gỡ lỗi, chẳng hạn như gdb, và con người không thể đọc được.
- / proc / kmsg : Tệp này được sử dụng để chứa các thông báo do hạt nhân tạo ra. Các thông báo này sau đó sẽ được các chương trình khác, chẳng hạn như / bin / dmesg, chọn.
- / proc / loadavg : Tệp này cung cấp cái nhìn về mức trung bình tải liên quan đến cả CPU và I / O theo thời gian, cũng như dữ liệu bổ sung được sử dụng bởi thời gian hoạt động và các lệnh khác.
- / proc / lock : Tệp này hiển thị các tệp hiện bị khóa bởi hạt nhân. Nội dung của tệp này chứa dữ liệu gỡ lỗi hạt nhân bên trong và có thể thay đổi rất nhiều, tùy thuộc vào việc sử dụng hệ thống.
- / proc / mdstat : Tệp này chứa thông tin hiện tại cho các cấu hình RAID, nhiều đĩa.
- / proc / meminfo : Tệp này báo cáo một lượng lớn thông tin có giá trị về việc sử dụng RAM của hệ thống.
- / proc / modules : Tệp này hiển thị danh sách tất cả các mô-đun được tải vào hạt nhân. Hầu hết thông tin này cũng có thể được xem bằng cách sử dụng lệnh / sbin / lsmod.

# Thư mục quy trình trong / proc
Thư mục / proc chứa các thư mục có tên bằng số. Các thư mục này được đặt tên theo ID quy trình của chương trình và chứa thông tin về quy trình đó. Chủ sở hữu và nhóm của mỗi thư mục quy trình được đặt thành người dùng đang chạy quy trình. Mỗi thư mục quy trình chứa một số tệp bao gồm

- cmdline: Lệnh được đưa ra khi bắt đầu quá trình
- cwd: Một liên kết tượng trưng đến thư mục làm việc hiện tại cho quy trình
- environ:  Danh sách các biến môi trường cho quá trình
- exe:  Một liên kết tượng trưng đến tệp thực thi của quá trình này
- fd: Thư mục chứa tất cả các bộ mô tả tệp cho một quá trình cụ thể
- maps:  Một danh sách các bản đồ bộ nhớ tới tệp thực thi và tệp thư viện được liên kết với quy trình
- mem:  Bộ nhớ do tiến trình nắm giữ (người dùng không thể đọc tệp)
- root: Một liên kết đến thư mục gốc của quy trình
- stat:  Trạng thái của quá trình bao gồm trạng thái chạy và sử dụng bộ nhớ
- statm:  Trạng thái của bộ nhớ được sử dụng bởi quá trình
- status: Trạng thái của quá trình ở dạng dễ đọc hơn trạng thái hoặc trạng thái

# Các thư mục khác trong / proc
Các thư mục khác trong nhóm thư mục / proc thông tin tương tự theo chủ đề. Sau đây là danh sách một phần của các thư mục này:

- / proc / bus : Thư mục này chứa thông tin về các bus khác nhau có sẵn trên hệ thống. Các thư mục con và tệp có sẵn trong / proc / bus khác nhau tùy thuộc vào thiết bị được kết nối với hệ thống.
- / proc / bus / pci, / proc / bus / usb : Bạn có thể lấy danh sách tất cả các thiết bị PCI và USB có trên hệ thống bằng cách sử dụng lệnh cat trên tệp thiết bị trong các thư mục này, nhưng đầu ra rất khó đọc và thông dịch. Để có danh sách thiết bị mà con người có thể đọc được, hãy chạy lệnh lspci và lsusb.
- / proc / driver : Thư mục này chứa thông tin về các trình điều khiển cụ thể mà hạt nhân sử dụng.
- / proc / fs : Thư mục này hiển thị hệ thống tệp nào được xuất. Nếu đang chạy máy chủ NFS, việc nhập cat / proc - / fs / nfsd / export sẽ hiển thị hệ thống tệp đang được chia sẻ và các quyền.
- / proc / irq : Thư mục này được sử dụng để đặt IRQ thành ái lực của CPU, cho phép hệ thống kết nối một IRQ cụ thể với chỉ một CPU. Ngoài ra, nó có thể loại trừ một CPU xử lý bất kỳ IRQ nào.
- / proc / self / net : Thư mục này cung cấp một cái nhìn toàn diện về các thông số và thống kê mạng khác nhau. Mỗi thư mục và tệp ảo trong thư mục này mô tả các khía cạnh của cấu hình mạng của hệ thống. Tệp / proc / net là một liên kết tượng trưng đến thư mục này.
- / proc / scsi : Tệp chính trong thư mục này là / proc / scsi / scsi, chứa danh sách mọi thiết bị SCSI được công nhận. Từ danh sách này, loại thiết bị, cũng như tên kiểu máy, nhà cung cấp, kênh SCSI và dữ liệu ID sẽ có sẵn.
- / proc / sys : Thư mục này khác với các thư mục khác trong / proc, bởi vì nó không chỉ cung cấp thông tin về hệ thống mà còn cho phép bạn bật và tắt các tính năng kernel ngay lập tức. Nếu một tệp có quyền ghi, nó có thể được sử dụng để cấu hình hạt nhân. Việc thay đổi giá trị trong tệp / proc / sys / được thực hiện bằng cách lặp lại giá trị mới vào tệp. Ví dụ: để thay đổi tên máy chủ thành www.example.com:

- / proc / sys / dev : Thư mục này cung cấp các tham số cho các thiết bị cụ thể trên hệ thống.
- / proc / sys / fs : Thư mục này chứa các tùy chọn và thông tin liên quan đến các khía cạnh khác nhau của hệ thống tệp, bao gồm hạn ngạch, trình xử lý tệp và thông tin inode.
- / proc / sys / kernel : Thư mục này chứa nhiều tệp cấu hình khác nhau ảnh hưởng trực tiếp đến hoạt động của kernel.
- / proc / sys / net : Thư mục này chứa các thư mục con liên quan đến các chủ đề mạng khác nhau. Bạn có thể thay đổi các tệp trong các thư mục này để điều chỉnh cấu hình mạng trên hệ thống đang chạy.
- / proc / sysvipc : Thư mục này chứa thông tin về tài nguyên của Hệ thống V Interprocess Communication (IPC). Các tệp trong thư mục này liên quan đến các lệnh gọi IPC của Hệ thống V cho tin nhắn (msg), semaphores (sem) và bộ nhớ dùng chung (shm).
- / proc / tty : Thư mục này chứa thông tin về các thiết bị tty hiện có và đang được sử dụng trên hệ thống. Tệp trình điều khiển là danh sách các thiết bị tty hiện đang được sử dụng.
- file:/proc/swaps : Hoán đổi tên và kích thước ổ đĩa phân vùng, v.v.
- file:/proc/uptime : Thời gian hoạt động (thời gian trôi qua kể từ khi khởi động) cho cpus riêng lẻ
- file:/proc/version : Phiên bản Linux Kernel và trình biên dịch dùng để xây dựng
- file:/proc/version : Phiên bản Linux Kernel và trình biên dịch dùng để xây dựng
- file:/proc/vmstat : Thông tin chi tiết Bộ nhớ ảo, bao gồm lỗi trang, phạm vi, v.v.

Các thư mục được đánh số như 1, 4567, 2385, 112, 40, 41 … chính là các Process ID (PID) của những process đang chạy trong hệ thống. Mỗi thư mục sẽ chứa thông tin về process đó. Bạn có thể dùng lệnh “ps –ef” để liệt kê các process đang chạy và so sánh với tên các thư mục trên để biết thư mục nào chứa thông tin của process nào.

Một số process khi sử dụng lệnh ps -ef:
![anh5](https://image.prntscr.com/image/SYSDmLgcSFeYm9LLhZThNQ.png)

Tài liệu tham khảo 
- https://tldp.org/LDP/Linux-Filesystem-Hierarchy/html/proc.html

- https://www.thegeekdiary.com/understanding-the-proc-file-system/