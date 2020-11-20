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