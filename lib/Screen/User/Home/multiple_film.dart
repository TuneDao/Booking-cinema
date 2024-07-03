import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:project_android/Screen/User/Tickets/buytickets.dart';
import 'package:project_android/config/const.dart';

class MultipleFilm extends StatelessWidget {
  const MultipleFilm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TicketsScreen()),
                );
              },
              child: const Text(
                'PHIM SẮP CHIẾU',
                style: textTitleHome,
              ),
            ),
          ),
          const SizedBox(height: 10),
          CarouselSlider.builder(
            options: CarouselOptions(
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              viewportFraction: 0.75,
            ),
            itemCount: (imgList.length / 2).round(),
            itemBuilder: (context, index, realIdx) {
              final int first = index * 2;
              final int second = first + 1;
              return Row(
                children: [first, second].map((idx) {
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TicketsScreen()),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: Offset(4, 4),
                            )
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.asset(
                                imgList[idx],
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                bottom: 10,
                                left: 10,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

final List<String> imgList = [
  'assets/images/background_home.jpg',
  'assets/images/minions4.jpg',
  'assets/images/cuoi.jpg',
  'assets/images/Panda.jpg',
  'assets/images/Doraemon.jpeg',
  'assets/images/insideout2.jpg'
];
