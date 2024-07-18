import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:project_android/Data/API/api.dart';
import 'package:project_android/Screen/Admin/detailbill.dart';
import 'package:project_android/Screen/User/Home/home.dart';
import 'package:project_android/config/const.dart';

class invoiceManagement extends StatefulWidget {
  const invoiceManagement({super.key});

  @override
  _invoiceManagement createState() => _invoiceManagement();
}

class _invoiceManagement extends State<invoiceManagement> {
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
      /////
      body: FutureBuilder<List<dynamic>>(
        future: getBill(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final bills = snapshot.data!;
            return ListView.builder(
              itemCount: bills.length,
              itemBuilder: (context, index) {
                final bill = bills[index];
                return Padding(
                  padding: const EdgeInsets.all(10),
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
                            offset: const Offset(
                                5, 5)), // 5,5 là bên dưới và bên phải
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
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Mã hóa đơn: ' + bill['MaHD'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(height: 2.0),
                                  Text(
                                    'Tên khách hàng: ${bill['KhachHang']['HoTen']}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 2.0),
                                  Text(
                                    'Ngày mua: ${bill['ThoiGianTT']}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1, // Chiếm ít không gian hơn
                          child: Container(
                            height: 250,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(255, 213, 79, 1),
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
                                            InvoiceDetailScreen()));
                              },
                              child: const Text(
                                'Chi Tiết',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
