// import 'package:flutter/material.dart';
// import 'package:project_android/Data/API/api.dart';
// import 'package:project_android/Data/model/category.dart';

// class AddFilmPage extends StatefulWidget {
//   @override
//   _AddFilmPageState createState() => _AddFilmPageState();
// }

// class _AddFilmPageState extends State<AddFilmPage> {
//   final TextEditingController maPhimController = TextEditingController();
//   final TextEditingController tenPhimController = TextEditingController();
//   final TextEditingController anhPhimController = TextEditingController();
//   final TextEditingController daoDienController = TextEditingController();
//   final TextEditingController ngonNguController = TextEditingController();
//   final TextEditingController moTaController = TextEditingController();

//   List<Category> _categories = [];
//   Category? _selectedCategory;

//   @override
//   void initState() {
//     super.initState();
//     _fetchCategories();
//   }

//   Future<void> _fetchCategories() async {
//     try {
//       List<dynamic> categoryData = await getCategories();
//       setState(() {
//         _categories =
//             categoryData.map((data) => Category.fromJson(data)).toList();
//       });
//     } catch (e) {
//       print('Failed to load categories: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Thêm phim',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back,
//             color: Colors.white,
//           ),
//           onPressed: () {
//             Navigator.pop(context); // Quay lại trang trước
//           },
//         ),
//         backgroundColor: const Color(0xFF790000),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             const Text(
//               'Thông tin phim',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),
//             _buildTextField(maPhimController, 'Mã Phim'),
//             _buildTextField(tenPhimController, 'Tên Phim'),
//             _buildTextField(anhPhimController, 'Ảnh Phim (URL)'),
//             _buildTextField(daoDienController, 'Đạo Diễn'),
//             _buildDropdown(), // Sử dụng Dropdown cho Mã Thể Loại
//             _buildTextField(ngonNguController, 'Ngôn Ngữ'),
//             _buildTextField(moTaController, 'Mô tả'),
//             const SizedBox(height: 32),
//             // const Text(
//             //   'Thông tin suất chiếu',
//             //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             // ),
//             // const SizedBox(height: 16),
//             // _buildTextField(maSuatChieuController, 'Mã Suất Chiếu'),
//             // _buildTextField(maPhimController, 'Mã Phim'),
//             // _buildTextField(thoiGianBDController, 'Thời Gian Bắt Đầu'),
//             // _buildTextField(thoiGianKTController, 'Thời Gian Kết Thúc'),
//             // _buildTextField(ngayChieuController, 'Ngày Chiếu'),
//             // _buildTextField(rapChieuController, 'Rạp Chiếu'),
//             const SizedBox(height: 32),
//             Center(
//               child: SizedBox(
//                 width: 200, // Đặt chiều rộng mong muốn
//                 height: 50, // Đặt chiều cao mong muốn
//                 child: ElevatedButton(
//                   onPressed: () {
//                     _addFilm();
//                     Navigator.pop(context);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF790000), // Màu nền của nút
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.0), // Độ bo góc
//                     ),
//                   ),
//                   child: const Text(
//                     'Thêm Phim',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(TextEditingController controller, String label) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: TextField(
//         controller: controller,
//         decoration: InputDecoration(
//           labelText: label,
//           border: const OutlineInputBorder(),
//           contentPadding: const EdgeInsets.symmetric(
//             vertical: 12.0,
//             horizontal: 10.0,
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildDropdown() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: DropdownButtonFormField<Category>(
//         value: _selectedCategory,
//         decoration: const InputDecoration(
//           labelText: 'Mã Thể Loại',
//           border: OutlineInputBorder(),
//           contentPadding: EdgeInsets.symmetric(
//             vertical: 12.0,
//             horizontal: 10.0,
//           ),
//         ),
//         items: _categories.map((Category category) {
//           return DropdownMenuItem<Category>(
//             value: category,
//             child: Text(category.tenTL),
//           );
//         }).toList(),
//         onChanged: (Category? newValue) {
//           setState(() {
//             _selectedCategory = newValue;
//           });
//         },
//         isExpanded: true,
//         hint: const Text('Chọn thể loại'),
//       ),
//     );
//   }

//   void _addFilm() async {
//     final maPhim = maPhimController.text;
//     final tenPhim = tenPhimController.text;
//     final anhPhim = anhPhimController.text;
//     final daoDien = daoDienController.text;
//     final int? maTL = _selectedCategory?.maTL;
//     final ngonNgu = ngonNguController.text;
//     final mota = moTaController.text;

//     try {
//       await addFilm(maPhim, tenPhim, anhPhim, daoDien, maTL, ngonNgu, mota);
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Thêm phim thành công')),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to add film: $e')),
//       );
//     }
//   }
// }
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:project_android/Data/API/api.dart';
import 'package:image_picker/image_picker.dart';

