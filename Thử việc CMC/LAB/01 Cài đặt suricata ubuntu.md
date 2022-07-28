# 1 Hướng dẫn cài đặt Suricata trên Ubuntu 20.04

## Giới thiệu

`Suricata` là một công cụ giám sát an ninh mạng sử dụng tập hợp các chữ ký do cộng đồng tạo ra và do người dùng xác định (còn được gọi là các quy tắc) để kiểm tra và xử lý lưu lượng mạng Suricata có thể tạo các sự kiện nhật ký, kích hoạt cảnh báo và giảm lưu lượng khi phát hiện các gói hoặc yêu cầu đáng ngờ đối với bất kỳ dịch vụ khác nhau đang chạy trên máy chủ.


## Cài đặt Suricata trên Ubuntu

Cập nhật hệ thống 

```
apt-get update && apt-get upgrade
````

- Để bắt đầu cài đặt Suricata, chúng ta cần thêm repository của Open Information Security Foundation (OISF) vào hệ thống Ubuntu của mình. Bạn có thể sử dụng lệnh add-apt-repository để thực hiện việc này.

- Thực thi lệnh sau để thêm repository vào hệ thống của chúng ta và cập nhật danh sách các packages có sẵn:

```
add-apt-repository ppa:oisf/suricata-stable
```

- Sau khi chúng ta đã thực hiện repository vào hệ thống của chúng ta và cập nhật danh sách các packages thì tiến hành cài đặt Suricata bằng cách sử dụng lệnh apt như sau:

```
apt install suricata -y

```

- Sau khi đã cài đặt Suricata thành công chúng ta sẽ kích hoạt suricata.service để Suricata sẽ chạy khi hệ thống khi khởi động lại. Sử dụng lệnh systemctl để kích hoạt:

```
systemctl enable suricata.service
```

Kết quả sau khi thực thi lệnh trên sẽ như sau:

```
Kết quả
suricata.service is not a native service, redirecting to systemd-sysv-install.
Executing: /lib/systemd/systemd-sysv-install enable suricata
```


# 2. Filebeat

## Tìm hiểu về filebeat

- Là 1 thành phần angent dùng để thu thập và đẩy các sự kiện về logstash để logstash phân tích ,

- Beats là một platform(nền tảng) trong đó có các project(dự án) nhỏ sinh ra thực hiện trên từng loại dữ liệu nhất định.

## Filebeat làm việc như thế nào

- prospector: Người khai thác
- harvester : người thu hoạch
- Spooler : bộ đệm
- Elasticsearch : công cụ tìm kiếm
- Logstash : Là 1 công cụ mã nguồn mở thu thập dữ liệu có khả năng liên hợp theo thời gian thực.


![anh1](https://img001.prntscr.com/file/img001/Ag6rzq6iQIi8inqPnoHfAw.png)

# 3 . Cài đặt Filebeat
```
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

sudo apt-get install 

apt-transport-https -y


# Install apache licensed pakage.
echo "deb https://artifacts.elastic.co/packages/oss-7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list

sudo apt-get update && sudo apt-get install filebeat -y
```

- Liệt kê các mô-đun
```
sudo filebeat modules list

```

- Tùy chọn - Mô-đun Apache
Nếu bạn muốn sử dụng filebeat để phân tích cú pháp tệp nhật ký Apache, hãy bật mô-đun apache

```
sudo filebeat modules enable apache

```

- Định cấu hình Filebeat
```
vi /etc/filebeat/filebeat.yml
```

# Tài liệu tham khảo :

https://blog.cloud365.vn/logging/ELK-part-5-Tim-hieu-ve-filebeats/

https://123host.vn/community/tutorial/huong-dan-cai-dat-suricata-tren-ubuntu-20-04.html



https://blog.programster.org/install-filebeat

