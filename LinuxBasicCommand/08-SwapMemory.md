# Hoán đổi bộ nhớ

## 1. Swap Memory là gì?
- Swap memory được sử dụng khi hệ thống của bạn quyết định rằng cần thêm bộ nhớ RAM cho quá trình hoạt động và bộ nhớ Ram hiện tại không đủ để sử dụng . Nếu điều đó xảy ra , các ài nguyên và dữ liệu tạm thời không hoạt động trên bộ nhớ RAM sẽ di chuyển để lưu trữ vào không gian Swap để giải phóng bộ nhớ RAM và sử dụng cho công việc khác .
- Thời gian truy cập vào Swap chậm hơn rất nhiều , do đó bạn không nên coi việc sử dụng Swap là một phương pháp thay thế cho RAM
## 2. Khi nào cần Swap Memory ?
- Tối ưu hóa bộ nhớ : Hệ thống sẽ di chuyển các tài nguyên và dữ liệu hiện không được sử dụng trong bộ nhớ RAM đến Swap , điều này giúp hệ thống phục vụ cho các mục đích khác tốt hơn
- Tránh các trường hợp không lườn trước : trông một số trường hợp , bạn không dự tính được bộ nhớ dành cho các chương trình mà bạn chuẩn bị thử nghiệm , hoặc một chương trình bất kỳ nào đó bất thường .
- Linux Swap có 2 dạng : phân vùng và File để xem nó ở đâu hãy sử dụng lệnh :
 '''
 #swapon:
'''
 ![Anh1](https://image.prntscr.com/image/G6UJR1sHShOqED9kqGUg5A.png)

## 3. Tạo swap
- Tạo Swap file 
  ```
    #sudo dd if=/dev/zero of=/swapfile bs=1024 count=1048576

![Anh1](https://image.prntscr.com/image/9TBuvSpeQTutKyOkKWOb6A.png)

    bs: kích thướng Swap File
    count: tốc độ
    ```
    - Tạo phân vùng swap
    ```
    #mkswap /swapfile

![anh2](https://image.prntscr.com/image/j1n_i1IpRLuLIe_sHLWxCg.png)

    ```
- Kích hoạt swap
    ```
    #swapon /swapfile

![anh3](https://image.prntscr.com/image/kgNf-IhpTXGy7ChL2rqpPA.png)

    ```

- Thiết lập swap tự động được kích hoạt mỗi khi reboot
    ```
    #echo /swapfile none swap defaults 0 0 >> /etc/fstab
    ```
- Bảo mật file swap bằng cách chmod
    ```
    #chmod root:root /swapfile
    ```
    ```
    #chmod 0600 /swapfile
    ```
## 4. Swappiness

- Swappiness là mức độ ưu tiên sử dụng swap, khi lượng RAM còn lại bằng giá trị của swappiness (tính theo tỷ lệ phần trăm) thì swap sẽ được sử dụng. Swappiness có giá trị trong khoảng 0 – 100.
- Do  tốc độ xử lý dữ liệu trên RAM cao hơn nhiều so với Swap, do đó bạn nên đặt giá trị này về gần với 0 để tận dụng tối đa sức mạnh hệ thống. Tốt nhất nên chỉnh về 10.
- Kiểm tra mức độ sử dụng file swap
    ```
    #cat /proc/sys/vm/swappiness
    ```
- Chỉnh thông số swappiness
    ```
    #sysctl vm.swappiness=10
    ```
![anh4](https://image.prntscr.com/image/wEHEa6k8R2ubQQZ9JjpUJw.png)

## 5. Xóa swap

- Để xóa File swap có thể Deactive swap File:
    ```
    #sudo swapoff -v /swapfile
    ```
- Xóa dòng khai báo swap
    ```
    /swapfile swap swap defaults 0 0 tại file /etc/fstab
    ```
- Cuối cùng để Xóa ta dùng lệnh rm
    ```
    #sudo rm /swapfile
    ```


 