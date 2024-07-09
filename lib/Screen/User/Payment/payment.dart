import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_android/Data/model/filmmodel.dart';
import 'package:project_android/Screen/User/Payment/payment_complete.dart';
import 'package:project_android/config/const.dart';

class PaymentScreen extends StatefulWidget {
  final Film film;
  final int totalPrice;

  const PaymentScreen({Key? key, required this.film, required this.totalPrice})
      : super(key: key);

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
                          image: DecorationImage(
                            image:
                                AssetImage('assets/images/${widget.film.img}'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${widget.film.name}',
                              style: const TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                                height: 8.0), // <-- Fixed constant height
                            Text(
                              'Xuất chiếu: ${widget.film.time}',
                              style: const TextStyle(fontSize: 18.0),
                            ),
                            const SizedBox(
                                height: 4.0), // <-- Fixed constant height
                            const Text(
                              'Giá vé: 70,000 VND',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0), // <-- Fixed constant height
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
                  const SizedBox(height: 1.0), // <-- Fixed constant height
                  Container(
                    width: 500.0,
                    padding: const EdgeInsets.fromLTRB(15.0, 13.0, 2.0, 10.0),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 0.5, color: Colors.black),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Số lượng',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 15.0),
                          child: Text(
                            '${(widget.totalPrice / 70000).toInt()}',
                            style: const TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 1.0), // <-- Fixed constant height
                  Container(
                    width: 500.0,
                    padding: const EdgeInsets.fromLTRB(15.0, 13.0, 2.0, 1.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Tổng thành tiền',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: Text(
                            NumberFormat('###,### VND')
                                .format(widget.totalPrice),
                            style: const TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                              builder: (context) => PaymentComplete(
                                  film: widget.film,
                                  totalPrice: widget.totalPrice)));
                      print('Xác nhận đã được nhấn');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorTheme,
                    ),
                    child: const textButton(text: 'XÁC NHẬN')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
