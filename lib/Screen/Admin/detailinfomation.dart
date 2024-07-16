import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_android/config/const.dart';
import 'package:project_android/Screen/User/Home/home.dart';

class CustomerDetailScreen extends StatelessWidget {
  final Map<String, String> customer = {
    'customerId': 'KH12345',
    'name': 'Nguyễn Văn A',
    'gender': 'Nam',
    'birthDate': '01/01/1990',
    'phone': '0123456789',
    'address': '123 Đường XYZ, Quận 1, TP.HCM',
    'email': 'nguyenvana@example.com',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorTheme,
        leading: IconButton(
          icon: const FaIcon(FontAwesomeIcons.arrowLeft),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Row(
          children: [
            Text(
              'Quản lý khách hàng',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Thông Tin Chi Tiết',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0, vertical: 8.0), // Padding cho ListView
              children: [
                _buildDetailRow('Mã Khách Hàng', customer['customerId']!),
                _buildDetailRow('Tên KH', customer['name']!),
                _buildDetailRow('Giới Tính', customer['gender']!),
                _buildDetailRow('Ngày Sinh', customer['birthDate']!),
                _buildDetailRow('Số Điện Thoại', customer['phone']!),
                _buildDetailRow('Địa Chỉ', customer['address']!),
                _buildDetailRow('Gmail', customer['email']!),
              ],
            ),
          ),
          // Chèn ảnh logo vào đây

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity, // Nút rộng bằng màn hình
              child: ElevatedButton(
                onPressed: () {
                  // Xóa tài khoản
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, // Màu chữ của nút
                  backgroundColor: Colors.red, // Màu nền của nút
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: const Text(
                  'Vô hiệu hóa tài khoản',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
