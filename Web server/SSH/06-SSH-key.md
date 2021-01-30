# Tổng quan về SSH

Cách phổ biến nhất để kết nối với máy chủ Linux từ xa là thông qua SSH. SSH là viết tắt của Secure Shell và cung cấp một cách an toàn và bảo mật để thực hiện các lệnh, thực hiện các thay đổi và cấu hình dịch vụ từ xa. Khi bạn kết nối qua SSH, bạn đăng nhập bằng tài khoản tồn tại trên máy chủ từ xa.

# Cách hoạt động của SSH

- Trong suốt thời gian phiên SSH của bạn, bất kỳ lệnh nào bạn nhập vào thiết bị đầu cuối cục bộ đều được gửi qua một đường hầm SSH được mã hóa và được thực thi trên máy chủ của bạn.

- Kết nối SSH được triển khai bằng mô hình máy khách-máy chủ. Điều này có nghĩa là để kết nối SSH được thiết lập, máy tính từ xa phải chạy một phần mềm được gọi là daemon SSH. Phần mềm này lắng nghe các kết nối trên một cổng mạng cụ thể, xác thực các yêu cầu kết nối và tạo ra môi trường thích hợp nếu người dùng cung cấp thông tin đăng nhập chính xác.

- Máy tính của người dùng phải có một máy khách SSH. Đây là một phần mềm biết cách giao tiếp bằng giao thức SSH và có thể được cung cấp thông tin về máy chủ lưu trữ từ xa để kết nối, tên người dùng để sử dụng và thông tin đăng nhập cần được chuyển để xác thực. Máy khách cũng có thể chỉ định một số chi tiết nhất định về kiểu kết nối mà họ muốn thiết lập

# Cách SSH xác thực người dùng

Khách hàng thường xác thực bằng mật khẩu (kém an toàn hơn và không được khuyến nghị) hoặc khóa SSH, rất an toàn.

Mật khẩu đăng nhập được mã hóa và dễ hiểu cho người dùng mới. Tuy nhiên, các bot tự động và người dùng độc hại sẽ thường xuyên cố gắng xác thực các tài khoản cho phép đăng nhập dựa trên mật khẩu, điều này có thể dẫn đến các thỏa hiệp bảo mật. Vì lý do này, chúng tôi khuyên bạn nên luôn thiết lập xác thực dựa trên khóa SSH cho hầu hết các cấu hình.


# Hướng dẫn sử dụng SSH KEY

## Tìm hiểu về SSH Key

SSH Keys là một phương thức xác thực đăng nhập với máy chủ thông qua truy cập SSH bằng việc đối chiếu giữa một cặp keys (Private và Public Key)

# 1. SSH Key là gì? (Secure Shell)

