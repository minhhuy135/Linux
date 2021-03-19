# Lệnh cơ bản hệ thống

- `# exit` hoặc  `# logout`: thoát ra trạng thái đăng nhập
- `# reboot` : khởi động lại hệ thống
- `# ps` : kiểm tra các tiến trình đang chạy
- `# sleep <thoi_gian>` : cho hệ thống ngừng hoạt động trong 1 thời gian
- `# useradd <ten_user>` : Thêm 1 user vào hệ thống
- `# passwd  <ten_user>` : cập nhật mật khẩu cho user
- `# who` : cho biết user nào đang sử dụng hệ thống
- `# top` : tương tự như Task Manager của Window

![anh0](https://image.prntscr.com/image/hJKkS9bpQPyKYn7_-R87KA.png)
- Thêm 1 user để sử dụng quyền sudo: `# usermod -aG wheel <username>`
(quyền sudo được cấp quyền cao nhất cho user)

![anh1](https://image.prntscr.com/image/ZnSMObcOTciJeQHXjdmtBw.png)

- Đăng nhập 1 tài khoản user khác: `# su - <username>`

# Thao tác trên tập tin


- Lấy danh sách các file và thư mục hiện hành: `# ls` 
- Lấy danh sách file và thư mục chi tiết: `# ll` 
- Chuyển thư mục (change directory): `# cd`
    - `cd /duong/dan/tuyet/doi` : chuyển tới thư mục `/doi/`

![anh2](https://image.prntscr.com/image/gnmNer_JQU6w8y4eyo3UQA.png)

    - `cd` : chuyển về thư mục chính của người dùng
    - `cd A && ls` : chuyển tới thư mục A và hiện danh sách các file của nó.
    - `cd` -: chuyển về thư mục đang làm việc trước đó.
    - `cd ..` : chuyển về thư mục cha.

![anh3](https://image.prntscr.com/image/xP3FxZFER0OS5Wd3xPy6Tw.png)

- Tạo 1 thư mục mới: `# mkdir <ten_thu_muc>`
- Tạo 1 tập tin: `# touch <ten_tap_tin>` 
- Tạo 1 tập tin dạng text: `# echo "" >> ~/<tên_tập tin>` 
- Xóa tập tin: `# rm` 
    - `rm <ten_tep_tin>` : xóa 1 tập tin
    - `rm <tap_tin_1> <tap_tin_2>` ... : xóa nhiều tập tin
    - `rm /a/b/c/<tap_tin>` : xóa tập tin theo đường dẫn
    - `rm -i <ten_tep_tin>` : xóa có xác nhận

![anh4](https://image.prntscr.com/image/KLLm3a8aTq6Sf0FqIcnQmA.png)

    - `rm -f <ten_tap_tin>` : xóa không xác nhận

![anh5](https://image.prntscr.com/image/cAx2vSd0TAmYN7rbUp4cig.png)

    - `rm -I <ten_thu_muc>/file*` : xóa hàng loạt file có kiểu `file[...]`
- Xóa thư mục: `# rmdir`
    - `rmdir <ten_thu_muc>` hoặc `rm -d` : xóa 1 thư mục rỗng không chứa tệp tin nào
    - `rm -r <ten_thu_muc>` : xóa thư mục chứa các thư mục con và tập tin có xác nhận từng đối tượng.

- Mở tập tin: `# cat <tap_tin>`

- Khởi chạy trình soạn thảo Vi: 
    - Câu lệnh `vi <ten_file> `

![anh6](https://image.prntscr.com/image/cVizl7RRRRSj5I2cZPywHA.png)

    - Nếu file chưa tồn tại thì hệ thống sẽ tạo ra file đó.
    - Nhấn phím **I** (INSERT): chuyển sang trạng thái nhập văn bản.
    - Nhấn phím **Esc**: thoát khỏi trạng thái nhập
    - Nhập `:wq` (Để lưu sửa đổi file) hoặc `:q!` (Để thoát mà không lưu sửa đổi)
    
- Copy file: `# cp`
    - Copy file A thành file B tại thư mục hiện hành:
    ```
    # touch A.txt
    # cp A.txt B.txt

![anh7](https://image.prntscr.com/image/x0DToBFRQsywAUX2pILTwA.png)   
 
    ```
    - Copy nhiều file vào 1 thư mục khác:
    ```
    # mkdir lab
    # touch ./{A,B,C}.txt
    # touch ./{D,E}.exe
    # cp A.txt B.txt C.txt D.exe E.exe lab/
    ```

    - Copy file từ thư mục này sang thư mục khác:
    ```
    # cp /A/subA/fileA.txt B/subB/
    ```
    - Để xem thông tin quá trình copy, ta thêm -v: 
    ```
    # cp -v A.txt B.txt C.txt D.txt E.txt lab/
    `A.txt' -> `lab/A.txt'
    `B.txt' -> `lab/B.txt'
    `C.txt' -> `lab/C.txt'
    `D.txt' -> `lab/D.txt'
    `E.txt' -> `lab/E.txt'
    ```

    - Để giữ nguyên thuộc tính file khi copy ta thêm `-p`. Các thuộc tính giữ nguyên là: access time, modification date, user ID, group ID, file flag, file mode, access control lists.
    ```
    # cp -p /A/subA/fileA.txt B/subB/
    ```

- Copy thư mục: tương tự copy file. Ta thêm `-a` hoặc `-r`
    - `-r`: copy folder và file đệ quy, tức là copy toàn bộ thư mục hoặc file cấp con của thư mục được copy.
    - `-a`: bao gồm option `-r` và thực hiện việc duy trì các thuộc tính của file hoặc folder như file mode, ownership, timestamps, ...
- Copy không cho ghi đè file đang có: thêm `-n`
- Copy cho ghi đè file đang có không cần hỏi lại: thêm `-f`
- Xem thông tin trợ giúp về copy: `# man cp`

----

- So sánh 2 tệp tin hoặc 2 thư mục: `diff`
```
# diff -c file1.txt file2.txt
```

- Xác định kiểu file: 'file'
```
# file <đường_dẫn_tới file>
```
---




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

## 2. Các lệnh giải nén:
- `# tar -xvf filenen.tar -C /root/A`
- `# tar -xvf filenen.tar.gz -C /root/A`
- `# tar -xvf filenen.tar.bz2 -C /root/A`

## 3. Xem nội dung file nén:
- `# tar -tvf filenen.tar | more`
- `# tar -tvf filenen.tar.gz | more`
- `# tar -tvf filenen.tar.bz2 | more`

## 4. Bung 1 file bất kì trong file nén:
Bung `file /B/Cfile1.txt` duy nhất:
```
tar -xvf /A/filenen.tar /B/C/file1.txt
tar -zxvf /A/filenen.tar.gz /B/C/file1.txt
tar -jxvf /A/filenen.tar.bz2 /B/C/file1.txt
```


**Bung 1 nhóm file giống nhau :** 
Bung các file có đuôi `.txt` trong file nén `filenen.tar`
```
tar -xvf /A/filenen.tar --wildcards '*.txt'
```


## 5. Thêm file và folder vào file nén:
Chỉ áp dụng với file định dạng `.tar`.

- Thêm file `abc.txt` vào `filenen.tar`

`# tar -rvf filenen.tar abc.txt` 

- Thêm thư mục A vào `filenen.tar`

`# tar -rvf filenen.tar A` 

1. Kiểm tra phiên bản hệ điều hành Linux đang chạy
```
 # cat  /etc/centos-release
 ```

 2. Kiểm tra các ổ hiện tại trên hệ thống
 ```
 # fdisk -l

 ```
 ![anh11](https://image.prntscr.com/image/Js8L8McmRRGgbKFSI32eIg.png)

 3. Kiểm tra các phân vùng và mức độ sử dụng trên các phân vùng
 ``` 
 df -h
 ```
 ![anh12](https://image.prntscr.com/image/jMtWLLVNQuyHx1B1Z6W8-A.png)

 4. Kiểm tra số lượng CPU của VPS:
 ```
 # nproc

 ```
 5. Kiểm tra dung lượng RAM
```
# free -m

```
![anh13](https://image.prntscr.com/image/Db4mhtcUQ3WkiIPRfjpKtA.png)

6. Các lệnh xử lý file
```
[root@localhost ~]# cd /dir  - Di chuyển tới 1 thư mục dir

[root@localhost ~]# pwd - Hiển thi đường dẫn thư mục hiện hành

[root@localhost ~]# mkdir inet - Tạo 1 thư mục có tê inet

[root@localhost ~]# rm tesst.txt - Xóa 1 file test.txt

[root@localhost ~]# rm -rf  dir/ - Xóa toàn bộ thư mục dir và các file bên trong

[root@localhost ~]# mv dir1 dir2 - Đổi tên thư mục dir1 thành dir2

[root@localhost ~]# cp file1 file2 - Copy file 1 thành file 2

[root@localhost ~]# cat hautx.txt - Xem nội dung 1 file có tên hautx.txt

[root@localhost ~]# tail -f /var/log/message - Hiện nội dung của file message và cập nhật liên tục, khởi đầu với 10 dòng cuối.
```
8. Lệnh quản lý tiến trình
```
[root@localhost ~]# ps -ef| grep ..... Kiểm tra một tiến trình mong muốn đang hoạt động

 [root@localhost ~]# top -c - Hiển thị các tiến trình đang chạy.

 [root@localhost ~]# kill pid - Dừng ép 1 tiến trình đang chạy
 ```

 9. Quyền sử dụng tập tin
 ```
 [root@localhost ~]# chmod 755 hautx.txt - Phân quyền sử dụng tập tin hautx.txt

(Chú ý:Mỗi chữ số ứng với từng tài khoản có được bằng cách cộng các số sau: 4 – đọc (r); 2 – ghi (w); 1 – thực thi (x))

 [root@localhost ~]# chown hautx:hautx test.txt - Phân quyền sở hữu file test.txt cho user hautx

 [root@localhost ~]# chown -R hautx:hautx inet/ - Phân quyền sở hữu toàn bộ thư mục và các file; các thư mục inet
 ```