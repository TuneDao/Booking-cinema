import 'package:flutter/material.dart';
import 'package:project_android/Screen/User/Payment/payment_detail.dart';

class historyPayment extends StatefulWidget {
  const historyPayment({super.key});

  @override
  _historyPaymentState createState() => _historyPaymentState();
}

class _historyPaymentState extends State<historyPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 7.0),
            Container(
              width: 500.0,
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                //controller: ,
                decoration: InputDecoration(
                  hintText: 'Tìm kiếm hóa đơn mua vé của bạn',
                  filled: true,
                  fillColor: Color.fromRGBO(217, 217, 217, 1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(28.0),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      ////////
                    },
                  ),
                ),
              ),
            ),
            Container(
              width: 500.0,
              padding: const EdgeInsets.fromLTRB(15.0, 0, 2.0, 10.0),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0.5, color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 20),
            // CONTENT BOX
            Container(
              width: 400,
              height: 150,
              //BORDER RADIUS vs BOXSHADOW CHO CONTENT BOX
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(5, 5)), // 5,5 là bên dưới và bên phải
                ],
                border: Border.all(
                  color: Colors.black,
                  width: 1.5,
                ),
              ),
              // NƠI CHỨA THÔNG TIN VÉ
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
                              'Mã Hóa Đơn:' + ' 1231233123',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 2.0),
                            Text(
                              'Ngày Mua:' + ' 12/12/2024' + '12:30',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 2.0),
                            Text(
                              'Phương Thức Thanh Toán:' + ' Momo',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              'Tổng Cộng:' + ' 200000' + ' VND',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 0.75)),
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
                                  builder: (context) => PaymentDetailScreen()));
                        },
                        child: const Text(
                          'Chi Tiết',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //
            SizedBox(height: 22.0),
            // CONTENT BOX
            Container(
              width: 400,
              height: 150,
              //BORDER RADIUS vs BOXSHADOW CHO CONTENT BOX
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(5, 5)), // 5,5 là bên dưới và bên phải
                ],
                border: Border.all(
                  color: Colors.black,
                  width: 1.5,
                ),
              ),
              // NƠI CHỨA THÔNG TIN VÉ
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
                              'Mã Hóa Đơn:' + ' 1231233123',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 2.0),
                            Text(
                              'Ngày Mua:' + ' 12/12/2024' + '12:30',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 2.0),
                            Text(
                              'Phương Thức Thanh Toán:' + ' Momo',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              'Tổng Cộng:' + ' 200000' + ' VND',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 0.75)),
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
                          // BAM CHUYEN TRANG "XEM CHI TIET"
                        },
                        child: const Text(
                          'Chi Tiết',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //
            SizedBox(height: 22.0),
            // CONTENT BOX
            Container(
              width: 400,
              height: 150,
              //BORDER RADIUS vs BOXSHADOW CHO CONTENT BOX
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(5, 5)), // 5,5 là bên dưới và bên phải
                ],
                border: Border.all(
                  color: Colors.black,
                  width: 1.5,
                ),
              ),
              // NƠI CHỨA THÔNG TIN VÉ
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
                              'Mã Hóa Đơn:' + ' 1231233123',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 2.0),
                            Text(
                              'Ngày Mua:' + ' 12/12/2024' + '12:30',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 2.0),
                            Text(
                              'Phương Thức Thanh Toán:' + ' Momo',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              'Tổng Cộng:' + ' 200000' + ' VND',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 0.75)),
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
                          // BAM CHUYEN TRANG "XEM CHI TIET"
                        },
                        child: const Text(
                          'Chi Tiết',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //
            SizedBox(height: 22.0),
            // CONTENT BOX
            Container(
              width: 400,
              height: 150,
              //BORDER RADIUS vs BOXSHADOW CHO CONTENT BOX
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(5, 5)), // 5,5 là bên dưới và bên phải
                ],
                border: Border.all(
                  color: Colors.black,
                  width: 1.5,
                ),
              ),
              // NƠI CHỨA THÔNG TIN VÉ
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
                              'Mã Hóa Đơn:' + ' 1231233123',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 2.0),
                            Text(
                              'Ngày Mua:' + ' 12/12/2024' + '12:30',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 2.0),
                            Text(
                              'Phương Thức Thanh Toán:' + ' Momo',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              'Tổng Cộng:' + ' 200000' + ' VND',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 0.75)),
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
                        onPressed: () {},
                        child: const Text(
                          'Chi Tiết',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //
            SizedBox(height: 22.0),
            // CONTENT BOX
            Container(
              width: 400,
              height: 150,
              //BORDER RADIUS vs BOXSHADOW CHO CONTENT BOX
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(5, 5)), // 5,5 là bên dưới và bên phải
                ],
                border: Border.all(
                  color: Colors.black,
                  width: 1.5,
                ),
              ),
              // NƠI CHỨA THÔNG TIN VÉ
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
                              'Mã Hóa Đơn:' + ' 1231233123',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 2.0),
                            Text(
                              'Ngày Mua:' + ' 12/12/2024' + '12:30',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 2.0),
                            Text(
                              'Phương Thức Thanh Toán:' + ' Momo',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              'Tổng Cộng:' + ' 200000' + ' VND',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 0.75)),
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
                          // BAM CHUYEN TRANG "XEM CHI TIET"
                        },
                        child: const Text(
                          'Chi Tiết',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //
            SizedBox(height: 22.0),
            // CONTENT BOX
            Container(
              width: 400,
              height: 150,
              //BORDER RADIUS vs BOXSHADOW CHO CONTENT BOX
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(5, 5)), // 5,5 là bên dưới và bên phải
                ],
                border: Border.all(
                  color: Colors.black,
                  width: 1.5,
                ),
              ),
              // NƠI CHỨA THÔNG TIN VÉ
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
                              'Mã Hóa Đơn:' + ' 1231233123',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 2.0),
                            Text(
                              'Ngày Mua:' + ' 12/12/2024' + '12:30',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 2.0),
                            Text(
                              'Phương Thức Thanh Toán:' + ' Momo',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              'Tổng Cộng:' + ' 200000' + ' VND',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 0.75)),
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
                          // BAM CHUYEN TRANG "XEM CHI TIET"
                        },
                        child: const Text(
                          'Chi Tiết',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //
            SizedBox(height: 22.0),
            // CONTENT BOX
            Container(
              width: 400,
              height: 150,
              //BORDER RADIUS vs BOXSHADOW CHO CONTENT BOX
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(5, 5)), // 5,5 là bên dưới và bên phải
                ],
                border: Border.all(
                  color: Colors.black,
                  width: 1.5,
                ),
              ),
              // NƠI CHỨA THÔNG TIN VÉ
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
                              'Mã Hóa Đơn:' + ' 1231233123',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 2.0),
                            Text(
                              'Ngày Mua:' + ' 12/12/2024' + '12:30',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 2.0),
                            Text(
                              'Phương Thức Thanh Toán:' + ' Momo',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              'Tổng Cộng:' + ' 200000' + ' VND',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 19,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 0.75)),
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
                          // BAM CHUYEN TRANG "XEM CHI TIET"
                        },
                        child: const Text(
                          'Chi Tiết',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
