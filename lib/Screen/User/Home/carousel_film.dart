import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselFilm extends StatelessWidget {
  const CarouselFilm({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: false,
        aspectRatio: 1.11, // Thay đổi tỷ lệ để phù hợp với màn hình
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.zoom, // Giữ nguyên tỷ lệ
      ),
      items: imageSliders,
    );
  }
}

final List<Widget> imageSliders = InfoFilm.map((item) => Container(
      margin: EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Stack(
          children: <Widget>[
            Image.asset(
              item,
              fit: BoxFit.contain,
              width: double.infinity,
              height: double.infinity,
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black.withOpacity(0.8), Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: Text(
                  'Hình ảnh phim',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    )).toList();

final List<String> InfoFilm = [
  'assets/images/Furiosa.jpeg',
  'assets/images/Doraemon.jpeg',
  'assets/images/garfield_movie.jpg',
  'assets/images/Panda.jpg',
];
