# Process( Qui trình)

## 1. Tổng quan

- Tất cả các chương trình trong Unix thực chất đều là các processes: terminal bạn chạy, vim, hay bất cứ lệnh nào bạn gõ vào terminal. Process chính là đơn vị cấu thành nên Unix. Nói cách khác mỗi dòng code của bạn, sẽ được thực thi trên một process.

### Unix cung cấp tool `ps` để list ra tất cả các *process* đang chạy trên hệ thống:

Mình chạy lênh `ps` và show ra các thuộc tính `opid,ppid,user,rss,command` của *process*:

`ps -e -opid,ppid,user,rss,command`

<img src = "https://i.imgur.com/jzdZeSh.png">
`ps` có rất nhiều option để chạy, nếu bạn muốn hiểu chỉ tiết, hãy sử dụng `man ps` để biết thêm

Ngoài ra lệnh `ps` cũng cho chúng ta thấy, mỗi một *Process* sẽ có một *Process ID*, và thuộc về một *Process* cha nào đó. *Process ID* là duy nhất đối với mỗi một *process*, tức là 2 *process* khác nhau chắc chắn phải có **PID** khác nhau. Ngoài ra *Process ID* là không thể thay đổi trong khi chạy *process*.

### Có thể sử dụng lệnh `top` để xem **live** các *process* đang chạy:

<img src = "https://i.imgur.com/iqZ9nbA.png">

- Dòng đầu tiên của `top` hiển thị một bản tóm tắt nhanh chóng về những gì đang xảy ra trong hệ thống :
    - Hệ thống đã hoạt động được bao lâu rồi
    - Có bao nhiêu người dùng đang đăng nhập
    - Trung bình tải

- Dòng thứ hai của `top` hiển thị tổng số quá trình, số lượng quá trình chạy, ngủ, dừng và zombie. Nhằm đánh giá xem hệ thống có đang hoạt động hiệu quả hay không.


    | Number | Name | Meanings |
    |--------|------|----------|
    | 0.1 | **top** |  Cho biết thời gian `uptime` ( từ lúc khởi động ) cũng như số người dùng thực tế đang hoạt động. |
    | 0.2 | **Tasks** | thống kê về số lượng tiến trình, bao gồm tổng số tiến trình ( total ) , số đang hoạt động ( running ), số đang ngủ/chờ ( sleeping ) , số đã dừng ( stopped ) và số không thể dừng hẳn ( zombie ). |
    | 0.3 | **%Cpu(s)** | cho biết thông tin về CPU |
    | 0.4 | **KiB Mem** | cho biết thông tin về RAM |
    | 0.5 | **KiB Swap** | cho biết thông tin về Swap |
    | 1 | **PID** | Process ID |
    | 2 | **USER** | người dùng thực thi |
    | 3 | **PR** | độ ưu tiên của **process** |
    | 4 | **NI** |
    | 5 | **VIRT** |
    | 6 | **RES** |
    | 7 | **SHR** | 
    | 8 | **S** | 
    | 9 | **%CPU** | tỉ lệ sử dụng CPU của **process** |
    | 10 | **%MEM** | tỉ lệ sử dụng RAM của **process** |
    | 11 | **TIME+** | thời gian sử dụng CPU , giống như **TIME** nhưng phản ánh mức độ chi tiết hơn qua một phần trăm giây .
    | 12 | **COMMAND** | Lệnh mà bắt đầu **process** này |

<img src=https://image.prntscr.com/image/FJZ4NSKcQk_0YnjDCvIL1g.png>

- Chú thích:
    | Number | Name | Meanings |
    |--------|------|----------|
    | 1 | **UID** | **UID** mà **process** này thuộc về ( người chạy nó )|
    | 2 | **PID** | Process ID |
    | 3 | **PPID** | Process ID gốc ( ID của **process** mà bắt đầu nó )|
    | 4 | **C** | CPU sử dụng của **process** |
    | 5 | **STIME** | Thời gian bắt đầu **process** |
    | 6 | **TTY** | Kiểu terminal liên kết với **process** |
    | 7 | **TIME** | Thời gian CPU bị sử dụng bởi **process** |
    | 8 | **CMD** | Lệnh mà bắt đầu **process** này |

## 2. Sơ đồ pstree
- Lệnh `pstree` hiển thị các quy trình đang chạy trên hệ thống dưới dạng sơ đồ cây thể hiện mối quan hệ giữa một quy trình và quy trình mẹ của nó và bất kỳ quy trình nào khác mà nó tạo ra.
Nếu chưa cài đặt psmisc thì sẽ không thể thực hiện lệnh pstree.
- Ta cài đặt 1 cách đơn giản như sau:
    ```
    # yum install -y psmisc
    ```
<img src=https://image.prntscr.com/image/jnAf0OVZRo2yAEsbywknfw.png>
