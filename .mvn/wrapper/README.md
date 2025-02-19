# Hướng dẫn Tạo và Cấu hình Database Schema cho Dự án

Để đảm bảo hệ thống hoạt động tốt và kết nối chính xác với cơ sở dữ liệu, mọi người vui lòng làm theo các bước dưới đây.

## Lưu ý quan trọng

- **Mọi người phải Clone Repository thay vì Pull vào file đang có**:
  - Mọi người nên **clone** repository về máy thay vì **pull** vào file đang có trên máy tránh bị xung đột hoặc mất code.
  - Khi clone, bạn sẽ có một bản sao sạch để làm việc, giúp tránh xung đột khi nhiều người làm việc trên nhánh gốc.
  - Để clone repository, hãy sử dụng lệnh:
    ```bash
    git clone <url_repository>
    git checkout duong
    ```
  - Sau khi clone, hãy tạo một nhánh mới để làm việc và commit vào nhánh đó. Việc này là để giúp dễ dàng quản lý các thay đổi và tránh làm thay đổi nhánh chính hay nhánh của thành viên khác.

  Ví dụ:
  ```bash
  git checkout -b feature-xyz


## Bước 1: Tạo Schema Mới trong Cơ sở Dữ liệu

1. **Mở project và tìm file 'application.properties'**:
   - Nội dung file là:
    spring.application.name=ExploreVietnamTour
    spring.jpa.hibernate.ddl-auto=update
    spring.datasource.url=jdbc:mysql://${MYSQL_HOST:localhost}:3306/**explore_vietnamt_tour_v2** <== Tên schema
    spring.datasource.username=**root** <== Tên đăng nhặp MySQL
    spring.datasource.password=**123456** <== Mk đăng nhập MySQL
    spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
    spring.jpa.show-sql: true

2. **Tạo một schema mới**:
   - Chạy câu lệnh SQL dưới đây để tạo schema mới:
     ```sql
     CREATE DATABASE <tên_schema>;
   
   - Chạy câu lệnh SQL dưới đây để tạo schema mới

   Hoặc mọi người có thể click chuột phải và chọn Create Schema và copy tên vào rồi chạy

## Bước 2: Kiểm tra lại cấu hình Springboot và chạy dự án

1. **Kiểm tra `application.properties` dự án**:
   - Mở file `application.properties` .
   - Kiểm tra 3 mục gồm: Tên đăng nhập, Mk đăng nhập và tên schema đã chính xác chưa

2. **Chạy dự án**
   - Cho chạy dự án ở Springboot.
   - Refresh lại schema để tải lại các bảng.
   - Nếu các bảng xuất hiện tức là mọi người đã thành công