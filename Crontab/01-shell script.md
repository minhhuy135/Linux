# Tạo mới một file shell script .sh

## 1 . Bây giờ bạn hãy đến thư mục /usr/local/bin và tạo một file tên là hello.sh bằng lệnh sau:

```
$ cd /usr/local/bin
$ sudo touch hello.sh

```
- Khi bạn tạo ra mặc định quyền của file này sẽ là -rw-r--r--, có nghĩa là với bạn thì chỉ có quyền đọc và viết, với user cùng group thì chỉ có đọc và những user khác cũng chỉ có đọc mà thôi. Bây giờ ta cần bổ sung quyền thực thi (execute) bằng lệnh sau.

```
chmod +x hello.sh

```

Ok, vậy là xong phần tạo file.

## 2. Khai báo file Shell Script

- Khai báo là đang sử dụng thể loại nào bằng cách bổ sung vào đầu file hello.sh một đoạn như sau:

```
	
#!/bin/sh

```
## 3. In ra màn hình chuỗi Hello World!

Bây giờ mình sẽ viết một lệnh in ra chuỗi Hello World.

Để in một giá trị ra màn hình thì ta dùng hàm echo value. Như vậy mình sẽ sửa file hello.sh lại như sau:

```
#!/bin/sh
echo "Hello World!"
```

## 4. Chạy chương trình

- bây giờ bạn hãy chạy đoạn code sau để xem kết quả nhé

```
sh hello.sh
```



