import 'package:flutter/material.dart';
import 'package:project_android/Data/API/api.dart';
import 'package:project_android/Data/model/category.dart';

class EditFilmPage extends StatefulWidget {
  final int maPhim;
  final String tenPhim;
  final String anhPhim;
  final String daoDien;
  final String ngonNgu;
  final String moTa;
  const EditFilmPage(
      {required this.maPhim,
      required this.tenPhim,
      required this.anhPhim,
      required this.daoDien,
      required this.moTa,
      required this.ngonNgu});
  @override
  _EditFilmPageState createState() => _EditFilmPageState();
}

class _EditFilmPageState extends State<EditFilmPage> {
  late TextEditingController tenPhimController;
  late TextEditingController anhPhimController;
  late TextEditingController daoDienController;
  late TextEditingController ngonNguController;
  late TextEditingController moTaController;

  List<Category> _categories = [];
  Category? _selectedCategory;

  @override
  void initState() {
    super.initState();
    _fetchCategories();
    tenPhimController = TextEditingController(text: widget.tenPhim);
    anhPhimController = TextEditingController(text: widget.anhPhim);
    daoDienController = TextEditingController(text: widget.daoDien);
    ngonNguController = TextEditingController(text: widget.ngonNgu);
    moTaController = TextEditingController(text: widget.moTa);
  }

  Future<void> _fetchCategories() async {
    try {
      List<dynamic> categoryData = await getCategories();
      setState(() {
        _categories =
            categoryData.map((data) => Category.fromJson(data)).toList();
      });
    } catch (e) {
      print('Failed to load categories: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sửa phim',
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
              'Thông tin phim',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // _buildTextField(maPhimController, 'Mã Phim'),
            _buildTextField(tenPhimController, 'Tên Phim'),
            _buildTextField(anhPhimController, 'Ảnh Phim (URL)'),
            _buildTextField(daoDienController, 'Đạo Diễn'),
            _buildDropdown(), // Sử dụng Dropdown cho Mã Thể Loại
            _buildTextField(ngonNguController, 'Ngôn Ngữ'),
            _buildTextField(moTaController, 'Mô tả'),
            const SizedBox(height: 32),
            Center(
              child: SizedBox(
                width: 200, // Đặt chiều rộng mong muốn
                height: 50, // Đặt chiều cao mong muốn
                child: ElevatedButton(
                  onPressed: () {
                    _editFilm();
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF790000), // Màu nền của nút
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0), // Độ bo góc
                    ),
                  ),
                  child: const Text(
                    'Cập nhật ',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
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

  Widget _buildDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<Category>(
        value: _selectedCategory,
        decoration: const InputDecoration(
          labelText: 'Mã Thể Loại',
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 10.0,
          ),
        ),
        items: _categories.map((Category category) {
          return DropdownMenuItem<Category>(
            value: category,
            child: Text(category.tenTL),
          );
        }).toList(),
        onChanged: (Category? newValue) {
          setState(() {
            _selectedCategory = newValue;
          });
        },
        isExpanded: true,
        hint: const Text('Chọn thể loại'),
      ),
    );
  }

  void _editFilm() async {
    widget.maPhim;
    final tenPhim = tenPhimController.text;
    final anhPhim = anhPhimController.text;
    final daoDien = daoDienController.text;
    final int? maTL = _selectedCategory!.maTL;
    final ngonNgu = ngonNguController.text;
    final mota = moTaController.text;
    try {
      await editFilm(
          widget.maPhim, tenPhim, anhPhim, daoDien, maTL, ngonNgu, mota);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Chỉnh sửa phim thành công')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to edit film: $e')),
      );
    }
  }
}
