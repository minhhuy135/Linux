# Tạo Scripts Backup Source Code và Database WordPress
Để tạo Scripts Backup cho WordPress, ta nên tạo 2 file Scripts riêng biệt để Backup Source Code riêng và Backup cho Cơ Sở dữ liệu riêng để dễ dàng quản lý.

- Tạo thư mục làm nơi chứa các bản Backup:
```
mkdir -p /backups/{backup-code,backup-db}
```
- Trong đó /backup-code để chứa Backup Source Code cho WordPress, /backup-db để chứa các bản Backup Cơ sở dữ liệu.

- Để tạo Scripts Backup, ta tạo tệp có đuôi .sh để sử dụng

## Bước 1: Tạo file Script
```
vi /backups/backup-code/code-backup.sh

```
Thêm nội dung dưới vào file vừa tạo:
```
SRCDIR="/var/www/html/*"
DESTDIR="/backups/backup-code/wp/"
FILENAME=wpcode-$(date +%-Y%-m%-d)-$(date +%-T).tgz
tar -P --create --gzip 
```
--file=$DESTDIR$FILENAME $SRCDIR
## Bước 2: Gán quyền thực thi cho tệp Script vừa tạo
```
chmod +x /backups/backup-code/code-backup.sh
```
Bước 3: Chạy Script vừa tạo
```
sh /backups/backup-code/code-backup.sh
```
Sau khi tiến hành backup, file back up sẽ có dạng wpcode-20201229-16:44:37.tgz
![anh1](https://image.prntscr.com/image/CF2g_hrlSaqLzDKdd9TvHw.png)

## 2. Backup Database
### Bước 1: Tạo file Script cho Cơ sở dữ liệu
```
vi /etc/backups/backup-db/db.sh
```
Ta thêm nội dung sau:
```
NOW=$(date +"%Y-%m-%d-%H:%M")
BACKUP_DIR="/backups/backup-db/"

DB_USER="root"
DB_PASS="abcd1234"
DB_NAME="wordpress"
DB_FILE="wordpress.$NOW.sql"

mysqldump -u$DB_USER -p$DB_PASS $DB_NAME > $BACKUP_DIR/$DB_FILE
```
### Bước 2: Gán quyền thực thi cho tệp Script vừa tạo
```
chmod +x chmod +x /backups/backup-db/db.sh
```
### Bước 3: Chạy Script vừa tạo
sh /backups/backup-db/db.sh

Tệp được lưu lại sau khi chạy Script sẽ có dạng  wordpress.2020-12-29-16:55.sql
![anh2](https://image.prntscr.com/image/FVvykgb-RgOV7ukdBp4PKA.png)
### 3. Lưu vào Crontab để tự động chạy Scripts hàng ngày
```
crontab -e
````
```
0 8 * * * /backups/backup-code/code-backup.sh
0 8 * * * /backups/backup-db/db.sh
```
Hai Scripts vừa tạo sẽ được chạy tự động lúc 8 giờ sáng mỗi ngày.