![anh1](https://image.prntscr.com/image/8XRie4JxTiilZ8uPyCAkKA.png)

- SSH Keys là một phương thức xác thực đăng nhập với máy chủ thông qua truy cập SSH bằng việc đối chiếu giữa một cặp keys, bao gồm một khóa riêng tư (private key) và khóa công khai (public key) tương ứng. SSH Keys sử dụng giao thức xác thực hỏi và trả lời trong đó một bên trình bày một câu hỏi và một bên khác phải cung cấp một câu trả lời hợp lệ để được chứng thực.

- Thông thường, một người dùng đăng nhập VPS thông qua username root và password của user đó. Người dùng có thể mất quyền truy cập VPS nếu bị quên hoặc để lộ mật khẩu hay bị dò tìm mật khẩu qua Brute Force Attack. Do đó, việc sử dụng SSH Keys sẽ bảo mật hơn rất nhiều so với phương pháp đăng nhập dùng mật khẩu truyền thống.

- Một cách đơn giản ta có thể so sánh Private Key như là chìa khóa còn Public Key là ổ khóa

# 2. Các thành phần của SSH Key

- Khi tạo ra một SSH Key, bạn cần biết sẽ có 3 thành phần
   - Public Key : Bạn sẽ copy ký tự key này sẽ bỏ vào file ~/.ssh/authorized_keys trên server của bạn.
   - Private Key : Bạn sẽ lưu file này vào máy tính, sau đó sẽ thiết lập phiên ssh sử dụng key này để có thể login.
   - Keypharse : Mật khẩu để mở private key, khi đăng nhập vào server nó sẽ hỏi cái này (Nếu không đặt pass cho private key thì có thể bỏ qua)

# 3. Nguyên tắc hoạt động của ssh key

- Private key và Public key luôn có liên hệ chặt chẽ với nhau để nó có thể nhận diện lẫn nhau. Khi tạo một SSH Key thì người dùng sẽ có cả 2 loại key này. Sau đó người dùng mang public key upload lên máy chủ của mình, còn cái private key của người dùng sẽ lưu ở máy và khi đăng nhập vào server, người dùng sẽ gửi yêu cầu đăng nhập kèm theo cái Private Key này để gửi tín hiệu đến server, server sẽ kiểm tra xem cái Private key của người dùng có khớp với Public key có trên server hay không, nếu có thì bạn sẽ đăng nhập được

4. Cơ chế hoạt động
Một phiên làm việc của SSH đều phải trải qua 4 bước:

- Thiết lập kết nối ban đầu (SSH-TRANS)
- Tiến hành xác thực (SSH-AUTH)
- Mở phiên kết nối để thực hiện các dịch vụ (SSH-CONN)
- Chạy các ứng dụng SSH (Có thể là SSH-SFTP, SCP)

SSH-TRANS: là khối xây dựng cơ bản cung cấp kết nối ban đầu, ghi chép giao thức, xác thực server, mã hóa cơ bản và bảo toàn dữ liệu. Sau khi thiết lập kết nối, client có một kết nối độc lập và bảo mật

Sau đó, client dùng SSH-AUTH để xác thực đến server. SSH-AUTH yêu cầu một phương thức: Public key với thuật toán DSA. Ngoài ra, sử dụng mật khẩu và hostbased

Sau khi xác thực, SSH client yêu cầu SSH-CONN để cung cấp một kênh riêng biệt qua SSH-TRANS

Ngoài ra, còn cung cấp các dịch vụ như Remote Login and Command Execution, agent fowarding, files transfer, TCP port fowarding, X fowarding,...

Cuối cùng, một ứng dụng có thể sử dụng SSH-SFTP hoặc SCP truyền file hoặc thao tác remote từ xa

5. SSH Key

Khi tạo ra một SSH Key, bạn cần biết sẽ có 3 thành phần quan trọng như sau:

- Public Key (dạng file và string) – Bạn sẽ copy ký tự key này sẽ bỏ vào file ~/.ssh/authorized_keys trên server của bạn.
- Private Key (dạng file và string) – Bạn sẽ lưu file này vào máy tính, sau đó sẽ thiết lập cho PuTTY, WinSCP, MobaXterm,..để có thể login.
- Keypharse (dạng string, cần ghi nhớ) – Mật khẩu để mở private key, khi đăng nhập vào server nó sẽ hỏi cái này.

6. Cách thức hoạt động của SSH Keys

- SSH key pairs là một cặp khóa được mã hóa có thể được dùng để xác thực giữa client và server. Mỗi một cặp khóa sẽ có public key và private key. Private key được giữ ở phía client và phải được bảo mật tuyệt đối. Nếu có được private key, attackers hoàn toàn có thể truy cập vào server. Cũng vì thế nó được mã hóa với passphrase.

- Public key có thể được chia sẻ và phân tán rộng rãi bởi nó được dùng để mã hóa các tin nhắn mà chỉ private key mới giải mã được. Public key sẽ được upload lên phía server và được lưu tại thư mục người dùng (~/.ssh/authorized_keys).

- Khi có client muốn xác thực bằng SSH keys, server có thể test xem client đó có giữ private key hay không. Nếu client chứng minh được nó có private key thì kết nối có thể được thiết lập.

![anh2](https://image.prntscr.com/image/rbZwEK9lQL_hsZVYVNE7MA.png)

