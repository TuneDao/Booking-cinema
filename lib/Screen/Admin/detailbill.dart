import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_android/config/const.dart';
import 'package:project_android/Screen/User/Home/home.dart';

class InvoiceDetailScreen extends StatelessWidget {
  final Map<String, dynamic> invoice = {
    'invoiceId': 'HD001234',
    'customerName': 'Nguyễn Thị B',
    'phoneNumber': '0987654321',
    'purchaseDate': '2023-03-15 14:30',
    'paymentMethod': 'Ví điện tử',
    'movies': [
      {
        'title': 'Avengers: Endgame',
        'showtime': '2023-03-16 19:00',
        'quantity': 2,
        'totalPrice': 200000,
      },
      // Có thể thêm nhiều phim khác ở đây
    ],
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
              'Quản lý hóa đơn',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: Opacity(
              opacity: 0.1,
              child: Transform.rotate(
                angle: 45 * 3.1415927 / 180, // Xoay 45 độ
                child: Image.asset(
                  'assets/images/logo2.png',
                  width: 500, // Điều chỉnh kích thước lớn hơn
                  height: 500, // Điều chỉnh kích thước lớn hơn
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'HÓA ĐƠN THANH TOÁN',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    height: 390,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInvoiceRow(
                            'Mã Hóa Đơn:', '${invoice['invoiceId']}'),
                        _buildInvoiceRow(
                            'Tên Khách Hàng:', '${invoice['customerName']}'),
                        _buildInvoiceRow(
                            'Số Điện Thoại:', '${invoice['phoneNumber']}'),
                        _buildInvoiceRow(
                            'Ngày Mua:', '${invoice['purchaseDate']}'),
                        _buildInvoiceRow('Phương Thức Thanh Toán:',
                            '${invoice['paymentMethod']}'),
                        Divider(thickness: 1),
                        const Text(
                          'Vé Đã Mua:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Column(
                          children:
                              (invoice['movies'] as List).map<Widget>((movie) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(movie['title'],
                                        style: TextStyle(fontSize: 16)),
                                    Text('x${movie['quantity']}',
                                        style: TextStyle(fontSize: 16)),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Suất: ${movie['showtime']}',
                                        style: TextStyle(fontSize: 14)),
                                    Text('${movie['totalPrice']} VND',
                                        style: TextStyle(fontSize: 16)),
                                  ],
                                ),
                                Divider(thickness: 1),
                              ],
                            );
                          }).toList(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Tổng Cộng: ${invoice['movies'].fold(0, (sum, movie) => sum + movie['totalPrice'])} VND',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  const Center(
                    child: Text(
                      'Cảm ơn quý khách và hẹn gặp lại!',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInvoiceRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 16)),
          Text(value, style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
