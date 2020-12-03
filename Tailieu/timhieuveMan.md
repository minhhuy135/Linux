- Làm việc với các trang tệp tin chương này sẽ giải thích việc sử dụng các trang nam (còn gọi là các trang thủ công) trên Unix của bạn hoặc máy tính Linux.
Bạn sẽ học lệnh man cùng với các lệnh liên quan như whereis, whatis
và mandb.
Hầu hết các tệp và lệnh Unix đều có các trang hướng dẫn khá tốt để giải thích việc sử dụng chúng. Đàn ông
các trang cũng có ích khi bạn đang sử dụng nhiều phiên bản Unix hoặc một số Linux
phân phối vì các tùy chọn và thông số đôi khi khác nhau

TÊN
        ls - liệt kê nội dung thư mục

TÓM TẮC
        ls [OPTION] ... [FILE] ...

SỰ MIÊU TẢ
        Liệt kê thông tin về các FILE (thư mục hiện tại theo mặc định).
        Sắp xếp các mục nhập theo thứ tự bảng chữ cái nếu không có -cftuvSUX hoặc --sort nào là cụ thể‐
        bị phạt.

        Đối số bắt buộc đối với tùy chọn dài là bắt buộc đối với tùy chọn ngắn
        quá.

        -a, - tất cả
               không bỏ qua các mục bắt đầu bằng.

        -A, - hầu hết-tất cả
               không liệt kê ngụ ý. và ..

        - tác giả
               với -l, in tác giả của mỗi tệp

               -b, - cảnh quan
               in lối thoát kiểu C cho các ký tự phi đồ họa

        --block-size = SIZE
               quy mô kích thước theo SIZE trước khi in chúng; ví dụ: '--block-size = M'
               in kích thước theo đơn vị 1.048.576 byte; xem định dạng SIZE bên dưới

        -B, - sao lưu lớn
               không liệt kê các mục nhập ngụ ý kết thúc bằng ~

        -c với -lt: sắp xếp theo và hiển thị, ctime (thời gian sửa đổi cuối cùng của
               thông tin trạng thái tệp); with -l: hiển thị ctime và sắp xếp theo tên;
               nếu không: sắp xếp theo ctime, mới nhất trước

        -C danh sách các mục theo cột

        --color [= WHEN]
               tô màu đầu ra; WHEN có thể là 'không bao giờ', 'tự động' hoặc 'luôn luôn'
               (mặc định); thêm thông tin bên dưới

        -d, --directory
               liệt kê bản thân các thư mục, không phải nội dung của chúng

               -D, --dired
               tạo đầu ra được thiết kế cho chế độ dired của Emacs

        -nếu không sắp xếp, bật -aU, tắt -ls - màu

        -F, - phân loại
               nối chỉ báo (một trong các * / => @ |) vào các mục nhập

        --loại tệp
               tương tự như vậy, ngoại trừ không nối thêm '*'

        --format = WORD
               qua -x, dấu phẩy -m, ngang -x, dài -l, cột đơn -1,
               tiết -l, dọc -C

        --toàn thời gian
               like -l --time-style = full-iso

        -g thích -l, nhưng không liệt kê chủ sở hữu

        - nhóm-thư mục-đầu tiên
               nhóm thư mục trước tệp;
               có thể được tăng cường với tùy chọn --sort, nhưng bất kỳ việc sử dụng nào
               --sort = none (-U) tắt tính năng nhóm

        -G, --không có nhóm
               trong một danh sách dài, không in tên nhóm

        -h, - con người có thể đọc được
               với -l, kích thước in ở định dạng con người có thể đọc được (ví dụ: 1K 234M 2G)

        --cũng tương tự, nhưng sử dụng lũy thừa 1000 chứ không phải 1024

        -H, --dereference-command-line
               theo các liên kết tượng trưng được liệt kê trên dòng lệnh

        --dereference-command-line-symlink-to-dir
               theo từng liên kết biểu tượng dòng lệnh

               nó trỏ đến một thư mục

        --hide = PATTERN
               không liệt kê các mục nhập ngụ ý khớp với shell PATTERN (bị ghi đè
               bởi -a hoặc -A)

               --indicator-style = WORD
               nối chỉ báo với kiểu WORD vào tên mục nhập: none (mặc định),
               dấu gạch chéo (-p), kiểu tệp (- kiểu tệp), phân loại (-F)

        -i, --inode
               in số chỉ mục của mỗi tệp

        -Tôi, --ignore = PATTERN
               không liệt kê các mục nhập ngụ ý khớp với shell PATTERN

        -k, --kibibyte
               mặc định là khối 1024 byte để sử dụng đĩa

        -l sử dụng định dạng danh sách dài

        -L, - hội nghị
               khi hiển thị thông tin tệp cho một liên kết tượng trưng, hãy hiển thị thông tin
               đối với tệp, liên kết tham chiếu thay vì liên kết
               chinh no

        -m điền chiều rộng với một danh sách các mục nhập được phân tách bằng dấu phẩy

        -n, --numeric-uid-gid
               như -l, nhưng liệt kê ID nhóm và người dùng bằng số

        -N, --literal
               in tên mục nhập thô (không xử lý, ví dụ: các ký tự điều khiển
               thân ái)

        -o thích -l, nhưng không liệt kê thông tin nhóm

        -p, --indicator-style = gạch chéo
               nối / chỉ báo vào thư mục

        -q, --hide-control-chars
               in? thay vì các nhân vật phi đồ họa

        --show-control-chars
               hiển thị các ký tự phi đồ họa nguyên trạng (mặc định, trừ khi chương trình là
               'ls' và đầu ra là một thiết bị đầu cuối)

        -Q, - trích-tên
               đặt tên mục nhập trong dấu ngoặc kép

        --quoting-style = WORD
        sử dụng kiểu trích dẫn WORD cho tên mục nhập: nghĩa đen, ngôn ngữ, trình bao,
               shell-always, c, thoát

        -r, - ngược
               đảo ngược thứ tự trong khi sắp xếp

        -R, --recursive
               liệt kê các thư mục con một cách đệ quy

        -s, - kích thước
               in kích thước được phân bổ của mỗi tệp, theo khối

        -S sắp xếp theo kích thước tệp

        --sort = WORD
               sắp xếp theo WORD thay vì tên: none (-U), size (-S), time (-t),
               phiên bản (-v), phần mở rộng (-X)

        --time = WORD
               với -l, hiển thị thời gian dưới dạng WORD thay vì thời gian sửa đổi mặc định:
               atime hoặc truy cập hoặc sử dụng (-u) ctime hoặc status (-c); cũng sử dụng spec
               ified time dưới dạng khóa sắp xếp nếu --sort = time
               --time-style = STYLE
               với -l, hiển thị thời gian sử dụng kiểu STYLE: full-iso, long-iso, iso,
               ngôn ngữ hoặc + ĐỊNH DẠNG; FORMAT được hiểu giống như trong 'date'; nếu
               FORMAT là FORMAT1 <newline> FORMAT2, sau đó FORMAT1 áp dụng cho
               các tệp không phải gần đây và FORMAT2 đến các tệp gần đây; nếu STYLE là trước‐
               cố định bằng 'posix-', STYLE chỉ có hiệu lực bên ngoài POSIX
               ngôn ngữ

        -t sắp xếp theo thời gian sửa đổi, mới nhất trước

        -T, --tabsize = COLS
               giả sử tab dừng ở mỗi COLS thay vì 8

        -u với -lt: sắp xếp và hiển thị, thời gian truy cập; with -l: hiển thị quyền truy cập
               thời gian và sắp xếp theo tên; nếu không: sắp xếp theo thời gian truy cập

        -U không sắp xếp; liệt kê các mục theo thứ tự thư mục

        -v sắp xếp tự nhiên của (phiên bản) số trong văn bản

        -w, - width = COLS
               giả sử chiều rộng màn hình thay vì giá trị hiện tại

        -x mục nhập danh sách theo dòng thay vì theo cột

        -X sắp xếp theo thứ tự bảng chữ cái theo phần mở rộng mục nhập

        -1 liệt kê một tệp trên mỗi dòng

        Tùy chọn SELinux:

        --lcontext
               Hiển thị ngữ cảnh bảo mật. Bật -l. Các dòng có thể sẽ
               quá rộng cho hầu hết các màn hình.

        -Z, --context
               Hiển thị ngữ cảnh bảo mật để nó phù hợp trên hầu hết các màn hình. Hiển thị
               chỉ chế độ, người dùng, nhóm, ngữ cảnh bảo mật và tên tệp.

        --scontext
               Chỉ hiển thị ngữ cảnh bảo mật và tên tệp.

               --help hiển thị trợ giúp này và thoát

        --phiên bản
               xuất thông tin phiên bản và thoát

        SIZE là một số nguyên và đơn vị tùy chọn (ví dụ: 10M là 10 * 1024 * 1024).
        Các đơn vị là K, M, G, T, P, E, Z, Y (lũy thừa của 1024) hoặc KB, MB, ... (pow‐
        ers của 1000).

        Sử dụng màu để phân biệt các loại tệp bị tắt theo mặc định và
        với --color = không bao giờ. Với --color = auto, ls chỉ phát ra mã màu khi
        đầu ra tiêu chuẩn được kết nối với một thiết bị đầu cuối. Môi trường LS_COLORS
        biến có thể thay đổi cài đặt. Sử dụng lệnh dircolors để đặt nó.
        2 nếu sự cố nghiêm trọng (ví dụ: không thể truy cập đối số dòng lệnh).

        Trợ giúp trực tuyến về coreutils GNU: <http://www.gnu.org/software/coreutils/>
        Báo cáo lỗi dịch của ls cho <http://translationproject.org/team/>

