# Thao tác tệp tin
- `# useradd <ten_user>` : Thêm 1 user vào hệ thống

![anh1](https://image.prntscr.com/image/NamEACb6TUe3a5P9YpFoWg.png)
- `# passwd  <ten_user>` : cập nhật mật khẩu cho user
- Đăng nhâp 1 tài khoản user khác :#su <'username'>
- Tạo 1 thư mục mới: `# mkdir <ten_thu_muc>`

![anh2](https://image.prntscr.com/image/kjqyqqnCTv6_WrFAnybl9A.png)
- Tạo 1 tập tin: `# touch <ten_tap_tin>`
để kiểm tra dùng lệnh
- Lấy danh sách các file và thư mục hiện hành: `# ls` 
- Lấy danh sách file và thư mục chi tiết: `# ll

![anh3](https://image.prntscr.com/image/FxCADDKRQe_1CfTSo10LLg.png)
- Tạo 1 tập tin dạng text: `# echo "" >> ~/<tên_tập tin>` 
echo chỉ có quyền thêm vào tệp tin 

![anh4](https://image.prntscr.com/image/o3Xq9XEPSmWLTC_0qaMTpQ.png)
- Khởi chạy trình soạn thảo Vi: lệnh vi có quyền sửa xóa
    - Câu lệnh `vi <ten_file> `
    - Nếu file chưa tồn tại thì hệ thống sẽ tạo ra file đó.
    - Nhấn phím **I** (INSERT): chuyển sang trạng thái nhập văn bản.
    - Nhấn phím **Esc**: thoát khỏi trạng thái nhập
    - Nhập `:wq` (Để lưu sửa đổi file) hoặc `:q!` (Để thoát mà không lưu sửa đổi)

![anh5](https://image.prntscr.com/image/h6gXQ3y1R9um_NkdjTOHjA.png)

- Mở tập tin: `# cat <tap_tin>`
- Xóa tập tin: `# rm` 
    - `rm <ten_tep_tin>` : xóa 1 tập tin
    - `rm <tap_tin_1> <tap_tin_2>` ... : xóa nhiều tập tin
    - Xóa thư mục: `# rmdir`
    - `rmdir <ten_thu_muc>` hoặc `rm -d` : xóa 1 thư mục rỗng
     Copy file: `# cp`
    - Copy file A thành file B tại thư mục hiện hành:
    ```
    # touch A.txt
    # cp A.txt B.txt 

![anh6](https://image.prntscr.com/image/8_WGtE6fRWydrNLIiKWfYw.png)
    '''
 - Đăng nhâp vào thu mục hoặc user : #cd<'tên thư mục hoặc tên user'>

 ![anh7](https://image.prntscr.com/image/UrXn3Q8jSQWAmP7tIQrjIA.png)
 - Chuyển các tệp vào thư mục : #mv <'tên tệp'> <'tên thư mục'>

![anh8](https://image.prntscr.com/image/02rse4jTSA_Ai2TADN09bA.png)
# Lệnh nén và giải nén

- Các option dùng với lệnh `tar`
    - `c` : tạo file nén .tar.
    - `x` : bung file nén .tar.
    - `v` : show quá trình nén hoặc giải nén dữ liệu ra màn hình.
    - `f` : chỉ định nén thành file.
    - `t` : Xem dữ liệu trong file nén.
    - `j` : tạo file nén với bzip2 có định dạng file.tar.bz2
    - `z` : tạo file nén với gzip có định dạng file.tar.gz.
    - `r` : thêm một file và thư mục vào file nén đã tồn tại.
    - `--wildcards` : tìm và xuất file bất kỳ trong file nén.
    ## 1. Các lệnh nén:
- Nén file/thư mục sang định dạng ".tar": `# tar -cvf`

    - `# tar -cvf filenenA.tar /root/A` : nén thư mục A thành file nén `filenenA.tar` và show quá trình nén.

-  Nén file/thư mục sang định dạng ".tar.gz": `# tar -cvzf`
    - `# tar -cvzf filenenA.tar.gz /root/A`

- Nén định dạng ".tar.bz2": `# tar -cvjf`
    - `# tar -cvjf filenenA.tar.gz /root/A`

Nếu cùng 1 dữ liệu thì tỉ lệ nén cao nhất là:  `.tar.bz2 > .tar.gz > .tar` 

![anh9](https://image.prntscr.com/image/9dgMMaZGQ5mQW45xpVsKCQ.png)
## 2. Các lệnh giải nén:
- `# tar -xvf filenen.tar -C /root/A`
- `# tar -xvf filenen.tar.gz -C /root/A`
- `# tar -xvf filenen.tar.bz2 -C /root/A`

![anh10](https://image.prntscr.com/image/kYjN1i6AQa6qsxUxA1FAhw.png)

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