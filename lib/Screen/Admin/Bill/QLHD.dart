import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:project_android/Data/API/api.dart';
import 'package:project_android/Screen/Admin/Bill/detailbill.dart';
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
              'Danh sách đơn hàng',
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
                final date = bill['ThoiGianTT'];
                DateTime dateTime = DateTime.parse(date);
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: Card(
                    color: Colors.grey[850],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Stack(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(width: 15),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Mã hóa đơn: ' + bill['MaHD'].toString(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.person_2,
                                                color: Colors.blue, size: 20),
                                            const SizedBox(width: 8),
                                            Text.rich(
                                              TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: 'Họ tên khách hàng: ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16,
                                                        color: Colors.white),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        '${bill['KhachHang']['HoTen']}',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            Icon(Icons.calendar_month_outlined,
                                                color: Colors.red, size: 20),
                                            const SizedBox(width: 8),
                                            Text.rich(
                                              TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: 'Ngày đặt: ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16,
                                                        color: Colors.white),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        '${DateFormat('dd/MM/yyyy').format(dateTime)}',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Column(
                            children: [
                              // NÚT SỬA
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              InvoiceDetailScreen(
                                                invoiceId: bill['MaHD'],
                                              )));
                                },
                                child: const CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.yellow,
                                  child: Icon(Icons.info, color: Colors.black),
                                ),
                              ),
                            ],
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
