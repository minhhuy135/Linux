# Crontab là gì?
Cron là một cách để tạo và chạy các lệnh theo một chu kỳ xác định. Đây là tiện ích giúp lập lịch trình để chạy những dòng lệnh bên phía server nhằm thực thi một hoặc nhiều công việc nào đó theo thời gian được lập sẵn.
 


## Crontab làm việc như thế nào?

Một cron schedule đơn giản là một text file. Mỗi người dùng có một cron schedule riêng, file này thường nằm ở /var/spool/cron . Crontab files không cho phép bạn tạo hoặc chỉnh sửa trực tiếp với bất kỳ trình text editor nào, trừ phi bạn dùng lệnh crontab.


Một số lệnh thường dùng:
```
crontab -e: tạo hoặc chỉnh sửa file crontab 
Bash

crontab -l: hiển thị file crontab 
Bash

crontab -r: xóa file crontab
```

- Hầu hết tất cả VPS đều được cài đặt sẵn crontab, tuy nhiên vẫn có trường hợp VPS không có. Nếu bạn sử dụng lệnh crontab -l mà thấy output trả lại -bash: crontab: command not found thì cần tự cài crontab thủ công.

# Cách cài đặt Crontab

Sử dụng lệnh:

```
yum install cronie
```
Start crontab và tự động chạy mỗi khi reboot:

```
service crond start 

chkconfig crond on
```

# Một số ứng dụng phổ biến của cron

Tôi thường sử dụng cron để lên lịch cho những việc gần như là hiển nhiên. Chẳng hạn như phải đều đặn backup mỗi ngày vào 2 giờ sáng.

Giờ hệ thống (tức là giờ hệ điều hành) trên các máy tính của tôi hiện đang sử dụng Network Time Protocol (NTP). Mặc dù NTP đặt thời gian hệ thống, nó lại không đặt thời gian phần cứng. Do đó, tôi sử dụng cron để đặt thời gian phần cứng dựa trên thời gian hệ thống.

Bên cạnh đó, tôi cũng có một chương tình Bash chạy mỗi sáng sớm. Chương trình này tạo ra một “message of the day” (MOTD) trên mỗi máy tính. Tin nhắn này sẽ chứa các thông tin, chẳng hạn như disk usage, thường phải được cập nhật thường xuyên.

Nhiều quy trình và dịch vụ hệ thống, như Logwatch, Iogrotate, hay Rootkit Hunter, đều sử dụng cron để lên lịch các task và chạy chương trình mỗi ngày.


- Nói sơ qua về cách vận hành của cron, trước hết ta nên biết crond daemon là một dịch vụ chạy background enable các chức năng của cron.

Dịch vụ cron sẽ check các file trong thư mục /var/spool/cron và /ect/cron.d, và file /etc/anacrontab. Các file này chứa nội dung xác định các công việc mà cron phải chạy trong những khoảng thời gian khác nhau. File cron của người dùng cá nhân được đặt trong /var/spool/cron. Các dịch vụ và ứng dụng hệ thống thường sẽ thêm các file công việc của cron vào /etc/cron.d.

# Cách sử dụng crontab Linux

Cron hoạt động dựa trên các lệnh được chỉ định trong cron table (crontab). Mỗi người dùng, kể cả root, đều có thể có một file cron. Các file này theo mặc định sẽ không tồn tại. Nhưng ta có thể tạo nó trong thư mục /var/spool/cron bằng cách dùng lệnh crontab -e. Ngoài ra, lệnh này cũng có thể được dùng để chỉnh sửa một file cron. Chúng tôi khuyên bạn không nên các sử dụng trình editor tiêu chuẩn (như Vi, Vim, Emacs, Nano,…). Bởi vì sử dụng lệnh crontab không chỉ cho phép bạn chỉnh sửa lệnh, nó còn khởi động lại crond daemon khi ta lưu và thoát trình editor. Lệnh crontab sử dụng Vi làm editor cơ bản của nó, vì Vi luôn luôn khả dụng.

Các file cron sẽ trống, nên các lệnh phải được thêm từ đầu. Dưới đây là một ví dụ về định nghĩa các công việc trong file cron:

Ví dụ:
```
# crontab -e
SHELL=/bin/bash
MAILTO=root@example.com
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin

# For details see man 4 crontabs

# Example of job definition:
# .---------------- minute (0 - 59)
# |  .------------- hour (0 - 23)
# |  |  .---------- day of month (1 - 31)
# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  * user-name  command to be executed

# backup using the rsbu program to the internal 4TB HDD and then 4TB external
01 01 * * * /usr/local/bin/rsbu -vbd1 ; /usr/local/bin/rsbu -vbd2

# Set the hardware clock to keep it in sync with the more accurate system clock
03 05 * * * /sbin/hwclock --systohc

# Perform monthly updates on the first of the month
# 25 04 1 * * /usr/bin/dnf -y update

```

Ba dòng đầu tiên có nhiệm vụ thiết lập một môi trường mặc định. Môi trường phải được thiết lập phù hợp với nhu cầu của người dùng. Bởi vì cron không cung cấp một môi trường cụ thể nào cả. Biến SHELL chỉ định shell để sử dụng khi các câu lệnh được thực thi. Trong ví dụ này, shell Bash được chỉ định. Biến MAILTO đặt địa chỉ mail nhận các kết quả của cron job. Các mail này có thể cung cấp trạng thái của các cron job (backup, update…). Đồng thời bao gồm cả output mà người dùng muốn khi chạy chương trình thủ công từ cmd. Dòng thứ ba có nhiệm vụ thiết lập PATH cho môi trường.