TÁC GIẢ
        Viết bởi Richard M. Stallman và David MacKenzie.

BẢN QUYỀN
        Bản quyền © 2013 Free Software Foundation, Inc. Giấy phép GPLv3 +: GNU
        GPL phiên bản 3 trở lên <http://gnu.org/licenses/gpl.html>.
        Đây là phần mềm miễn phí: bạn có thể tự do thay đổi và phân phối lại nó.
        KHÔNG CÓ BẢO HÀNH trong phạm vi pháp luật cho phép.

XEM THÊM
        Tài liệu đầy đủ cho ls được duy trì dưới dạng sổ tay Texinfo. Nếu
        thông tin và chương trình ls được cài đặt đúng cách trên trang web của bạn, com‐
        ủy thác

               thông tin coreutils 'ls invocation'

        sẽ cung cấp cho bạn quyền truy cập vào hướng dẫn hoàn chỉnh.

GNU coreutils 8.22 tháng tám, 2019 LS (1)

## 7.1. man $command
man command trong Linux được sử dụng để hiển thị hướng dẫn sử dụng của bất kỳ lệnh nào mà chúng ta có thể chạy trên terminal. Nó cung cấp một cái nhìn chi tiết về lệnh bao gồm TÊN, TỔNG HỢP, MÔ TẢ, TÙY CHỌN, TÌNH TRẠNG THOÁT, TRẢ LẠI GIÁ TRỊ, LỖI, LỌC, PHIÊN BẢN, VÍ DỤ, TÁC GIẢ và XEM CŨNG 

