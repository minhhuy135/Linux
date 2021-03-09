# Cách Backup Wordpress từ máy này sang máy khác


## 1. Backup Cơ sở dữ liệu

#### Bước 1: Tạo thư mục lưu trữ bản Backup

`mkdir -p /backup/`

Ta sử dụng lệnh `mysqldump` để tiến hành Backup Cơ sở dữ liệu. Trong phần này ta chỉ cần Backup Cơ sở dữ liệu của `wordpress` nên ta sử dụng lệnh:

`mysqldump -u root -p wordpress > /backup/wordpress.sql`

#### Bước 2: Chuyển Code WordPress và bản Backup Cơ sở dữ liệu

Đối với phần Code của WordPress cũ, ta chỉ việc chuyển toàn bộ thư mục chứa Source Code.

Đối với phần Database ta chuyển bản vừa Backup ở trên.

<img src="https://imgur.com/CtEm2Om.png">

## 2. Migrate WordPress

Đầu tiên trên hệ thống mới, ta phải cài đặt đầy đủ LAMP hoặc LEMP Stack để có thể chạy một cách tốt nhất.

### 2.1 Migrate Cơ sở dữ liệu

#### Bước 1: Khởi tạo Cơ sở dữ liệu mới

Đăng nhập vào MySQL hoặc MariaDB của hệ thống mới, ta tạo một cơ sở dữ liệu mới. Cơ sở dữ liệu này có tên giống với Cơ sở dữ liệu cũ là `wordpress` hoặc đặt tên mới cũng được.

#### Bước 2: Sử dụng mysqldump để chuyển dữ liệu sang Cơ sở dữ liệu mới

`mysql -u root -p wordpress < /backup/wordpress.sql`

`/backup/wordpress.sql` là đường dẫn của thư mục chứa file Backup Cơ sở dữ liệu.

Sau khi Restore thành công ta khởi động lại MySQL hoặc MariaDB.

`systemctl restart httpd`

### 2.2. Cấu hình WordPress mới

#### Bước 1: Chuyển Source Code của WordPress sang hệ thống mới

Bước này ta chỉ việc chuyển Source Code sang hệ thống mới tại thư mục `/var/www/html/`

#### Bước 2: Cấu hình WordPress trên hệ thống mới

Với việc đặt tên DB mới là `wordpress` thì ta không cần phải thay đổi lại `DB_HOST` trong cấu hình wordpress. Chúng ta cần phải thay đổi lại đường dẫn vì hiện tại cấu hình WordPress vẫn đang nhận cấu hình của hệ thống cũ.

Ta thay đổi cấu hình tại file `wp-config.php`. Ta thêm 2 dòng sau:

```
define('WP_HOME','http://IP or yourdomain');
define('WP_SITEURL','http://IP or yourdomain');
```

Tại đây ta thay đổi URL ứng với tên miền hoặc địa chỉ IP (nếu dựng LAB) của hệ thống mới.

Sau đó lưu lại và khởi động lại httpd:

`systemctl restart httpd`

Kiểm tra lại hoạt động của WordPress thành công:

<img src="https://imgur.com/0u56v3d.png">

### Lưu ý

Nếu sử dụng trên môi trường thật ta cần phải trỏ tên miền về địa chỉ IP Public của hệ thống mới.

