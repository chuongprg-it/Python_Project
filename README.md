# Python_Project
Đồ án môn "Kỹ thuật lập trình Python"
# Giới thiệu
Đồ án này tập trung vào xây dựng một website bán ô tô cũ, sử dụng các mô hình Machine learning và Framework Django nhằm cung cấp giải pháp tối ưu cho quá trình mua bán xe ô tô cũ trực tuyến.
Đồ án này nhằm tạo ra một website đơn giản và hiệu quả để người dùng có thể mua và bán xe ô tô cũ một cách thuận tiện. Bằng cách sử dụng Django, một kiến trúc ứng dụng web linh hoạt và dễ dàng quản lý đã được xây dựng. Mô hình MVT (Model-View-Template) trong Django đã giúp tách biệt logic xử lý dữ liệu, giao diện người dùng và quản lý dữ liệu một cách rõ ràng và dễ dàng mở rộng.
Đồ án này đã áp dụng các mô hình machine learning vào website để tạo ra các công cụ và giải pháp thông minh. Việc triển khai các mô hình học máy, các thư viện phổ biến đã được sử dụng như: Scikit-learn, Pandas, Matplotlib, Numpy, TensorFlow và Keras. Các mô hình máy học được sử dụng bao gồm Linear regression, Random Forest, Decision Tree, Gradient Boosting và CNN (Convolutional Neural Network). Chúng đóng vai trò quan trọng trong việc xác định giá trị thực của các loại xe ô tô cũ, tư vấn cho người dùng về giá trị xe và giúp khách hàng có được sự chọn lựa thông minh, phù hợp với tài chính của mình.
Kết quả đạt được là một website bán xe ô tô cũ với tính năng thông minh nhờ sự áp dụng của các mô hình Machine learning. Người dùng có thể xem thông tin chi tiết về các loại xe ô tô cũ, bao gồm hình ảnh, thông số kỹ thuật và mô tả chi tiết về tình trạng của xe. Điều này giúp người dùng có thể đưa ra quyết định mua xe dựa trên thông tin đáng tin cậy và đầy đủ. 
# Hướng dẫn chạy đồ án
1. Thiết lập môi trường ảo và cài các thư viện.
- Cài đặt virtualenv lên máy: pip install virtualenv.
- Mở thư mục dự án trong Visual Studio Code.
- Tạo một môi trường ảo bằng lệnh : virtualenv env (trong đó env là tên môi trường ảo ).
- Kích hoạt môi trường ảo bằng lệnh : .\env\Scripts\activate hoặc venv\Scripts\activate.bat   (Windows)
- Chạy lệnh pip install -r requirements.txt  để cài các thư viện được liệt kê trong file requirements.txt
2. Kết nối cơ sở dữ liệu MySQL
- Sử dụng phần mềm XAMP để dùng phpMyAdmin (có thể dùng hệ quản trị khác ).
- Mở phpMyAdmin và tạo cơ sở dữ liệu có tên là “Car”.
- Copy toàn bộ nội dung file car.sql và thực thi.
- Kết nối cơ sở dữ liệu với các thông số sau trong file settings.py 
 ![image](https://github.com/chuongprg-it/Website-Selling-used-cars-with-machine-learning-application/assets/130327266/cf2bfde0-9dd3-4a59-aa93-2d6c15686159)

Trong đó: 
+ PORT: 3306 là cổng kết nối mặc định đến MySQL.
+ các thông số còn lại thì cấu hình đúng với hệ quản trị.
3. Khởi chạy server
- Kích hoạt môi trường ảo : .\env\Scripts\activate
- Chạy ứng dụng : python manage.py runserver