'''
paul @ laika: ~ $man whois

Đang định dạng lại whois (1),vui lòng đợi ...
'''
## 7.2. man $configfile
man.config - dữ liệu cấu hình cho người đàn ông
Sự miêu tả
Tệp này được đọc bởi người đàn ông (1) và chứa (a) thông tin về cách tạo đường dẫn tìm kiếm cho người đàn ông, (b) tên đường dẫn đầy đủ cho các chương trình khác nhau như nroff, eqn, tbl, v.v. được sử dụng bởi người đàn ông và (c) danh sách có trình giải nén cho các tệp có phần mở rộng nhất định. Một phiên bản thay thế của tệp này có thể được chỉ định bằng

man -C private_man.config ...
Tên lệnh có thể được cung cấp với các tùy chọn. Các tùy chọn hữu ích để nroff có thể được tìm thấy trong grotty (1) . Ví dụ: thay vì dòng mặc định

NROFF / usr / bin / groff -mandoc -Tlatin1

## 7.3. man $daemon

 Daemon là một quy trình dịch vụ chạy ở chế độ nền và
       giám sát hệ thống hoặc cung cấp chức năng cho các quy trình khác.
       Theo truyền thống, các daemon được triển khai theo một lược đồ có nguồn gốc
       trong SysV Unix. Daemon hiện đại nên làm theo một cách đơn giản hơn nhưng nhiều hơn
       lược đồ mạnh mẽ (ở đây được gọi là daemon "kiểu mới"), được triển khai bởi
       systemd (1) . Trang hướng dẫn sử dụng này bao gồm cả hai chương trình và cụ thể là
       bao gồm các khuyến nghị cho các daemon sẽ được bao gồm trong
       hệ thống init systemd.
