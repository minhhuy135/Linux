
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
Tạo 1 thư mục

![anh15](https://image.prntscr.com/image/icJgncldSwGN2HHuXlnSRw.png)

# 8.7. rmdir
xóa 1 thư mục

![anh16](https://image.prntscr.com/image/umtmA1ghSZmK9kfF1TZUgA.png)

# 9.4 touch
## 9.4.1 Tạo một tệp trống

![anh1](https://image.prntscr.com/image/lf-j9UK2TJez_Z5muzhqCA.png)

## 9.4.2. touch -t
- Lệnh cảm ứng có thể đặt một số thuộc tính trong khi tạo tệp trống. Bạn có thể xác định

![anh2](https://image.prntscr.com/image/WjxZFQpES0eDc_xrUtAMgg.png)

## 9.5 rm
- Xóa vĩnh viễn 

![anh3](https://image.prntscr.com/image/R5ct4PxfTAWQEhZChNkttg.png)

## 9.5.2. rm -i
Để tránh việc vô tình xóa tệp, bạn có thể nhập rm -i

## 9.5.3. rm -rf

- Theo mặc định, rm -r sẽ không xóa các thư mục không trống. Tuy nhiên rm chấp nhận một số
các tùy chọn sẽ cho phép bạn xóa bất kỳ thư mục nào. Câu lệnh rm -rf nổi tiếng vì
nó sẽ xóa bất kỳ thứ gì (với điều kiện bạn có quyền làm như vậy). Khi bạn là
đã đăng nhập với quyền root, hãy rất cẩn thận với rm -rf (f có nghĩa là lực và r có nghĩa là đệ quy)
vì là root ngụ ý rằng các quyền không áp dụng cho bạn. Bạn có thể xóa
tình cờ toàn bộ hệ thống tệp
## 9.6. cp
## 9.6.1. copy one file

Để sao chép một tệp, hãy sử dụng cp với một đối số nguồn và đích.

![anh4](https://image.prntscr.com/image/E5NV6TAuRpKqvAw2FKeJhg.png)

## 9.6.3. cp -r

Để sao chép các thư mục hoàn chỉnh, hãy sử dụng cp -r (tùy chọn -r buộc sao chép đệ quy tất cả các tệp
trong tất cả các thư mục con)

![anh2](https://image.prntscr.com/image/0r0nnMbuQNulS69R5zIaCA.png)

## 9.6.5. cp -i

Để ngăn cp ghi đè lên các tệp hiện có, hãy sử dụng tùy chọn -i (để tương tác).

![anh5](https://image.prntscr.com/image/v_fstxzgTCueHQkL4uQqzg.png)


# 9.7. mv
## 9.7.1. đổi tên tệp bằng mv

Sử dụng mv để đổi tên tệp 

![anh6](https://image.prntscr.com/image/Sax9vs8WTJ_U9-bRys5kaw.png)

hoặc di chuyển tệp sang thư mục khác

![anh7](https://image.prntscr.com/image/8p22-Ka8THyvlPXSkP2Sdg.png)
# 9.7.2. đổi tên thư mục bằng mv

Lệnh mv tương tự có thể được sử dụng để đổi tên các thư mục

![anh8](https://image.prntscr.com/image/fMdFeUttR-i5VHh_PDKjAw.png)


# 9.8.3. rename on CentOS/RHEL/Fedora
Thay đổi tên tệp tên thư mục
(* thay đổi tất cả các tệp)

![anh18](https://image.prntscr.com/image/VAQFO_FVSPqWXb-asSfvfA.png)

# 10.3. cat
Hiển thị tập tin lên màn hình dùng để truy cập vào tệp tin

![anh19](https://image.prntscr.com/image/_AK44FpkTMm2h3EtUAefsQ.png)

# 10.4. tac
Hiển thị tệp tin lên màn hình nhưng ngược lại với cat

![anh19](https://image.prntscr.com/image/kx31mvtMQEOhNePFDT2pSg.png)