import 'package:flutter/material.dart';
import 'package:project_android/Screen/User/Home/carousel_film.dart';
import 'package:project_android/Screen/User/Home/carousel_news.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [CarouselNews(), CarouselFilm()],
        ),
      ),
    );
  }
}
