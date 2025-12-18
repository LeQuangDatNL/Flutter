# Flutter Multi-Screen Demo App

Ứng dụng Flutter này là một **multi-screen demo** với nhiều màn hình khác nhau, giúp người dùng tham khảo và thử nghiệm các tính năng cơ bản của Flutter như navigation, list, API call, và UI component. 

## Mục tiêu
- Tạo một danh sách các màn hình (screens) Flutter và có thể chuyển đến từng màn hình.
- Demo các màn hình với tính năng khác nhau như: login, đăng ký, hotel booking, BMI calculator, Google Classroom interface, product & post management, phản hồi form,...
- Hỗ trợ thử nghiệm trên nhiều thiết bị nhờ tích hợp **Device Preview**.

## Các màn hình trong ứng dụng
1. **ColorScreen** – Demo các màu sắc.
2. **DangNhap** – Màn hình đăng nhập.
3. **DangKy** – Màn hình đăng ký.
4. **DanhGiaBMI** – Tính BMI và hiển thị kết quả.
5. **TrangChu** – Màn hình chính (home screen).
6. **HotelBooking** – Danh sách khách sạn với thông tin chi tiết.
7. **GoogleClassroom** – Giao diện mô phỏng Google Classroom.
8. **NumberScreen** – Demo danh sách số.
9. **MyProduct** – Quản lý sản phẩm (kết nối API).
10. **MyPost** – Quản lý bài viết (kết nối API).
11. **FormPhanHoi** – Form phản hồi người dùng.
12. **IntroductoryOeschinenLake** – Màn hình giới thiệu về địa điểm du lịch.
13. **DangNhapVaoProfile** – Đăng nhập vào profile người dùng.

## Công nghệ & Thư viện sử dụng
- **Flutter**: Framework chính.
- **Material Design**: Giao diện chuẩn của Flutter.
- **Device Preview**: Cho phép preview ứng dụng trên nhiều thiết bị khác nhau.
- **Custom API Services**: `ApiPost` và `ApiProduct` để gọi dữ liệu từ backend.
