# Tìm hiểu về câu lệnh nslookup trong Linux

## 1. Câu lệnh nslookup

nslookup (name server lookup) là một công cụ được sử dụng để thực hiện tra cứu DNS trong Linux. Nó được sử dụng để hiển thị chi tiết DNS, chẳng hạn như địa chỉ IP của một máy tính cụ thể, bản ghi MX cho một miền hoặc máy chủ NS của một miền. Về cơ bản câu lệnh nslookup khá giống với câu lệnh dig

nslookup có thể được sử dụng với 2 chế độ: interactive và non-interactive. Chế độ interactive cho phép bạn truy vấn máy chủ định danh để biết thông tin về các máy chủ và miền khác nhau hoặc in danh sách máy chủ trong một miền. Chế độ non-interactive cho phép bạn chỉ in tên và thông tin được yêu cầu cho máy chủ lưu trữ hoặc miền.

## 2. Chế độ interactive

Chế độ này được sử dụng khi dùng lệnh `nslookup` mà không thêm bất cứ tùy chọn nào:

![anh1](https://image.prntscr.com/image/Na-n4v9zTMirCB9c2UnLKg.png)

- Để tìm kiếm 1 địa chỉ IP của một domain nào đó, ta chỉ cần gõ domain đó ra:

![anh2](https://image.prntscr.com/image/2Dvsgs37SwOy1VbHWIjFUw.png)

- Để thực hiện việc tra cứu ngược DNS, ta gõ địa chỉ IP:

![anh3](https://image.prntscr.com/image/FqywvoQQRKOYmCPSjs9dPQ.png)

- Để kiểm tra một bản ghi MX, ta thiết lập tra cứu như sau:

![anh4](https://image.prntscr.com/image/l5qRryE8QsuggkdXLVuZEg.png)

- Để kiểm tra một bản ghi NS, ta cũng thiết lập tra cứu:

![anh5](https://image.prntscr.com/image/DtL7Rek5Q6WbA42uI7lumA.png)

## 3. Chế độ Non-interactive

Chế độ Non-interactive được sử dụng bằng cách gõ lệnh nslookup cùng với domain hoặc địa chỉ IP của máy chủ được tra cứu

![anh6](https://image.prntscr.com/image/JgLXQAcKTT_r-wryo2DFxg.png)

- Khác với chế độ interactive, để truy vấn một bản ghi bất kỳ (MX, NS, SOA,...), ta thêm cú pháp -query=[type]] vào câu lệnh. Ví dụ:

Tra cứu bản ghi MX:

![anh7](https://image.prntscr.com/image/dUxJyt4ASh6eoRmPoj8cqA.png)

Tra cứu bản ghi NS:

![anh8](https://image.prntscr.com/image/wrG24YEyTfOD7u8tmFfbNw.png)

Tra cứu một bản ghi SOA:

![anh9](https://image.prntscr.com/image/pdKGDoAJQSexcQYBLKiUWg.png)

Để tra cứu một bản ghi bất kỳ, ta thêm cú pháp type=any như sau:

![anh10](https://image.prntscr.com/image/3wYytANIT76HWONvkzMt5A.png)


# Tài liệu tham khảo
https://geek-university.com/linux/nslookup-command/