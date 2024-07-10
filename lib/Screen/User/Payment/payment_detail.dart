import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class PaymentDetailScreen extends StatefulWidget {
  const PaymentDetailScreen({super.key});

  @override
  _PaymentDetailScreenState createState() => _PaymentDetailScreenState();
}

class _PaymentDetailScreenState extends State<PaymentDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(121, 0, 0, 1), //colorTheme,
        leading: IconButton(
          padding: const EdgeInsets.only(bottom: 5.0, top: 5.0),
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: Text(
            'Lịch sử đặt vé',
            style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 1),
                fontWeight: FontWeight.bold,
                wordSpacing: 5 //titleStyle
                ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.0),
            Container(
              width: 500.0,
              color: Color.fromARGB(206, 250, 221, 173),
              padding: const EdgeInsets.all(15.0),
              child: const Center(
                child: Text(
                  'CHI TIẾT HÓA ĐƠN',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: EdgeInsets.all(20),
              //BOXSHADOW
              child: Container(
                width: 500,
                height: 500.0,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 241, 219, 50),
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(5, 5)),
                  ],
                ),
                // THÔNG TIN NGƯỜI MUA
                child: Stack(
                  // HÌNH ẢNH NẰM SAU PHẦN THÔNG TIN
                  children: [
                    // Positioned.fill(
                    //   // XOAY HÌNH
                    //   child: Transform.rotate(
                    //     angle: 145,
                    //     child: Opacity(
                    //       opacity: 0.1,
                    //       child: Container(
                    //         width: 20,
                    //         height: 200,
                    //         child: Image.asset(
                    //           'assets/images/logo.png', // Đường dẫn tới hình ảnh của bạn
                    //           fit: BoxFit.cover,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      // THÔNG TIN KHÁCH HÀNG
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Mã Hóa Đơn:' + ' 1231233123',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Tên Khách Hàng:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                TextSpan(
                                  text: ' Lê Văn Hồng Tèo',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Số Điện Thoại:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                TextSpan(
                                  text: ' 0955847142',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          const Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Ngày Mua:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                TextSpan(
                                  text: ' 12/12/2024 ',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                TextSpan(
                                  text: ' - ',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                TextSpan(
                                  text: ' 12:30',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          const Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Phương Thức Thanh Toán:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                TextSpan(
                                  text: ' Momo',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(30, 20, 30, 10),
                            child: Container(
                              width: 450,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black, width: 0.5)),
                            ),
                          ),
                          // TÊN PHIM VÀ SỐ LƯỢNG VÉ
                          Column(
                            children: [
                              const Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          'Vé xem phim Nobita và bản giao hưởng địa cầu',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                    TextSpan(text: ' - '),
                                    TextSpan(
                                      text: 'Số lượng:' + ' 2',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // THÔNG TIN VÉ
                              const Padding(
                                  padding: EdgeInsets.only(top: 15),
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          Text.rich(
                                            TextSpan(
                                              children: [
                                                // NGÀY PHIM CHIẾU
                                                TextSpan(
                                                  text: '20/1/2025 \n',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18),
                                                ),
                                                //PHÒNG SỐ
                                                TextSpan(
                                                  text: 'Cinema 5',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 52),
                                        child: Column(
                                          children: [
                                            Text.rich(
                                              TextSpan(
                                                children: [
                                                  //THỜI LƯỢNG PHIM
                                                  TextSpan(
                                                    text: '13:40' +
                                                        ' - ' +
                                                        '15:52\n',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                  // GHẾ NGỒI
                                                  TextSpan(
                                                    text: 'B11 B12 B13',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
                              Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(30, 20, 30, 10),
                                    child: Container(
                                      width: 450,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 0.5)),
                                    ),
                                  ),
                                  //THÔNG TIN CÁC COMBO MUA KÈM THEO
                                  Padding(
                                    padding: EdgeInsets.only(right: 10),
                                    child: Text('COMBO BẮP NƯỚC 2 NGƯỜI ' +
                                        ' - ' +
                                        'SIZE ' +
                                        'L'),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(30, 20, 30, 10),
                                    child: Container(
                                      width: 450,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 0.5)),
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 80),
                                child: Row(
                                  children: [
                                    Text(
                                      'TỔNG TIỀN ' + ' 100000 ' + 'VNĐ ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
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
