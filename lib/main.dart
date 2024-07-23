import 'package:flutter/material.dart';
import 'package:project_android/Screen/Admin/adminscreen.dart';
import 'package:project_android/Screen/User/Home/home.dart';
import 'package:project_android/Screen/User/Home/splash.dart';
import 'package:project_android/Screen/User/SignIn/login.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignInPage2(),
      // routes: {
      //   '/': (context) => SplashScreen(),
      //   '/home': (context) => SignInPage2(), // Trang chủ của bạn.
      // },
    );
  }
}
