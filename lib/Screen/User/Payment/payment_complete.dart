import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_android/Data/model/filmmodel.dart';
import 'package:project_android/Data/model/movie.dart';
import 'package:project_android/Screen/User/Home/home.dart';
import 'package:project_android/config/const.dart';

class PaymentComplete extends StatelessWidget {
  final Film_API film;
  final int totalPrice;
  const PaymentComplete(
      {Key? key, required this.film, required this.totalPrice})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorTheme,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        title: const Text(
          'Xác nhận',
          style: titleStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 100.0,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Thanh toán thành công',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Số tiền thanh toán: ${NumberFormat('###,### VND').format(totalPrice)}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Phương thức thanh toán ',
                  style: TextStyle(fontSize: 18.0),
                ),
                Image.network(
                  'https://upload.wikimedia.org/wikipedia/vi/f/fe/MoMo_Logo.png',
                  height: 24.0,
                ),
              ],
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.all(10),
                  backgroundColor: colorTheme,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: const textButton(text: 'QUAY VỀ')),
          ],
        ),
      ),
    );
  }
}
