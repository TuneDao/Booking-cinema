import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_android/Screen/User/Home/home.dart';
import 'package:project_android/config/const.dart';

class filmManagement extends StatefulWidget {
  const filmManagement({super.key});

  @override
  _filmManagement createState() => _filmManagement();
}

class _filmManagement extends State<filmManagement> {
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
              'Quản lý phim',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      /////
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 24.0),
            // THANH SEARCH
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Container(
                width: 450.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 0, // Giảm độ lan rộng của bóng đổ
                      blurRadius: 3, // Giảm độ mờ của bóng đổ
                      offset: Offset(5, 5), // Điều chỉnh vị trí của bóng đổ
                    ),
                  ],
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: const Padding(
                  padding:
                      EdgeInsets.only(left: 15, top: 5, bottom: 5, right: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Tìm kiếm phim',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Icon(Icons.search),
                    ],
                  ),
                ),
              ),
            ),
            // THÔNG TIN PHIM
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                width: 380,
                height: 270,
                //BORDER RADIUS vs BOXSHADOW CHO CONTENT BOX
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        spreadRadius: 0,
                        blurRadius: 3,
                        offset: Offset(5, 5)), // 5,5 là bên dưới và bên phải
                  ],
                  border: Border.all(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
                // NƠI CHỨA THÔNG TIN PHIM
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 125,
                              height: 180,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/images/Doraemon.jpeg'),
                                    fit: BoxFit.cover,
                                  ),
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.black,
                                  )),
                            ),
                            SizedBox(width: 10),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'NOBITA VÀ BẢN GIAO HƯỞNG ĐỊA CẦU',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Đạo Diễn: ' + 'Imai Kazuaki',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Thể Loại: ' + 'Hoạt Hình',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Ngày Chiếu:' + ' 06/06/2024',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Thời lượng: ' + '120 phút',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 170,
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Sửa',
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.black),
                                ),
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      Color.fromRGBO(255, 213, 79, 1),
                                ),
                              ),
                            ),
                            Container(
                              width: 170,
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Xóa',
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.white),
                                ),
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      Color.fromRGBO(255, 79, 79, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