Có khá nhiều dòng comment ở ví dụ trên. Chúng trình bày chi tiết các cú pháp cần thiết để xác định một cron job. Dưới đây là thông tin cụ thể về từng dòng lệnh:


```
01 01 * * * /usr/local/bin/rsbu -vbd1 ; /usr/local/bin/rsbu -vbd2

```
Dòng này trong /etc/crontab sẽ chạy một script, thực hiện backup hệ thống.

- Tiếp theo

Dòng lệnh này sẽ chạy script trong shell Bash, rsbu, có nhiệm vụ backup tất cả các hệ thống vào 1:01 a.m hằng ngày (01 01). Dấu * nằm ở vị trí ba, bốn và năm của phần thời gian cũng tương tự như các file glob hay wildcard, dùng cho các phân chia thời gian khác. Cụ thể, chúng chỉ định “mỗi ngày trong tháng”, “mỗi tháng”, và “mỗi ngày trong tuần”. Dòng này sẽ chạy backup hai lần. Một lần backup vào ổ cứng backup chuyên dụng ở trong. Lần thứ hai sẽ backup vào một USB drive ở ngoài.

Tiếp theo, dòng lệnh này đặt thời gian phần cứng trên máy tính bằng cách sử dụng thời gian hệ thống làm gốc. Dòng này được thiết lập để chạy vào 5:03 a.m hằng ngày

```
03 05 * * * /sbin/hwclock --systohc
```
Dòng cron job cuối cùng có thể được sử dụng để cập nhật dnf hay yum vào 04: 25 a.m vào ngày đầu tiên của mỗi tháng. Tuy nhiên, nó đã được đặt thành một comment ở ví dụ trên. Cho nên nó sẽ không còn chạy nữa.’

```
# 25 04 1 * * /usr/bin/dnf -y update

```

# Một số mẹo trong việc lên lịch với crontab Linux

Đầu tiên, giả sử bạn muốn chạy một job nào đó vào 3 giờ chiều, mỗi thứ Ba:
```
00 15 * * Thu /usr/local/bin/mycronjob.sh

```
Câu lệnh này sẽ thực hiện mycronjob.sh mỗi 3 p.m thứ Ba.

Hay ta cũng có thể chạy các báo cáo theo mỗi quý, sau khi kết thúc từng quý. Mặc dù cron không có tùy chọn cho “Ngày cuối cùng của tháng”, ta có thể sử dụng ngày đầu tiên của tháng tiếp theo, như ở dưới.

```
02 03 1 1,4,7,10 * /usr/local/bin/reports.sh
```
Cron job này chạy các báo cáo mỗi quý vào ngày đầu tiên của tháng, sau khi kết thúc một quý.

Câu lệnh dưới đây cho job chạy trong vòng một phút, mỗi giờ một lần, từ 9:01 a.m đến 5:01 p.m.

```
01 09-17 * * * /usr/local/bin/hourlyreminder.sh

```
Đôi khi, có những job cần được thực hiện sau mỗi 2, 3 hay 4 giờ. Khi đó, ta có thể lấy thương số của giờ và khoảng thời gian mong muốn. Chẳng hạn như */3, tương đương với job sau mỗi ba giờ. Hay 6-18/3 để chạy mỗi ba tiếng, từ 6 a.m đến 6 p.m. Các khoảng thời gian khác cũng có thể được chia tương tự. Lấy ví dụ, biểu thức */15 ở vị trí phút có nghĩa là “chạy job sau mỗi 15 phút”.

```
*/5 08-18/2 * * * /usr/local/bin/mycronjob.sh

```

Có một điều cần lưu ý: Các biểu thức chia phải cho ra kết quả có phần dư bằng 0, khi đó job mới có thể chạy. Do đó, trong ví dụ này, job được thiết lập để chạy năm phút 1 lần (08:05, 08:10, 08:15,…) trong các giờ chẵn từ 8 a.m đến 6 p.m, nhưng không chạy trong các giờ lẻ. Lấy ví dụ, job sẽ không chạy từ 9 p.m đến 9:59 a.m.

# Shortcut trong crontab Linux

File /etc/anacrontab ở trên cho ta thấy cách các shortcut (phím tắt) có thể được sử dụng, chỉ định một số thời gian phổ biến. Các shortcut thời gian này có thể thay thế đến 5 trường thường dùng để chỉ định thời gian. Kí tự @ dùng để xác định shortcut cho cron. Bên dưới là danh sách một số shortcut và ý nghĩa của chúng:

- @reboot : Chạy sau khi reboot.
- @yearly : Chạy hàng năm, ví dụ: 0 0 1 1 *
- @annually : Chạy hàng năm, ví dụ: 0 0 1 1 *
- @monthly : Chạy hàng tháng, ví dụ: 0 0 1 * *
- @weekly : Chạy hàng tuần, ví dụ: 0 0 * * 0
- @daily : Chạy hàng ngày, ví dụ: 0 0 * * *
- @hourly : Chạy mỗi giờ, ví dụ: 0 * * * *
Các shortcut này có thể được sử dụng trong nhiều file crontab Linux khác nhau, chẳng hạn như trong /etc/cron.d.