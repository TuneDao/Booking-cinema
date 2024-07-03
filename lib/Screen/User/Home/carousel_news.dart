import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project_android/Screen/User/News/newspage.dart';
import 'package:project_android/config/const.dart';

class CarouselNews extends StatelessWidget {
  const CarouselNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewsScreen()),
                );
              },
              child: const Text(
                'TIN TỨC',
                style: textTitleHome,
              ),
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 16 / 9,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              autoPlay: false,
              autoPlayInterval: Duration(seconds: 5),
            ),
            items: imageSliders,
          ),
        ],
      ),
    );
  }
}

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            child: Stack(
              children: <Widget>[
                Image.asset(item['imagePath']!,
                    fit: BoxFit.cover, width: 1000.0),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['title']!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ))
    .toList();

final List<Map<String, String>> imgList = [
  {
    'imagePath': 'assets/images/uudai1.jpg',
    'title': 'C’MONDAY - HAPPY DAY - ĐỒNG GIÁ 45K/ 2D',
  },
  {
    'imagePath': 'assets/images/student.jpg',
    'title': 'C’STUDENT - 45K CHO HS/SV',
  },
  {
    'imagePath': 'assets/images/LionKing.jpeg',
    'title': 'LION KING TRỞ LẠI',
  },
];
