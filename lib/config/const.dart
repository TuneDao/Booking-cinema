import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const urlimg = "assets/images/";
const titleStyle = TextStyle(
  color: Color.fromRGBO(255, 255, 255, 1),
  fontWeight: FontWeight.w500,
  wordSpacing: 5,
);
const colorTheme = Color.fromRGBO(121, 0, 0, 1);
const colorHome = Color.fromRGBO(0, 0, 0, 1);
const colorTheme2 = Color.fromRGBO(210, 117, 117, 1);

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