// Trang thêm phim
class AddFilmPage extends StatefulWidget {
  @override
  _AddFilmPageState createState() => _AddFilmPageState();
}

class _AddFilmPageState extends State<AddFilmPage> {
  final TextEditingController maPhimController = TextEditingController();
  final TextEditingController tenPhimController = TextEditingController();
  final TextEditingController anhPhimController = TextEditingController();
  final TextEditingController daoDienController = TextEditingController();
  final TextEditingController ngonNguController = TextEditingController();
  final TextEditingController moTaController = TextEditingController();

  List<dynamic> _categories = [];
  dynamic _selectedCategory;
  bool _useBase64 = false;
  String? _base64Image;

  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  Future<void> _fetchCategories() async {
    try {
      List<dynamic> categoryData = await getCategories();
      setState(() {
        _categories = categoryData;
      });
    } catch (e) {
      print('Failed to load categories: $e');
    }
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final bytes = await image.readAsBytes();
      setState(() {
        _base64Image = base64Encode(bytes);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Thêm phim',
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
            _buildTextField(maPhimController, 'Mã Phim'),
            _buildTextField(tenPhimController, 'Tên Phim'),
            _buildImagePickerOption(),
            if (!_useBase64)
              _buildTextField(anhPhimController, 'Ảnh Phim (URL)'),
            if (_useBase64) _buildImagePicker(),
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
                    _addFilm();
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF790000), // Màu nền của nút
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0), // Độ bo góc
                    ),
                  ),
                  child: const Text(
                    'Thêm Phim',
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

  Widget _buildDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<dynamic>(
        value: _selectedCategory,
        decoration: const InputDecoration(
          labelText: 'Mã Thể Loại',
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 10.0,
          ),
        ),
        items: _categories.map((dynamic category) {
          return DropdownMenuItem<dynamic>(
            value: category,
            child: Text(category['TenTL']),
          );
        }).toList(),
        onChanged: (dynamic newValue) {
          setState(() {
            _selectedCategory = newValue;
          });
        },
        isExpanded: true,
        hint: const Text('Chọn thể loại'),
      ),
    );
  }

  Widget _buildImagePickerOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Sử dụng ảnh URL',
          style: TextStyle(fontSize: 16),
        ),
        Switch(
          value: _useBase64,
          onChanged: (bool value) {
            setState(() {
              _useBase64 = value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildImagePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: _pickImage,
          child: const Text('Chọn ảnh từ thư viện'),
        ),
        if (_base64Image != null)
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: const Text(
              'Ảnh đã chọn',
              style: TextStyle(fontSize: 16),
            ),
          ),
      ],
    );
  }

  void _addFilm() async {
    final maPhim = maPhimController.text;
    final tenPhim = tenPhimController.text;
    final anhPhim = _useBase64 ? _base64Image : anhPhimController.text;
    final daoDien = daoDienController.text;
    final int? maTL = _selectedCategory?['MaTL'];
    final ngonNgu = ngonNguController.text;
    final mota = moTaController.text;

    try {
      await addFilm(maPhim, tenPhim, anhPhim!, daoDien, maTL, ngonNgu, mota);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Thêm phim thành công')),
      );
    } catch (e) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text('Không thêm được phim: $e')),
      // );
    }
  }
}
