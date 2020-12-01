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