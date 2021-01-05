
# Làm việc với các thư mục
 ## 8.1 pwd (print working derectory)
- Mở giao diện dòng lệnh ( còn được gọi là thiết bị đầu cuối , nhập pwd để hiển thị thư mục hiện tại của bạn)

![anh1](https://image.prntscr.com/image/PND41w1DSISH6TkRp7UPIQ.png)

## 8.2 cd
- Thay đổi thư mục
có thể thay đổi thư mục hiện tại của mình bằng câu lệnh cd 

![anh2](https://image.prntscr.com/image/TxJiaJigQyyqRApgSIofMg.png)

## 8.2.1 cd ~
- Cũng là 1 phím tắt để quay lại thư mục chính của bạn " chỉ cần nhận cd mà không có mục tiêu thư mục sẽ đưa bạn ra thư mục chính

![anh3](https://image.prntscr.com/image/UbzK3fHlR0K3t0_Cwi6e9A.png)

## 8.2.2 cd ..
- Để đi đến thu mục mẹ " thư mục ngay trên thư mục hiện tại của bạn trong thư mục cây ) gõ cd ..

![anh4](https://image.prntscr.com/image/mTkPIKbnTcKFWD6561K9Tw.png)

## 8.2.3 cd -
- Khác với cd là chỉ cần gõ cd - để chuyển đến thư mục trước đó 

![anh5](https://image.prntscr.com/image/9RPPwUgBR9Ollpmx7NLEjQ.png)

## 8.3 Absolute and relative paths
"Đường dẫn tuyệt đối và tương đối"
- Bạn nên biết các đường dẫn tuyệt đối và tương đối trong cây tệp. Khi bạn nhập một đường dẫn
bắt đầu bằng dấu gạch chéo (/), thì gốc của cây tệp được giả định. Nếu bạn không bắt đầu con đường của mình
với một dấu gạch chéo, thì thư mục hiện tại là điểm bắt đầu giả định.
'''
- Ảnh chụp màn hình bên dưới trước tiên hiển thị thư mục / home / paul hiện tại. Từ bên trong này
thư mục, bạn phải gõ cd / home thay vì cd home để chuyển đến thư mục / home.

![anh6](https://image.prntscr.com/image/7Vncn7-hTpqkmHFNaFeeNg.png)

- Khi ở trong / home, bạn phải nhập cd huy13 thay vì cd / huy13 để vào thư mục con huy13 của thư mục / nhà hiện tại.

![anh7](https://image.prntscr.com/image/O_HkL8jCS7m-XrralLaLgg.png)

- Trong trường hợp thư mục hiện tại của bạn là thư mục gốc / "root", thì cả cd / home và cd home sẽ đưa bạn vào thư mục / home

![anh8](https://image.prntscr.com/image/lqT8arGhQtGM7dpqXNZVkQ.png)

## 8.4 path completion

- Phím tab có thể giúp bạn nhập đường dẫn mà không bị lỗi. Nhập cd / et theo sau là tab
phím sẽ mở rộng dòng lệnh thành cd / etc /. Khi gõ cd / Et sau đó là phím tab,
sẽ không có gì xảy ra vì bạn đã gõ sai đường dẫn (chữ E viết hoa).
Bạn sẽ cần ít lần gõ phím hơn khi sử dụng phím tab và bạn sẽ chắc chắn rằng mình đã nhập
đường dẫn là chính xác!

![anh9](https://image.prntscr.com/image/uXsUivsOSZq6iquHZLQZew.png)

#     Working with files
- Trong chương này, chúng ta học cách nhận dạng, tạo, xóa, sao chép và di chuyển tệp bằng cách sử dụng
các lệnh như tệp, chạm, rm, cp, mv và đổi tên.

# 8.6. mkdir
Tạo thư mục đang đứng 
```
#mkdir hoctap hochanh thuchanh
```
![anha](https://image.prntscr.com/image/U3cqFqdSRJ6VAdN00meLjg.png)

# 8.6.1 mkdir -v(verbose) <ten_thu_muc>
Tạo thư mục và hiển thị thông báo tạo thư mục.

![anhb](https://image.prntscr.com/image/HfrUfmVPRMaUUZI8NI9Hpw.png)

# 8.6.2 mkdir -p(parents)
Tạo thư mục kèm thư mục cha

![anhc](https://image.prntscr.com/image/qZzi9eQVRiWgnzKJeddRUg.png)

# 8.7. rmdir
xóa 1 thư mục rỗng

![anh16](https://image.prntscr.com/image/umtmA1ghSZmK9kfF1TZUgA.png)

# 8.7. rmdir -p
![anhaa](https://image.prntscr.com/image/neHDpJyVSOSUPi9Ex_AzrQ.png)
# 8.7.1 rm -r 
xóa thư mục chứa các thư mục con và tập tin có xác nhận từng đối tượng.

![anhab](https://image.prntscr.com/image/qugU_LCRQzmMjFc3rOJkNA.png)

 # 8.7.2 rm -rf (force)
xóa không xác nhận

![anhaab](https://image.prntscr.com/image/olaqIjYqTLun4rR_FT0Buw.png)

# 8.7.4 rm -i
nhắc nhở trước mỗi lần xoá 

# 8.7.4 rm -rd(dir) xoá bỏ các thư mục trống

# 8.7.5 rm -rv(verbose)
giải thích những gì đang được thực hiện

![anhop](https://image.prntscr.com/image/2-Njo4UAR__kONrErCP8pw.png)

# 8.8.0 Lệnh file
Lệnh file được sử dụng để xác định loại tệp.

![ak](https://image.prntscr.com/image/tNqan3hFTemgIR70JbXxJA.png)

# 8.8.1 file -b
Hiển thị kiểu file 1 cách đơn giản, ngắn gọn.

![an](https://image.prntscr.com/image/VYKlPTzGTpq_1JZh25HpCw.png)

# 8.8.2 file *
Hiển thị tất cả các loại file trong thư mục đang đứng:

![abn](https://image.prntscr.com/image/ZeEXPVAcRCC39cRYaTRrYA.png)

# 8.8.2 file -s
Hiển thị các loại tệp của tệp đặc biệt như các tệp trong /dev/ và /proc/

![ans](https://image.prntscr.com/image/JBvJoVaJSyqU6TbRcHT32Q.png)


# 9.4 touch
Dấu thời gian của file có loại:
- accesstime (
thời gian truy cập)
- modifytime (thời gian sửa đổi)
- changetime (thay đổi thời gian)
## 9.4.1 Tạo một tệp trống

![anh1](https://image.prntscr.com/image/lf-j9UK2TJez_Z5muzhqCA.png)

## 9.4.2. touch -t
- Lệnh cảm ứng có thể đặt một số thuộc tính trong khi tạo tệp trống. Bạn có thể xác định

![anh2](https://image.prntscr.com/image/WjxZFQpES0eDc_xrUtAMgg.png)

## 9.4.3. Thay đổi dấu thời gian
### touch -a <filename> :Thay đổi thời gian truy cập (acesstime) của file.

![anhs](https://image.prntscr.com/image/48pHUNQ_SnCWviMuPzYLpg.png)

`touch -m <filename>: Thay đổi thời gian sửa đổi (modifytime)`

# 9.4.4 touch -t YYYYMMDDHHMM <filename>

![anhhh](https://image.prntscr.com/image/lmn_t_u1TSmHQdCrCm5PJA.png)

## Xóa tệp 9.5 rm
- Xóa vĩnh viễn 

![anh3](https://image.prntscr.com/image/R5ct4PxfTAWQEhZChNkttg.png)

rm <tap_tin_1> <tap_tin_2> ... : xóa nhiều tập tin

rm /a/b/c/<tap_tin> : xóa tập tin theo đường dẫn

## 9.5.2. rm -i
Để tránh việc vô tình xóa tệp, bạn có thể nhập rm -i

## 9.5.3. rm -f

xóa không xác nhận
## 9.6. cp (sao chép và thư mục)
## 9.6.1. copy one file

Để sao chép một tệp, hãy sử dụng cp với một đối số nguồn và đích.

![anh4](https://image.prntscr.com/image/E5NV6TAuRpKqvAw2FKeJhg.png)

## 9.6.3. Copy File vào thư mục 
```
# cp <filename_1> <filename_2> ... <filename_n> <thư_mục_đích>
```
![anh5](https://image.prntscr.com/image/ntmL9XtLRYm2a09xAcGMvA.png)

## 9.6.4 Copy 1 Thư mục vào 1 Thư mục khác.
r - recursive : đệ quy
```
cp -r/-R <thư_mục_muốn_cop> <thư_mục_đích>
```
![anh6](https://image.prntscr.com/image/ZvLGRXKYTHyMkpE7kCGkuQ.png)

copy thư mục học tập file bên trong thư mục học tập sang , thư mục ngoại khóa


## 9.6.5 cp -i
i - interactive : tương tác

Hỏi lại người dùng có muốn ghi đè không khi có tệp trùng tên. Hoặc ghi đè nội dung của file đích.

![anh7](https://image.prntscr.com/image/Sj3Rg8xmRoGT9d_7oc6Jvg.png)

khi dùng câu lệnh cp -i như hình ta thấy các nội dung ở trong file danchoi.txt đã được chuyển sang file ducati.txt

## 9.6.6 cp -b
b - backup : sao lưu
Tạo bản sao lưu của tệp đích trong cùng thư mục với tệp khác và ở 1 định dạng khác.

![anh8](https://image.prntscr.com/image/L6Wc36mLTpKDYepbvgYtvQ.png)

khi dùng câu lệnh cp -b ta thấy đã tạo ra 1 file danthuong.txt~ file này chứa nội dung gốc , còn file danthuong.txt chứa nội dung của file danchoi.txt

## 9.6.7 cp -p
p - preserve : bảo quản
Khi sử dụng -p, lệnh cp sẽ bảo toàn các đặc điểm sau của tệp nguồn: timestamp, quyền sở hữu

![anh9](https://image.prntscr.com/image/62PYVtUjTMC8lVHLv7DQtg.png)

ta thấy khi sử dụng cp -p thì quyề sở hữu vẫn được dữ nguyên và ngày giờ cũng được giữ nguyên theo file xedap.txt

## 9.6.8 cp -n
n - no clobber

Không ghi đè lên tệp hiện có.

![anh10](https://image.prntscr.com/image/3j5lhk_qStWhZQPsxuM51w.png)



## 9.6.9 cp -v
-v - verbose : Xem quá trình


![anh11](https://image.prntscr.com/image/RzyZlCZsRLud3qOu8r3NOg.png)








# 9.7. mv
## 9.7.1. đổi tên tệp bằng mv

Sử dụng mv để đổi tên tệp 

![anh6](https://image.prntscr.com/image/Sax9vs8WTJ_U9-bRys5kaw.png)

hoặc di chuyển tệp sang thư mục khác

![anh7](https://image.prntscr.com/image/8p22-Ka8THyvlPXSkP2Sdg.png)

# 9.7.2. đổi tên thư mục bằng mv

1. mv - move(rename) file : được sử dụng để di chuyển một hoặc nhiều tệp hoặc thư mục từ nơi này sang nơi khác trong hệ thống tệp như UNIX. Nó có hai chức năng riêng biệt:

- Đổi tên 1 file hoặc thư mục
- Di chuyển 1 nhóm các tệp tin vào thư mục khác.

Đổi tên file, thư mục
```
# mv <ten_hien_tai> <ten_moi>
```
![anh8](https://image.prntscr.com/image/mL62-M_vTh_IxhriEvqSuA.png)

2. mv -i
i - Interactive : Tương tác

Xác nhận di chuyển và ghi đè lên 1 tệp tin hiện có.

![anh9](https://image.prntscr.com/image/8Ax5W0wSQm_nf6FsdyuIAg.png)


3. mv -f
f - Force : ép buộc

mv sẽ nhắc xác nhận ghi đè tệp đích nếu tệp đích được bảo vệ ghi, tức là ta không có quyền ghi lên tập đích. -f sẽ cho bạn ghi đè tệp đích và xóa tệp nguồn.

![anh10](https://image.prntscr.com/image/8GE2MoMYRQmxB72Eoi-uQw.png)

4. mv -n 

no clobber : với option này sẽ ngăn không cho ghi đè 1 tệp hiện có.

![anh11](https://image.prntscr.com/image/1SFlcxzYS_GBcfT_PuzUhA.png)

5. mv -b
b -backup : tạo 1 bản lưu trữ tệp tin sẽ bị ghi đè
![anh12](https://image.prntscr.com/image/1MeezGBDTkKIXOrC70oq1w.png)

# 9.7.3 Lệnh rename
Thường được dùng để đổi tên file được đặt tên theo biếu thức. Thường dùng để đổi tên hàng loạt các file có tên cấu trúc gần giống nhau.
```
# rename [options] 
```