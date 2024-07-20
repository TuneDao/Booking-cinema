import 'package:flutter/material.dart';
import 'package:project_android/Screen/User/Home/home.dart';
import 'package:project_android/config/const.dart';

class confirmDisableAcc extends StatefulWidget {
  const confirmDisableAcc({super.key});

  @override
  _confirmDisableAcc createState() => _confirmDisableAcc();
}

class _confirmDisableAcc extends State<confirmDisableAcc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0), // Chiều cao mong muốn của AppBar
        child: AppBar(
          backgroundColor:
              Colors.transparent, // Đặt màu nền của AppBar trong suốt
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              color: colorTheme,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(55.0),
                bottomRight: Radius.circular(55.0),
              ),
            ),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10, bottom: 10),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back),
                          color: Color.fromRGBO(61, 33, 33, 1),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 70, bottom: 10),
                        child: Text(
                          'Vô Hiệu Hóa Tài Khoản',
                          style: TextStyle(
                              color: Color.fromRGBO(61, 33, 33, 1),
                              fontSize: 23.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      /////
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(40, 20, 30, 10),
          child: Column(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'THÔNG TIN KHÁCH HÀNG',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Mã khách hàng: CUS21123',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 150),
                    Text(
                      'BẠN CÓ CHẮC CHẮN VÔ HIỆU HÓA TÀI KHOẢN NÀY ?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 40),
                    Container(
                        width: 280,
                        height: 42,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.8),
                                spreadRadius: 0,
                                blurRadius: 3,
                                offset: Offset(
                                    5, 5)), // 5,5 là bên dưới và bên phải
                          ],
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Color.fromRGBO(210, 117, 117, 1),
                            ),
                            onPressed: () {},
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 2),
                              child: Text(
                                'Xác nhận',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
