import 'package:flutter/material.dart';
import 'package:project_android/Pages/User/Home/home.dart';
import 'package:project_android/Pages/User/OnBoarding/onboarding.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: OnboardingPage1(),
    );
  }
}
