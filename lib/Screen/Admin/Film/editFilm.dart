import 'package:flutter/material.dart';

class EditFilmPage extends StatefulWidget {
  @override
  _EditFilmPageState createState() => _EditFilmPageState();
}

class _EditFilmPageState extends State<EditFilmPage> {
  // Các controller để lấy giá trị từ các TextField
  final TextEditingController maPhimController = TextEditingController();
  final TextEditingController tenPhimController = TextEditingController();
  final TextEditingController anhPhimController = TextEditingController();
  final TextEditingController daoDienController = TextEditingController();
  final TextEditingController ngonNguController = TextEditingController();
  final TextEditingController maSuatChieuController = TextEditingController();
  final TextEditingController thoiGianBDController = TextEditingController();
  final TextEditingController thoiGianKTController = TextEditingController();
  final TextEditingController ngayChieuController = TextEditingController();
  final TextEditingController rapChieuController = TextEditingController();

  // Danh sách thể loại
  final List<String> categories = [
    'Hành Động',
    'Hài Hước',
    'Kinh Dị',
    'Tình Cảm',
    'Khoa Học Viễn Tưởng',
    'Hoạt Hình',
  ];

  String? selectedCategory; // Biến để lưu thể loại được chọn

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chỉnh sửa phim', // Đổi tiêu đề thành "Chỉnh sửa phim"
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Quay lại trang trước
          },
        ),
        backgroundColor: Color(0xFF790000),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Thông tin phim',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildTextField(maPhimController, 'Mã Phim'),
            _buildTextField(tenPhimController, 'Tên Phim'),
            _buildTextField(anhPhimController, 'Ảnh Phim (URL)'),
            _buildTextField(daoDienController, 'Đạo Diễn'),
            _buildDropdown(), // Sử dụng Dropdown cho Mã Thể Loại
            _buildTextField(ngonNguController, 'Ngôn Ngữ'),
            const SizedBox(height: 32),
            const Text(
              'Thông tin suất chiếu',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildTextField(maSuatChieuController, 'Mã Suất Chiếu'),
            _buildTextField(thoiGianBDController, 'Thời Gian Bắt Đầu'),
            _buildTextField(thoiGianKTController, 'Thời Gian Kết Thúc'),
            _buildTextField(ngayChieuController, 'Ngày Chiếu'),
            _buildTextField(rapChieuController, 'Rạp Chiếu'),
            const SizedBox(height: 32),
            Center(
              child: SizedBox(
                width: 200, // Đặt chiều rộng mong muốn
                height: 50, // Đặt chiều cao mong muốn
                child: ElevatedButton(
                  onPressed: () {
                    // Xử lý sửa phim
                    _editFilm();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF790000), // Màu nền của nút
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0), // Độ bo góc
                    ),
                  ),
                  child: const Text(
                    'Lưu Thay Đổi', // Đổi tên nút thành "Lưu Thay Đổi"
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget tạo TextField
  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
        ),
      ),
    );
  }

  // Widget tạo Dropdown cho Mã Thể Loại
  Widget _buildDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        value: selectedCategory,
        decoration: InputDecoration(
          labelText: 'Mã Thể Loại',
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
        ),
        items: categories.map((String category) {
          return DropdownMenuItem<String>(
            value: category,
            child: Text(category),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedCategory = newValue; // Cập nhật thể loại được chọn
          });
        },
        isExpanded: true,
        hint: const Text('Chọn thể loại'),
      ),
    );
  }

  // Hàm xử lý sửa phim
  void _editFilm() {
    // Lấy dữ liệu từ các controller
    final maPhim = maPhimController.text;
    final tenPhim = tenPhimController.text;
    final anhPhim = anhPhimController.text;
    final daoDien = daoDienController.text;
    final maTL = selectedCategory; // Lấy thể loại từ dropdown
    final ngonNgu = ngonNguController.text;
    final maSuatChieu = maSuatChieuController.text;
    final thoiGianBD = thoiGianBDController.text;
    final thoiGianKT = thoiGianKTController.text;
    final ngayChieu = ngayChieuController.text;
    final rapChieu = rapChieuController.text;

    // Thực hiện sửa phim (có thể thêm vào database hoặc xử lý khác)
    print('Sửa phim thành công: $tenPhim');
    // Có thể hiển thị thông báo cho người dùng sau khi sửa thành công
  }
}