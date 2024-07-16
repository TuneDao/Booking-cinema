import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const urlimg = "assets/images/";
const urlLogo = "assets/images/logo.png";
const urlLogo1 = "assets/images/logo2.png";
const titleStyle = TextStyle(
  color: Color.fromRGBO(255, 255, 255, 1),
  fontWeight: FontWeight.w500,
  wordSpacing: 5,
);
const colorTheme = Color.fromRGBO(121, 0, 0, 1);
const colorHome = Color.fromRGBO(0, 0, 0, 1);
const colorTheme2 = Color.fromRGBO(210, 117, 117, 1);
const colorBtnAdminScreen1 = Colors.redAccent;
const colorBtnAdminScreen2 = Colors.greenAccent;
const colorBtnAdminScreen3 = Colors.blueAccent;
const colorBtnAdminScreen4 = Colors.orangeAccent;

const textTitleHome = TextStyle(
  color: Colors.black,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

class textWhite extends StatelessWidget {
  final String text;

  const textWhite({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white),
    );
  }
}

class textPrice extends StatelessWidget {
  final String text;

  const textPrice({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
    );
  }
}

class textButton extends StatelessWidget {
  final String text;

  const textButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
    );
  }
}
