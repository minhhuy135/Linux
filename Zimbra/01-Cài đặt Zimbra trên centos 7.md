# Hướng dẫn cài đặt email server zimbra trên CentOS 7

## 1. Chuẩn bị

- Phiên bản: zimbra 8.8 trên CentOS 7

- Cấu hình tối thiểu: RAM: 4GB, Disk: 50GB, CPU: 5 core

- Chuẩn bị tên miền: Một tên miền đã trỏ bản ghi mail (điều này là cần thiết vì trong quá trình cài đặt sẽ yêu cầu tên miền phân giải được bản ghi mail).

Tên miền: zaraoder.xyz

## 2. Cài đặt email server zimbra

- Cài package cần thiết

```
yum install unzip net-tools sysstat openssh-clients perl-core libaio nmap-ncat libstdc++.so.6 nano wget -y 

```

- Đổi host name, add hostname

```
hostnamectl set-hostname mail.zaraoder.xyz

cat << EOF >> /etc/hosts

103.159.50.188 mail.zaraoder.xyz

EOF

```
![anh1](https://image.prntscr.com/image/lNOI5DJFTbWjVdsmxsWuvA.png)

Lưu ý: File /etc/resolv.conf phải khai báo nameserver 8.8.8.8 để có thể connect tới server download bộ cài zimbra.

- Download bộ cài đặt zimbra 8.8
```
wget https://files.zimbra.com/downloads/8.8.12_GA/zcs-8.8.12_GA_3794.RHEL7_64.20190329045002.tgz
```

- Giải nén và cài đặt
```
tar -xvf zcs-8.8.12_GA_3794.RHEL7_64.20190329045002.tgz
cd zcs-8.8.12_GA_3794.RHEL7_64.20190329045002
./install.sh
```
- Ở bước này lưu ý một số tùy chọn cài đặt như sau:
```
Do you agree with the terms of the software license agreement? [N] Y

Use Zimbra's package repository [Y] Y

Select the packages to install

Install zimbra-ldap [Y] Y

Install zimbra-logger [Y] Y

Install zimbra-mta [Y] Y

Install zimbra-dnscache [Y] N

Install zimbra-snmp [Y] Y

Install zimbra-store [Y] Y

Install zimbra-apache [Y] Y

Install zimbra-spell [Y] Y

Install zimbra-memcached [Y] Y

Install zimbra-proxy [Y] Y

Install zimbra-drive [Y] Y

Install zimbra-imapd (BETA - for evaluation only) [N] N

The system will be modified.  Continue? [N] Y
```

- Sau khi nhấn Y, nó sẽ tải xuống các gói liên quan đến Zimbra và có thể mất thời gian tùy thuộc vào tốc độ internet của bạn
```
The system will be modified.  Continue? [N] Y
```
- Xác nhận thay đổi tên domain và nhập domain

```
It is suggested that the domain name have an MX record configured in DNS
Change domain name? [Yes] Yes
Create domain: [mail.zaraoder.xyz] zaraoder.xyz
```
![anh2](https://image.prntscr.com/image/jexXzN9ARXKgyTAb4eVLDg.png)

- Hệ thống sẽ báo password account admin zimbra chưa được nhập, cần đặt lại password admin zimbra
```
Chọn 6 -> Chọn 4 -> Nhập pass => Enter

Address unconfigured (**) items  (? - help) 6

Select, or 'r' for previous menu [r] 4

Password for admin@zaraoder.xyz (min 6 characters): [l0eH0MeC] Huy@1234
```

- Chọn r để quay lại menu chính

```
Select from menu, or press 'a' to apply config (? - help)
*** CONFIGURATION COMPLETE - press 'a' to apply
Select from menu, or press 'a' to apply config (? - help) a
Save configuration data to a file? [Yes] Yes
Save config in file: [/opt/zimbra/config.16239]
Saving config in /opt/zimbra/config.16239...done.
The system will be modified - continue? [No] Yes
Operations logged to /tmp/zmsetup.20200321-225029.log
Setting local config values...
```

![anh3](https://image.prntscr.com/image/0uyA9cN2QmKsONjNeDduTA.png)

Chờ quá trình lưu cấu hình hoàn tất.
```
Notify Zimbra of your installation? [Yes] Yes
Configuration complete - press return to exit
```
- Truy cập

```
https://mail.zaraoder.xyz:7071
```

![anh4](https://image.prntscr.com/image/zFRdmcSpRD_6RcudzN-sPw.png)

Hoặc
```
https://103.159.50.188:7071

```

![anh5](https://image.prntscr.com/image/v3d3oTsMTNuntSVldNKlBA.png)

![anh6](https://image.prntscr.com/image/tHupD7YRTfuLbAPoHTU0Ew.png)

## 3. Kiểm tra gửi - nhận
Đảm bảo các server zimbra chạy
```
service zimbra status
```
![anh7](https://image.prntscr.com/image/4YcIEbh5T52Z744afwRwsw.png)

## 4. Bản ghi 

Đảm bảo đầy đủ các bản ghi A , MX ,  DKIM , DMARC

- Thêm bản ghi A: Tên mail loại bản A giá trị 103.159.50.188

- Thêm bản ghi MX: Tên @ loại bản ghi MX giá trị mail.zaraoder.xyz

- Thêm bản ghi _dmarc: _dmarc loại bản ghi txt giá trị v=DMARC1; p=none; rua=mailto:mailauth-reports@mail.zaraoder.xyz

- Thêm bản ghi SPF: @ loại bản ghi txt giá trị v=spf1 +a +mx +ip4:103.159.50.188 ~all

-  Thêm bản ghi PTR ở DNS server của hệ thống DNS Nhân Hòa.

- Thêm bản ghi DKIM các thông số lấy từ email server

Active dkim cho domain congtynhanhoa.space
```
su - zimbra
/opt/zimbra/libexec/zmdkimkeyutil -a -d zaraoder.xyz

```
```
DKIM Data added to LDAP for domain zaraoder.xyz with selector D6592B1C-9853-11EB-93E4                   -A4BF96496D78
Public signature to enter into DNS:
D6592B1C-9853-11EB-93E4-A4BF96496D78._domainkey IN      TXT     ( "v=DKIM1; k=rsa; "
          "p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA50FbuEzxGJLULVgtKpDEoTdnFNhe TDL7WISW/+dOwEHk9sz7Wd8l1yXtzctPRXVkTHa+UE//XxoeF9guSKBtcvgtYZmSFcpYspPIDfjAOXT8cqXOx                   GzX5iZfztWMCFRj1O9+xBFqRk1YfnEiTLsRfPqJrb+g1n+bbTm/19jWeBvOfCJN1C1lXBt+RNlo6XyYBVUjpn                   cmaahVTj"
          "HzXb3hEmyB1eZ2ScrIlXGa/4qau1IEQEXo7+NtXkqMhB7aybtpm1S4g88wSnpMXLLE+hpJ9jWyS3XAZoxqLvUznVi9YN6Xaf7t7GYLk3gUsYZB5nTgkedRpmOUnCaiflXG8GySjQIDAQAB" )  ; ----- DKIM                    key D6592B1C-9853-11EB-93E4-A4BF96496D78 for zaraoder.xyz
```


Bản ghi DKIM: Tên E395C5A6-6B90-11EA-8B81-7E2363C56483._domainkey loại bản ghi txt giá trị
```
"v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA58Xz+PP23B7npDWLwDIjEPB4rPnyfo/ZHxWshFlWa8npUPmI2bxgWuRG3OqgHgxNrg6aBDN2bu7YBB1rqKR+jnWEZ/ojhX6OA7ik3Z82d2xZk+NfPCsgblo8XLLAwask3CJ2eXYWbtBqC2J2lDz0cpac1Vx+mNQaR3WWB416wMSt1E3E6iKPVyGK0D72gzuw7TAhcSOlxFDOd9uX9fxJOddsz4bW4ITY6KLQfist2XCqmHgbQ6l1HcVm405qUYDXBMUHJ8kn2fMle2OlE4po7kq//vl8FEmvcCZnTVjlPyC9ymfhBC5T9aWyMMvCrgjqYq/so3qjJ577WhxpWQ/yDwIDAQAB"
```

Khi get giá trị đoạn dkim chia thành các dấu " bỏ các dấu " ở giữa để ghép lại thành chuỗi.

![anh8](https://image.prntscr.com/image/EFPjMhxqQYe4IdlMolxjKA.png)

Tài liệu tham khảo 
https://kb.nhanhoa.com/pages/viewpage.action?pageId=33817127