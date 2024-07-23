import 'package:flutter/material.dart';
import 'package:project_android/Data/API/api.dart';
import 'package:project_android/Data/model/category.dart';

class EditSuatChieuScreen extends StatefulWidget {
  final int? maSC;
  final int? maPhim;
  const EditSuatChieuScreen({required this.maSC, required this.maPhim});
  @override
  _EditSuatChieuScreenState createState() => _EditSuatChieuScreenState();
}

class _EditSuatChieuScreenState extends State<EditSuatChieuScreen> {
  late TextEditingController maPhimController;
  late TextEditingController thoiGianBDController;
  late TextEditingController thoiGianKTController;
  late TextEditingController ngayChieuController;
  late TextEditingController rapChieuController;

  @override
  void initState() {
    super.initState();
    maPhimController = TextEditingController(text: widget.maPhim.toString());
    thoiGianBDController = TextEditingController();
    // Assuming phone and id are also part of the user data
    thoiGianKTController = TextEditingController();
    ngayChieuController = TextEditingController();
    rapChieuController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sửa suất chiếu',
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
            // _buildTextField(maSCController, 'Mã Suất Chiếu'),
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
                    _editsuatChieu();
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF790000), // Màu nền của nút
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0), // Độ bo góc
                    ),
                  ),
                  child: const Text(
                    'Cập nhật',
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

  void _editsuatChieu() async {
    widget.maSC;
    final maPhim = maPhimController.text;
    final thoigianBD = thoiGianBDController.text;
    final thoigianKT = thoiGianKTController.text;
    final ngayChieu = ngayChieuController.text;
    final rapChieu = rapChieuController.text;

    try {
      await editSC(
          widget.maSC, maPhim, thoigianBD, thoigianKT, ngayChieu, rapChieu);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sửa suất chiếu thành công')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add SC: $e')),
      );
    }
  }
}
