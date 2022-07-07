
# check sử dụng tài nguyên linux
```
df -h
free -m
lscpu
```
# cấu hình file hassecc cho web laravel
```
# BEGIN WordPress
<IfModule mod_rewrite.c>
RewriteEngine On
RewriteBase /
RewriteRule ^index\.php$ - [L]
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule . /index.php [L]
RewriteCond %{HTTPS} !=on [NC]
RewriteRule ^(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [R=301,L]
</IfModule>

# END WordPress
```
```
# BEGIN WordPress
<IfModule mod_rewrite.c>
RewriteEngine On
RewriteBase /
RewriteRule ^index\.php$ - [L]
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule . /index.php [L]
</IfModule>

# END WordPress
```

có 2 mẫu htaccess 

# cau hinh swap 
```
wget https://raw.githubusercontent.com/domanhduy/ghichep/master/DuyDM/Swap-Script/nh-create-swap.sh
sh ./nh-create-swap.sh
```

# cau lenh mo tat ca cac tien trinh tren mail kerio-connect
iptables -F
service kerio-connect start
service kerio-connect stop
service kerio-connect restart

# cập nhật letsencrypt trên directadmin
```
cd /usr/local/directadmin/custombuild
vi options.conf để xem có những phiên bản PHP nào .

./build update
./build letsencrypt

./build set php1_release 5.6
./build set php2_release 7.2
./build set php3_release 7.4
./build set php1_mode suphp
./build set php2_mode suphp
./build set php3_mode suphp
./build set mod_ruid2 no
./build update
./build php d
./build apache d
./build rewrite_confs

```


Kính gửi quý khách,

Để đăng ký và cài đặt SSL quý khách vui lòng truy cập sourcode tạo file text:"AC92978A9C069EAFB1C3290570F6B950.txt" xác minh cho tên miền congan.hoabinh.gov.vn theo đường link dưới đây:
1. Đường link tạo file: http://congan.hoabinh.gov.vn/.well-known/pki-validation/AC92978A9C069EAFB1C3290570F6B950.txt
2. Nội dung file: 
519018B70A2998F7A908766DF26A0EE78E00AB008B928F0B53E3BE70075B7675
comodoca.com

Xin cảm ơn !!!

