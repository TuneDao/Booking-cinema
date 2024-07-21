import 'package:flutter/material.dart';
import 'package:project_android/Data/API/api.dart';
import 'package:project_android/Data/model/category.dart';

class AddSuatChieuScreen extends StatefulWidget {
  @override
  _AddSuatChieuScreenState createState() => _AddSuatChieuScreenState();
}

class _AddSuatChieuScreenState extends State<AddSuatChieuScreen> {
  final TextEditingController maSCController = TextEditingController();
  final TextEditingController maPhimController = TextEditingController();
  final TextEditingController thoiGianBDController = TextEditingController();
  final TextEditingController thoiGianKTController = TextEditingController();
  final TextEditingController ngayChieuController = TextEditingController();
  final TextEditingController rapChieuController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Thêm suất chiếu',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context); // Quay lại trang trước
          },
        ),
        backgroundColor: const Color(0xFF790000),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Thông tin suất chiếu',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildTextField(maSCController, 'Mã Suất Chiếu'),
            _buildTextField(maPhimController, 'Mã Phim'),
            _buildTextField(thoiGianBDController, 'Thời gian bắt đầu'),
            _buildTextField(thoiGianKTController, 'Thời gian kết thúc'),
            _buildTextField(ngayChieuController, 'Ngày chiếu'),
            _buildTextField(rapChieuController, 'Rạp chiếu'),
            const SizedBox(height: 32),
            const SizedBox(height: 32),
            Center(
              child: SizedBox(
                width: 200, // Đặt chiều rộng mong muốn
                height: 50, // Đặt chiều cao mong muốn
                child: ElevatedButton(
                  onPressed: () {
                    _addsuatChieu();
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF790000), // Màu nền của nút
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0), // Độ bo góc
                    ),
                  ),
                  child: const Text(
                    'Thêm Suất Chiếu',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 10.0,
          ),
        ),
      ),
    );
  }

  void _addsuatChieu() async {
    final maSC = maSCController.text;
    final maPhim = maPhimController.text;
    final thoigianBD = thoiGianBDController.text;
    final thoigianKT = thoiGianKTController.text;
    final ngayChieu = ngayChieuController.text;
    final rapChieu = rapChieuController.text;

    try {
      await addSuatChieu(
          maSC, maPhim, thoigianBD, thoigianKT, ngayChieu, rapChieu);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Thêm suất chiếu thành công')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add film: $e')),
      );
    }
  }
}
