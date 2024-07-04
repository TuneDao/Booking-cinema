import 'package:flutter/material.dart';
import 'package:project_android/Screen/User/Home/home.dart';
import 'package:project_android/Screen/User/Home/splash.dart';
import 'package:project_android/Screen/User/OnBoarding/onboarding.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      // routes: {
      //   '/': (context) => SplashScreen(),
      //   '/home': (context) => OnboardingPage1(), // Trang chủ của bạn.
      // },
    );
  }
}
