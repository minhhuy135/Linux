# Biến (Variables) trong Shell Script

## 1. Đặt tên biến

Tên biến chỉ chứa các ký tự từ a-z, các số từ 0-9 và ký tự gạch dưới _. Bạn có thể dùng chữ in hoa hoặc in thường, tuy nhiên người ta quy ước nên đặt chữ in hoa vì nó là chuẩn chung. Dưới đây là một vài tên biến hợp lệ và không hợp lệ.


- Tên hợp lệ
```
NAME
_NAME
NAME_
NAME01
NAME_01

```

- Tên không hợp lệ
```
0_NAME
-NAME
NAME!
YOUR-NAME
```
Lý do không hợp lệ là các ký tự đặc biệt như như !, $, -,... được đưa vào danh sách các từ khóa dùng trong shell.

## 2. Gán giá trị cho biến

Để gán giá trị cho biến thì bạn dùng cú pháp sau:
```
variable_name=variable_value
```
Ví dụ :
```
NAME="Do Minh Huy - zaraoder.xyz"

```

Như trong ví dụ này mình đã gán giá trị "Do Minh Huy - zaraoder.xyz" cho biến NAME.

## 3. Truy xuất giá trị của biến
- khi bạn muốn truy xuất đến một biến thì phải dùng ký tự đô la $ đặt trước biến đó. Như ví dụ dưới đây mình đã in ra giá trị của biến NAME.

```
#!/bin/sh
NAME="Do Minh Huy - zaraoder.xyz"
echo $NAME
```
- Kết quả sẽ in ra chuỗi sau:

```
Do Minh Huy - zaraoder.xyz
```
## 4. Biến chỉ đọc (giống hằng số)

- Biến chỉ đọc là biến chỉ cho phép đọc, không được phép thay đổi giá trị của biến.

Để thiết lập một biến là chỉ đọc thì ta sử dụng từ khóa readonly.

```
DOMAIN="zaraoder.xyz"
readonly DOMAIN
```

- Nếu bạn cố tình thay đổi giá trị của biến thì lập tức nhận được thông báo lỗi "/bin/sh: DOMAIN: This variable is read only.".

## 5. Xóa biến

- Nếu một biến không còn tác dụng gì cho chương trình thì bạn nên xóa nó đi bằng cách sử dụng lệnh shell để xóa nó ra khỏi dành sách biến, sau khi xóa xong thì bạn mất hoàn toàn biến đó.

Để xóa biên thì ta dùng hàm unset, cú pháp như sau:

```
unset variable_name
```

Vi dụ:

```
#!/bin/sh
NAME="Huydm"
unset NAME
echo $NAME

```
- Đoạn code này sẽ không in ra giá trị nào cả bởi vì biến NAME đã bị xóa trước khi dùng lệnh echo.

`Lưu ý: Bạn không thể xóa biến được thiết lập là readonly.`

