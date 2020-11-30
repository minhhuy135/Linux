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