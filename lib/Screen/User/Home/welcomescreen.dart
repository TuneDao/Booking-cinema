import 'package:flutter/material.dart';
import 'package:project_android/Screen/User/Home/carousel_film.dart';
import 'package:project_android/Screen/User/Home/carousel_banner.dart';
import 'package:project_android/Screen/User/Home/carousel_news.dart';
import 'package:project_android/Screen/User/Home/multiple_film.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/background_home.jpg'), // Thay thế đường dẫn đến hình ảnh của bạn
            fit: BoxFit.cover,
          ),
        ),
        child: const SingleChildScrollView(
          child: Column(
            children: [
              CarouselBanner(),
              SizedBox(
                height: 10,
              ),
              CarouselFilm(),
              MultipleFilm(),
              CarouselNews(),
            ],
          ),
        ),
      ),
    );
  }
}
