import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_android/Screen/Admin/Film/QLFilm.dart';
import 'package:project_android/Screen/Admin/Bill/QLHD.dart';
import 'package:project_android/Screen/Admin/Customer/QLKH.dart';
import 'package:project_android/Screen/Admin/Time/QLSC.dart';
import 'package:project_android/config/const.dart';

class AdminScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorTheme,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Text(
              'BẢNG ĐIỀU KHIỂN',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ))
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 8.0), // Đặt padding dưới 16 điểm
              child: Text(
                'Tổng số liệu',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(
                height:
                    16), // Khoảng cách 16 điểm giữa tiêu đề và các ô số liệu

            // Các ô số liệu
            Padding(
              padding: EdgeInsets.only(top: 16.0), // Đặt padding trên 16 điểm
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildDataItem(
                    icon: Icons.person,
                    data: '100',
                    backgroundColor:
                        Colors.blue[200]!, // Màu nền của ô số liệu 1
                    iconColor: Colors.white, // Màu biểu tượng của ô số liệu 1
                    textColor: Colors.white, // Màu dữ liệu của ô số liệu 1
                  ),
                  _buildDataItem(
                    icon: Icons.attach_money,
                    data: '5000\$',
                    backgroundColor: Color.fromARGB(
                        255, 240, 239, 239)!, // Màu nền của ô số liệu 2
                    iconColor: Colors.green, // Màu biểu tượng của ô số liệu 2
                    textColor: Colors.green, // Màu dữ liệu của ô số liệu 2
                  ),
                  _buildDataItem(
                    icon: Icons.shopping_cart,
                    data: '200',
                    backgroundColor:
                        Colors.orange[200]!, // Màu nền của ô số liệu 3
                    iconColor: Colors.red, // Màu biểu tượng của ô số liệu 3
                    textColor: Colors.red, // Màu dữ liệu của ô số liệu 3
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 32.0), // Đặt padding dưới 16 điểm
              child: Text(
                'Quản lý thông số',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(
                height:
                    32), // Khoảng cách 16 điểm giữa Expanded và phần tử phía trên

            Expanded(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  mainAxisExtent: 120, // Chiều cao cố định của mỗi khung
                ),
                children: [
                  _buildGridItem(
                    icon: Icons.movie,
                    title: 'QUẢN LÝ PHIM',
                    color: colorBtnAdminScreen2,
                    onTap: () {
                      // Điều hướng đến trang quản lý phim
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const filmManagement()),
                      );
                    },
                  ),
                  _buildGridItem(
                    icon: Icons.receipt,
                    title: 'QUẢN LÝ ĐƠN HÀNG',
                    color: colorBtnAdminScreen3,
                    onTap: () {
                      // Điều hướng đến trang quản lý hóa đơn
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const invoiceManagement()),
                      );
                    },
                  ),
                  _buildGridItem(
                    icon: Icons.people,
                    title: 'QUẢN LÝ KHÁCH HÀNG',
                    color: colorBtnAdminScreen4,
                    onTap: () {
                      // Điều hướng đến trang quản lý khách hàng
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const customerManagement()),
                      );
                    },
                  ),
                  _buildGridItem(
                    icon: FontAwesomeIcons.video,
                    title: 'QUẢN LÝ SUẤT CHIẾU',
                    color: colorTheme2,
                    onTap: () {
                      // Điều hướng đến trang quản lý khách hàng
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SuatChieuManagement()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(
      {required IconData icon,
      required String title,
      required Color color,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150, // Thay đổi giá trị này để điều chỉnh chiều rộng
        height: 150, // Thay đổi giá trị này để điều chỉnh chiều cao
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, size: 30),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDataItem(
      {required IconData icon,
      required String data,
      required Color backgroundColor,
      required Color iconColor,
      required Color textColor}) {
    return Container(
      width: 120, // Chiều rộng của mỗi ô số liệu
      height: 120, // Chiều cao của mỗi ô số liệu
      decoration: BoxDecoration(
        color: backgroundColor, // Màu nền của ô số liệu
        borderRadius: BorderRadius.circular(8), // Độ bo góc của ô số liệu
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: iconColor), // Màu biểu tượng
          SizedBox(height: 10),
          Text(
            data,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: textColor, // Màu dữ liệu
            ),
          ),
        ],
      ),
    );
  }
}