# kết nối FTP:
-  Truy cập FTP qua FileZilla 
B1 : Mở phần mềm FTP Client FileZilla Ấn Ctrl + S hoặc File -> Site Manager (Link hình ảnh chi tiết :  https://prnt.sc/qezagy ) 
B2 : Ở mục Encryption quý khách chọn :  Only user plain FTP (insecure)  (Link hình ảnh chi tiết : https://prnt.sc/qezbo6 )

# SSL
Organization: Individual
Organization unit: Support Department

# phân quyền thư mục;
```
find /home/nhapccyv/public_html -type d -exec chmod 0755 {} \;

find /home/nhapccyv/public_html -type f -exec chmod 0644 {} \;

chown -R nhapccyv:nhapccyv /home/nhapccyv/public_html/*
```

# kiểm tra service zimbra : zmcontrol status


# lenh xoa du lieu trong file ma van giu nguyen ten file (auth.log la ten file )
```

cat /dev/null > auth.log

```

#lệnh cài đặt quét virus
```
wget https://repo.imunify360.cloudlinux.com/defence360/imav-deploy.sh

bash imav-deploy.sh

```
# Kiểm tra ram có bị full 
```
tail -1000 /var/log/messages | grep memory

```

# fix lỗi chỉnh qouta user directadmin
```
cd /usr/sbin
mv setquota setquota.old
touch setquota
chmod 755 setquota

```

# chuyển web giữa các user trong directadmin
```
cd /usr/local/directadmin/scripts
./move_domain.sh callme24h.vn [user cũ] [user mới]

```
# reset ram hosting
```
vi wp-config.php
thêm dòng: define('DISABLE_WP_CRON', true);
killall -9 lsphp
```

# kiểm tra ram có bị tạm ngưng
```
dmesg -T --level err

cd /var/log
tail -10000 messages | grep memory

dmesg messages | grep "out"
```
# Lenh kiem tra file php.ini trong direcadmin

- kiem tra dung luong upload dang de la bao nhieu 
```
# php -i|grep upload_max

```

- kiem tra duong dan file 
```
# php -i|grep php.ini

```

- Sau khi chinh file dung luong khoi dong lai service :
```
 service nginx restart
```
# ban ghi mail outlook
```
Truy cập vào link tắt kém an toàn https://myaccount.google.com/u/8/lesssecureapps?utm_source=google-account&utm_medium=web

pop.gmail.com

smtp.gmail.com
```

# kiểm tra mail log trên cpanel
```
tail -n 1000000 /var/log/exim_mainlog | grep hskim04@atecsystem.kr
```

# Lệnh tìm mail đang cố đăng nhập vào bị chặn ssh vào
```
cat /var/log/maillog | grep IP

tail -10000 /var/log/maillog | grep kingbond.vn

```
# kiểm tra mail bị block

```
vi /etc/cpanel_exim_system_filter
```

# Clear the Admin Blacklist solus
```
php /usr/local/solusvm/scripts/clearauthlog.php --system --clear=all
```

# khởi động lại service kerio
sudo service kerio-connect restart
[program:queue]
command=bash /usr/local/bin/send_queues.sh


#thư mục chứa mail inbox horde trên windown:
```
C:Program Files (x86)Mail EnablePostofficesanphamco.comMAILROOTanpInbox
Europe/Paris
```


# Điều hướng http sang https .htaccess
```
RewriteCond %{HTTPS} !=on [NC]
RewriteRule ^(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [R=301,L]
```

#build Imagick Extension
```

cd /usr/local/directadmin/custombuild
./build update
./build set imagick yes
./build imagick

```

# check user domain
```
/scripts/whoowns pharbaco.com.vn

```

# chình quyền user cpanel
```
cagefsctl --disable nhhoavyt
cagefsctl --enable nhhoavyt
```


# Set timezone centos6
```
 rm -f /etc/localtime
 ln -s /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime
 ```

# Đồng bộ thư mục linux
```
sudo rsync -avP ~/wordpress/ /var/www/html/

```

# 1. Fix lỗi postfix: systemctl status postfix.service => fatal: bind 127.0.0.1 port 25: Address already in use
=> OK, cần kill process đang LISTEN port 25, check qua: netstat -tulpn sau đó kill -9 process đang chạy (ví djụ: kill -9 12345678)
su - zimbra
zmcontrol restart

# 2. Re-config web mail port 80 và 443 thông qua proxy service
```
- Tại user zimbra (su - zimbra), chạy các lệnh sau:
zmprov ms mail.anhlegia.com zimbraMailPort 80
zmprov ms mail.anhlegia.com zimbraMailSSLPort 443
zmtlsctl http && zmtlsctl https
zmprov ms mail.anhlegia.com zimbraReverseProxySSLToUpstreamEnabled FALSE
zmprov ms mail.anhlegia.com zimbraMailMode both
zmprov ms mail.anhlegia.com zimbraReverseProxyMailMode both
./libexec/zmproxyconfig -e -w -o -a 8080:80:8443:443 -x both -H mail.anhlegia.com
zmcontrol restart
```

Nhớ thay cái hostname mail.anhlegia.com thành domain chạy webmail tương ứng.


# chạy lệnh này để các user đang bị lỗi PHP 
```
cagefsctl --disable nhledk23

cagefsctl --enable nhledk23

```


# cau lenh cai kerio
```
curl -Lso- https://raw.githubusercontent.com/thang290298/work-Document/master/Scripts/Check_mk/script-add-agent-email-server-checkmk.sh | bash
```


# lenh kiem tra mail dang spam
```
tail -n 1000000 /var/log/exim_mainlog | grep IP
```
#lenh add du lieu databases khi file qua 50mb

Dang nhap vao 
```
mysql -u root -p
b2: show databases ;
b3: use nhbocmlo_alibaba ;
b4: source /duong dan thu muc/tendatabases ;

```

# Làm rỗng file dữ nguyên file nhưng xóa dữ liệu ở trong
```
cat /dev/null > tenfile 

```

#kiểm tra trong thư mục ticket xem có nhiều dung lượng thì xóa đi tren direcadmin
```
/usr/local/directadmin/data/tickets

```


# them ip de mail gui duoc di tren quan tri website
them IP 142.250.0.0/15 de gui duoc mail google tren quan tri website



source /home/nhmayokb/nhmayokb_may.sql ;


# cach tim file ssl config bang tay 
```

locate ssl.conf

```


# thư mục chứa mail queue của kerio 

```
/opt/kerio/mailserver/store/queue  đây là đường dẫn 

rm -rf * -R đây là lệnh xóa tất cả các file trong thư mục để ý với lệnh này 

```

# duong dan dang nhap php

```
http://103.159.51.251/phpmyadmin

```


# xóa cache trên direcadmin
```

sudo sh -c "sync; echo 3 > /proc/sys/vm/drop_caches"

```

# kiem tra error.log website dang bi loi 
```

/var/log/httpd/domains

```

# cau lenh kiem tra xem file config o dau
```
grep -irl nhviernt /home/nhviernt/public_html/

```

# cau lenh kiem tra IP nao dang truy cap vao vps nhieu
```
netstat -ntu | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -n

awk '{ print $1}' /var/log/httpd/domains/xetaithanhcong.net.log | sort | uniq -c | sort -nr | head -n 10


tail -100 santuyensinh.giaiphaptuyensinh.com

cat santuyensinh.giaiphaptuyensinh.com | awk '{print $1}' | sort | uniq -c | sort -nr | head -10

```

# cau lenh de chan Ip truy cap bat thuong
```
route add 123.123.123.123 reject

```

# lenh kiem tra log 

```

tail -f  mysql_error.log

```
# Duong dan kiem tra mat khau direcadmin va root sql .

```
cat /usr/local/directadmin/scripts/setup.txt

```

# dum mysql bang cau lenh
```
mysqldump -u root –p   webtruyen_cherry  > /tenthumucchuadatabases/truyenviet24h.sql
```

# lệnh cài kerio
```
curl -Lso- https://raw.githubusercontent.com/minhhuy135/Linux/main/Mail%20kerio/scrip-add-checkmk-kerio.sh | bash
```

















  
 
  
  
  
