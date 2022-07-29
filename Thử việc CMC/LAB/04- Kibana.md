# Phần này có cài đặt kibana , Filebeat , Logstash ,Elasticsearch
# Kibana 


- Là một ứng dụng giao diện người dùng mở và miễn phí , cung cấp khả năng tìm kiếm và trực quan hóa dữ liệu cho dữ liệu được lập chỉ mục trong Elasticsearch

- Kibana cung cấp các tính năng cho người dùng quản lý như biểu đồ cột, biểu đồ đường, biểu đồ tròn, biểu đồ nhiệt và nhiều loại chart khác nữa.


# Hướng dẫn cài đặt ELK trên Ubuntu 20.04

- ELK là sự kết hợp của bộ 3 mã nguồn mở ElasticSearch, Logstash và Kibana. Nó là một trong những nền tảng quản lý Logs phổ biến hiện nay. Elasticsearch là bộ máy tìm kiếm và phân tích, Logstash lại là chương trình xử lý, chuyển đổi log from nhiều nguồn, sau đó đẩy vào Database Elasticsearch, còn về Kibana là một chương trình để hiển thị thông tin logs cho người dùng.

Cài Đặt Các Thành Phần Phụ Thuộc.
- Để cài đặt Elasticsearch, bạn sẽ cần cài đặt Java trước vào hệ thống, dùng câu lệnh sau để tiến hành cài đặt Java JDK. 

```
apt-get install openjdk-11-jdk -y
```

Một khi cài đặt thành công, dùng câu lệnh sau để xác minh lại phiên bản Java:

```
java -version

```

Bạn sẽ nhìn thấy Output như sau:

```
openjdk 11.0.7 2020-04-14
OpenJDK Runtime Environment (build 11.0.7+10-post-Ubuntu-3ubuntu1)
OpenJDK 64-Bit Server VM (build 11.0.7+10-post-Ubuntu-3ubuntu1, mixed mode, sharing)

```

Tiếp theo, chúng ta sẽ cài đặt các thành phần phụ thuộc khác với câu lệnh sau:
```
apt-get install nginx curl gnupg2 wget -y

```

# Cài Đặt Và Cấu Hình Elasticsearch

Trước khi bắt đầu, bạn sẽ cần cài đặt Elasticsearch vào hệ thống. Nó sẽ dùng để lưu trữ log và các sự kiện được Logstash đẩy về theo thời gian thực.

Đầu tiên, thêm Elastic repoitory vào hệ thống của bạn với câu lệnh sau:

```
curl -fsSL https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -

echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | tee -a /etc/apt/sources.list.d/elastic-7.x.list

```
Tiếp theo, cập lại repository và cài đặt Elasticsearch với câu lệnh sau:
```
apt-get update -y

apt-get install elasticsearch -y
```

Khi đã cài đặt, chỉnh sửa tệp tin cấu hình mặc định của Elasticsearch:
```
vi /etc/elasticsearch/elasticsearch.yml

```

Bỏ dấu “#” và lưu lại cho các dòng sau:

```

#network.host: localhost 

```

Lưu và đóng lại tệp tin, sau đó start Elasticsearch và cho phép nó khởi động cùng hệ thống với câu lệnh sau:

```
systemctl start elasticsearch

systemctl enable elasticsearch

```

Tại thời điểm này, Elasticsearch đã được cài đặt và đang lắng nghe với port 9200. Bạn bây giờ có thể kiểm tra xem nó có đang hoạt động không bằng câu lệnh:

```
curl -X GET "localhost:9200"
```

Nếu mọi thứ đều ổn, bạn sẽ thấy các tham số output như sau:

```
{
  "name" : "ubuntu2004",
  "cluster_name" : "elasticsearch",
  "cluster_uuid" : "AVRzLjAbQTK-ayYQc0GaMA",
  "version" : {
    "number" : "7.8.0",
    "build_flavor" : "default",
    "build_type" : "deb",
    "build_hash" : "757314695644ea9a1dc2fecd26d1a43856725e65",
    "build_date" : "2020-06-14T19:35:50.234439Z",
    "build_snapshot" : false,
    "lucene_version" : "8.5.1",
    "minimum_wire_compatibility_version" : "6.8.0",
    "minimum_index_compatibility_version" : "6.0.0-beta1"
  },
  "tagline" : "You Know, for Search"
}
```

# Cài Đặt và Cấu Hình Kibana

- Tiếp theo, bạn sẽ cần cài đặt Kibana. Đây là chương trình cho phép bạn phân tích dữ liệu đã được lưu trữ trên Elasticsearch. Bạn có thể cài đặt bằng câu lệnh sau:

```
apt-get install kibana -y

```

Mội khi Kibana đã được cài đặt, tiến hành Khởi động dịch vụ Kibana và cho phép nó khởi động cùng hệ thống với câu lệnh sau:

```
systemctl start kibana

systemctl enable kibana

```

Tiếp theo, bạn sẽ cần tạo một user quản trị cho Kibana để truy cập vào giao diện web. Chạy câu lệnh sau để tạo user và password, và lưu nó vào tệp tin htpasswd.users

```
echo "admin:`openssl passwd -apr1`" | tee -a /etc/nginx/htpasswd.users

```
Bạn sẽ được yêu cầu cung cấp password, trông như sau:

```
Password: 
Verifying - Password: 
admin:$apr1$8d05.YO1$E0Q8QjfNxxxPtD.unmDs7/

```

Tiếp theo, tạo một tệp tin cấu hình cho máy chủ ảo trên Nginx cho Kibana:
```
vi /etc/nginx/sites-available/kibana
```
Thêm vào những dòng sau:

```

server {
    listen 80;

    server_name kibana.example.com;

    auth_basic "Restricted Access";
    auth_basic_user_file /etc/nginx/htpasswd.users;

    location / {
        proxy_pass http://localhost:5601;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}

```

