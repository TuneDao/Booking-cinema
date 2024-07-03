import 'package:flutter/material.dart';
import 'package:project_android/Screen/User/Payment/payment_complete.dart';
import 'package:project_android/config/const.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isCheckedMomo = false;
  bool isCheckedVisa = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorTheme,
        leading: IconButton(
          padding: const EdgeInsets.only(bottom: 5.0),
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 5.0),
          child: Text('Thanh Toán', style: titleStyle),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 120.0,
                        height: 180.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/Deadpool.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tên phim: Tên phim của bạn',
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Số Phòng:',
                              style: TextStyle(fontSize: 18.0),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              'Xuất chiếu: ',
                              style: TextStyle(fontSize: 18.0),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              'Ghế: ',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              'Giá vé: ',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    width: 500.0,
                    color: const Color.fromRGBO(255, 241, 219, 50),
                    padding: const EdgeInsets.all(15.0),
                    child: const Text(
                      'Thông tin vé',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 1.0),
                  Container(
                    width: 500.0,
                    padding: const EdgeInsets.fromLTRB(15.0, 13.0, 2.0, 10.0),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 0.5, color: Colors.black),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Số lượng',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 15.0),
                          child: Text(
                            '10',
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 1.0),
                  Container(
                    width: 500.0,
                    padding: const EdgeInsets.fromLTRB(15.0, 13.0, 2.0, 1.0),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tổng',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 15.0),
                          child: Text(
                            '10.000' + ' VND',
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    width: 500.0,
                    color: const Color.fromRGBO(255, 241, 219, 50),
                    padding: const EdgeInsets.all(15.0),
                    child: const Text(
                      'Combo Bắp Nước (Tùy Chọn)',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 1.0),
                  Container(
                    width: 500.0,
                    padding: const EdgeInsets.fromLTRB(15.0, 13.0, 2.0, 10.0),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 0.5, color: Colors.black),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Combo A',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 15.0),
                          child: Text(
                            '10',
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 1.0),
                  Container(
                    width: 500.0,
                    padding: const EdgeInsets.fromLTRB(15.0, 13.0, 2.0, 1.0),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Tổng',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 15.0),
                          child: Text(
                            '10.000' + ' VND',
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    width: 500.0,
                    color: const Color.fromRGBO(255, 241, 219, 50),
                    padding: const EdgeInsets.all(15.0),
                    child: const Text(
                      'Phương Thức Thanh Toán',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isCheckedMomo,
                        onChanged: (bool? value) {
                          setState(() {
                            isCheckedMomo = value ?? false;
                            if (isCheckedMomo) {
                              isCheckedVisa = false;
                            }
                          });
                        },
                      ),
                      Text(
                        'Momo',
                        style: TextStyle(fontSize: 18.0),
                      ),
                      Checkbox(
                        value: isCheckedVisa,
                        onChanged: (bool? value) {
                          setState(() {
                            isCheckedVisa = value ?? false;
                            if (isCheckedVisa) {
                              isCheckedMomo = false;
                            }
                          });
                        },
                      ),
                      Text(
                        'Visa / MasterCard',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Container(
                width: 70.0,
                height: 70.0,
                padding: EdgeInsets.only(top: 20.0),
                child: TextButton(
                  onPressed: () {
                    // Xử lý khi nút được nhấn
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PaymentComplete()));
                    print('Xác nhận đã được nhấn');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(214, 175, 23, 1),
                  ),
                  child: Text(
                    'Xác Nhận',
                    style: TextStyle(color: Colors.white, fontSize: 19.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
