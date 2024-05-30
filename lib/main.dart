import 'package:flutter/material.dart';
import 'package:project_android/Pages/home.dart';
import 'package:project_android/Pages/login.dart';
import 'package:project_android/Pages/register.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SignInPage2(),
    );
  }
}