Lưu và đóng lại file, sau đó cho phép Nginx đọc vào tệp tin cấu hình vừa tạo, với câu lệnh sau:

```
ln -s /etc/nginx/sites-available/kibana /etc/nginx/sites-enabled/
```

Tiến hành khởi động lại dịch vụ nginx để áp dụng những thay đổi:

```
systemctl restart nginx

```

Tiếp theo, mở trình duyệt và kiểm tra trạng thái của Kibana tại URL: http://kibana.example.com/status(add tên miền vào file host để kiểm tra)
Bạn sẽ được yêu cầu cung cấp username và password.

![anh1](https://img001.prntscr.com/file/img001/NKG1CFGTTgqPo8rmo0Un4w.png)

Cung cấp thông tin đăng nhập, và nhấp vào Sign in. Bạn sẽ truy cập được Kibana.

Tại thời điểm này, Kibana dashboard đã được cài đặt trên hệ thống của bạn. Bạn có thể tiến hành xử lý các bước tiếp theo.


# Cài Đặt và Cấu Hình Logstash

Logstash được sử dụng để xử lý logs được gửi về từ Beat. Bạn sẽ cài đặt nó với câu lệnh sau:

```
apt-get install logstash -y

```

Một khi Logstash được cài đặt, tạo ra một tệp tin cấu hình mới với câu lệnh sau:

```
vi /etc/logstash/conf.d/02-beats-input.conf

```
Thêm vào những dòng sau:

```
input {
  beats {
    port => 5044
  }
}

```
Lưu và thoát tệp, sau đó tạo một tệp cấu hình Elasticsearch mới:

```
vi /etc/logstash/conf.d/30-elasticsearch-output.conf

```
Thêm vào những dòng sau:

```
output {
  if [@metadata][pipeline] {
    elasticsearch {
    hosts => ["localhost:9200"]
    manage_template => false
    index => "%{[@metadata][beat]}-%{[@metadata][version]}-%{+YYYY.MM.dd}"
    pipeline => "%{[@metadata][pipeline]}"
    }
  } else {
    elasticsearch {
    hosts => ["localhost:9200"]
    manage_template => false
    index => "%{[@metadata][beat]}-%{[@metadata][version]}-%{+YYYY.MM.dd}"
    }
  }
}

```

Lưu và thoát, đồng thời xác nhận cấu hình Logstash

```

sudo -u logstash /usr/share/logstash/bin/logstash --path.settings /etc/logstash -t

```

Nếu mọi thứ đều ổn, bạn sẽ nhìn thấy Output như sau:

```

Config Validation Result: OK. Exiting Logstash

```

Tiếp theo, start dịch vụ Logstash và cho phép nó khởi động cùng hệ thống:

```
systemctl start logstash

systemctl enable logstash

```

# Cài Đặt và Cấu Hình Filebeat

ELK sử dụng Filebeat để thu thập dữ liệu từ nhiều nguồn khác nhau và chuyển nó vào Logstash.

Bạn có thể cài đặt Filebeat với câu lệnh sau:

```
apt-get install filebeat -y

```

Một khi cài đặt hoàn tất, bạn sẽ cần tạo một tệp cấu hình Filebeat để kết nối tới Logstash:

```

vi /etc/filebeat/filebeat.yml

```

Dùng dấu “#” để rào lại các dòng như sau:

```

#output.elasticsearch:
  # Array of hosts to connect to.
#  hosts: ["localhost:9200"]

```

Sau đó, bỏ “#” cho các dòng sau:

```

output.logstash:
  # The Logstash hosts
  hosts: ["localhost:5044"]

```

Lưu và đóng lại tệp, sau đó bật module system với câu lệnh sau:

```
filebeat modules enable system

```

Mặc định, Filebeat được cấu hình để sử dụng đường dẫn mặc định tới syslog và authen logs.

Bạn có thể load lên các pipeline đầu vào cho module hệ thống với câu lệnh sau:

```
filebeat setup --pipelines --modules system

```

Tiếp theo, load template với câu lệnh:

```

filebeat setup --index-management -E output.logstash.enabled=false -E 'output.elasticsearch.hosts=["localhost:9200"]'

```

Bạn sẽ nhìn thấy các giá trị output:

```
Index setup finished.

```

Mặc định, Filebeat được đóng gói với những dashboard mẫu cho phép bạn có thể xem được dữ liệu của Filebeat trong Kibana. Vì vậy, bạn cần tắt Logstash Output đi và Bật Elasticsearch Ouput.

```
filebeat setup -E output.logstash.enabled=false -E output.elasticsearch.hosts=['localhost:9200'] -E setup.kibana.host=localhost:5601

```

Bạn sẽ nhìn thấy output như sau:

```
Overwriting ILM policy is disabled. Set `setup.ilm.overwrite:true` for enabling.

Index setup finished.
Loading dashboards (Kibana must be running and reachable)
Loaded dashboards
Setting up ML using setup --machine-learning is going to be removed in 8.0.0. Please use the ML app instead.
See more: https://www.elastic.co/guide/en/elastic-stack-overview/current/xpack-ml.html
Loaded machine learning job configurations
Loaded Ingest pipelines

```

Bây giờ, start dịch vụ Filebeat và cho phép khởi động cùng hệ thống:

```

systemctl start filebeat

systemctl enable filebeat

```

# Truy cập Kibana Dashboard
Như vậy, tất cả các thành phần ELK đã được cài đặt và cấu hình. Bây giờ, mở trình duyệt web vào truy cập URL: http://kibana.example.com .

Bên góc trái, click chọn Discover   và chọn filebeat-*  để nhìn thấy dữ liệu của Filebeat như màn hình sau:

