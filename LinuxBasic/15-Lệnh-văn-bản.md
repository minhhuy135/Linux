# Text Commands

Linux cung cấp các tiện ích cho thao tác tập tin và văn bản như sau:

|Tiện ích|Lệnh|
|-|-|
|Hiển thị nội dung|`cat` và `echo`|
|Chinh sửa nội dung|`sed` và `awk`|
|Tìm theo mẫu|`grep`|

# 1. Hiển thị nội dung
Lệnh cat là viết tắt của "concatenate" được sử dụng để đọc và in ra nội dung của file. tac là lệnh ngược lại của cat có chức năng là đọc và in ra nội dung file theo chiều đảo ngược lại:

![anh1](https://image.prntscr.com/image/ftPRXiDVQ92MQOLRXEx-8w.png)

Lệnh echo là lệnh hiển thị text lên màn hình:

![anh2](https://image.prntscr.com/image/fN9rstw8QyO2d7LFFw4IyQ.png)

Ngoài ra, ta có thể in ra giá trị của biến: # echo $<biến>


![anh3](https://image.prntscr.com/image/pDo0gMK1QUKA7sJ6gSHs9Q.png)

# 2. Chỉnh sửa nội dung file
## Lệnh sed
Là 1 công cụ xử lí văn bản mạnh mẽ, viết tắt của "stream editor". Nó sẽ lọc văn bản cũng như thực hiện thay thế trong luồng dữ liệu. Dữ liệu từ nguồn (hoặc luồng) được lấy và di chuyển vào không gian xử lý. Toàn bộ danh sách các thao tác, sửa đổi được áp dụng lên dữ liệu trong không gian xử lý, nội dung cuối cùng được chuyển đến không gian đầu ra tiêu chuẩn (hoặc luồng).

Ví dụ : Thay đổi nội dung file



![anh4](https://image.prntscr.com/image/jvVmyg2YSg6R-3wncXIFWw.png)

Ví dụ : Xóa 1 dòng

![anh5](https://image.prntscr.com/image/KxzhODp-RwGNucVCsHoJJw.png)

## Lệnh awk

Được sử dụng để trích xuất và sau đó in nội dung cụ thể của tệp và thường được sử dụng để xây dựng báo cáo. Nó là một tiện ích mạnh mẽ và là ngôn ngữ thông dịch, được sử dụng để thao tác với tệp dữ liệu, truy xuất và xử lý văn bản. Nó hoạt động tốt với các trường (chứa 1 mẩu dữ liệu, thực chất là một cột) và ghi lại (1 tập hợp các trường, thực chất là 1 dòng trong file).

![anh6](https://image.prntscr.com/image/Ln07yyaHSYydTc68votgtg.png)

Lệnh sort
Được sử dụng để sắp xếp lại các dòng của tệp văn bản theo thứ tự tăng dần hoặc giảm dần, theo 1 tiêu chuẩn nào đó(sort key).

![anh7](https://image.prntscr.com/image/4pAOFKiPQw6P8v8W8aT_jg.png)

## Lệnh uniq

Dùng để xóa các dòng trùng lặp trong tệp văn bản. Nó đòi hỏi các mục trùng lặp phải được loại bỏ liên tiếp.

![anh8](https://image.prntscr.com/image/CFoseVScTi_pYkoNvKd9TQ.png)

## Lệnh paste

Dùng để kết hợp các trường(fields) từ các file khác nhau.

![anh9](https://image.prntscr.com/image/SRa28zWeS8qHa8tdeZaeEA.png)

## Lệnh join

Dùng để kết hợp 2 file với nhau theo 1 trường chung

![anh10](https://image.prntscr.com/image/czSRON2nToOjfJydAauCEQ.png)

# 3. Tìm theo mẫu
## Lệnh grep

Được sử dụng rộng rãi như một công cụ tìm kiếm văn bản chính. Nó quét các tệp cho các mẫu chỉ định và có thể được sử dụng với các biểu thức thông thường.

![anh11](https://image.prntscr.com/image/M3_yVq77QvmVuxleDtg-jw.png)

Lệnh tr

Được sử dụng để dịch các kí tự được chỉ định sang kí tự khác hoặc xóa chúng đi.

![anh12](https://image.prntscr.com/image/gaYYZ45aQQ2sE6SzNmslXg.png)

## Lệnh tee

Lệnh này sẽ lấy đầu ra của bất kì lệnh nào và trong lúc gửi ra đầu ra tiêu chuẩn, nó sẽ lưu vào 1 file

![anh13](https://image.prntscr.com/image/FFTXk4PRTK_24ql9HLa-qA.png)

## Lệnh wc(Word count)

Lệnh này đếm số lượng dòng(-l), từ(-w) và ký tự(-c) trong một tệp hoặc danh sách các tệp.

![anh14](https://image.prntscr.com/image/mOQ6juRER62iI4E8ZvdIkA.png)

## Lệnh cut

Sử dụng để trích xuất các cột trong tệp. Dấu phân cách cột mặc định sẽ là kí tự tab, hoặc có thể được tùy chỉnh bằng câu lệnh 

![anh15](https://image.prntscr.com/image/RmxToQuiRkWnYQumGUd4Mw.png)

## Lệnh head

In ra vài dòng đầu tiên của file(mặc định là 10). Có thể thay đổi được qua option -n số_dòng

![anh16](https://image.prntscr.com/image/lqwdeC0tQES9hshTR1N1Wg.png)

## Lệnh tail
In ra vài dòng cuối cùng của file(mặc định là 10). Có thể thay đổi được qua option -n số_dòng

![anh17](https://image.prntscr.com/image/IlIZurm-QlKDJHM4FTWHrA.png)