import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_android/Screen/User/Home/home.dart';
import 'package:project_android/config/const.dart';

class PaymentComplete extends StatefulWidget {
  const PaymentComplete({Key? key}) : super(key: key);

  @override
  _PaymentCompleteState createState() => _PaymentCompleteState();
}

class _PaymentCompleteState extends State<PaymentComplete> {
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
          child: Text('Xác Nhận', style: titleStyle),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 30.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        FontAwesomeIcons.checkDouble,
                        size: 50,
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Thanh Toán Thành Công',
                        style: TextStyle(fontSize: 22.0),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 9.0),
                      Text(
                        'Mã thanh toán: 010101010',
                        style: TextStyle(fontSize: 22.0),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 9.0),
                      Container(
                        width: 300.0,
                        padding: EdgeInsets.fromLTRB(15.0, 13.0, 2.0, 10.0),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 0.5, color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(height: 9.0),
                      Text(
                        'Số tiền thanh toán: 100.000 VNĐ',
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 9.0),
                      Padding(
                        padding: EdgeInsets.only(left: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Phương Thức Thanh Toán:  ',
                              style: TextStyle(fontSize: 19.0),
                            ),
                            Container(
                              width: 40.0,
                              height: 40.0,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage('assets/images/img_1.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 320.0,
                        height: 70.0,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                            print('Xác nhận đã được nhấn');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(214, 175, 23, 1),
                          ),
                          child: Text(
                            'Quay Về',
                            style:
                                TextStyle(color: Colors.white, fontSize: 19.0),
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
      ),
    );
  }
}
