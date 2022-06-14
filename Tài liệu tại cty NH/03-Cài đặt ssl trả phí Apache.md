1.	Install env
```
yum install mod_ssl

```
2.	make folder store SSL
```
mkdir /etc/httpd/ssl/domain
put crt, key and ca file to folder
```
3.	edit httpd.conf
```
nano /etc/httpd/conf/httpd.conf

```
add line:
```
Listen 443
```
4.	edit ssl.conf

rename ssl.conf to ssl.old
mv /etc/httpd/conf.d/ssl.conf /etc/httpd/conf.d/ssl.old
nano /etc/httpd/conf.d/ssl.conf

add line:
```
<VirtualHost *:443>
ServerName vietnamgolfholiday.net:443
ServerAlias     www.vietnamgolfholiday.net:443
DocumentRoot "/var/www/html/vietnamgolfholiday.net"
    <Directory  "/var/www/html/vietnamgolfholiday.net">
        Options Indexes FollowSymLinks MultiViews
            AllowOverride all
    	    Require all granted
    </Directory>
SSLEngine on
SSLCertificateFile /etc/httpd/ssl/vietnamgolfholidaynet/public.crt
SSLCertificateKeyFile /etc/httpd/ssl/vietnamgolfholidaynet/private.key
SSLCertificateChainFile /etc/httpd/ssl/vietnamgolfholidaynet/ca.crt
</VirtualHost>
```
5.	restart httpd
```
/bin/systemctl restart  httpd.service
```

p/s: Please open port 443 on your server





