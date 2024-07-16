import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_android/Screen/Admin/detailinfomation.dart';
import 'package:project_android/Screen/User/Home/home.dart';
import 'package:project_android/config/const.dart';

class customerManagement extends StatefulWidget {
  const customerManagement({super.key});

  @override
  _customerManagement createState() => _customerManagement();
}

class _customerManagement extends State<customerManagement> {
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
                            hintText: 'Tìm kiếm khách hàng',
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
            // THÔNG TIN NGƯỜI DÙNG
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                width: 380,
                height: 105,
                //BORDER RADIUS vs BOXSHADOW CHO CONTENT BOX
                decoration: BoxDecoration(
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
                // NƠI CHỨA THÔNG TIN KHÁCH HÀNG
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 4, // Chiếm nhiều không gian hơn
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20)),
                          color: Colors.white,
                        ),
                        //THÔNG TIN
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Mã Khách Hàng:' + ' CUS1122311',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 2.0),
                              Text(
                                'Họ và tên:' + ' Nguyễn Văn Tèo',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 2.0),
                              Text(
                                'Ngày Sinh:' + ' 12/12/2003',
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // BUTTON XEM CHI TIẾT
                    Expanded(
                      flex: 1, // Chiếm ít không gian hơn
                      child: Container(
                        height: 250,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Color.fromRGBO(244, 208, 64, 1),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CustomerDetailScreen()));
                          },
                          child: const Text(
                            'Chi Tiết',
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
