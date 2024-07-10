import 'package:flutter/material.dart';
import 'package:project_android/Data/model/filmmodel.dart';
import 'package:project_android/Screen/User/Tickets/seats.dart';
import 'package:project_android/Screen/User/Home/carousel_news.dart';
import 'package:project_android/config/const.dart'; // Import CarouselFilm

class FilmDetailScreen extends StatelessWidget {
  final Film film;

  const FilmDetailScreen({required this.film});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          // SliverAppBar with a large image and title
          SliverAppBar(
            expandedHeight: 300.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/${film.img}', // Large background image
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            floating: true,
            pinned: true,
            stretch: true,
          ),
          // Film details
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Small overlay image and film name
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 150,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Image.asset(
                          'assets/images/${film.img}', // Small poster image
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              film.name.toString(),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                    'Thời gian chiếu: ' + film.time.toString()),
                              ],
                            ),
                            const SizedBox(height: 8.0),
                            Row(
                              children: [
                                Icon(Icons.favorite, color: Colors.red),
                                SizedBox(width: 8.0),
                                Text('3050'),
                                SizedBox(width: 32.0),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => SeatsSelect(
                                                    film: film,
                                                  )));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color.fromARGB(255, 227, 57, 47),
                                      minimumSize: Size(120, 50),
                                      padding: EdgeInsets.all(10),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(60),
                                      ),
                                    ),
                                    child: const textButton(text: 'ĐẶT VÉ')),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    film.description.toString(),
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),
                  const SizedBox(height: 16),
                  const Divider(
                    color: Colors.grey,
                    thickness: 1.0,
                    height: 20,
                    indent: 0,
                    endIndent: 0,
                  ),
                  const SizedBox(height: 20),
                  Text(film.category.toString()),
                  const SizedBox(height: 10),
                  const Text('Đạo diễn: Imai Kazuaki'),
                  const SizedBox(height: 10),
                  const Text('Ngôn ngữ: Tiếng Nhật - Phụ đề tiếng Việt'),
                  const SizedBox(height: 10),
                  const SizedBox(height: 16),
                  const Divider(
                    color: Colors.grey,
                    thickness: 1.0,
                    height: 20,
                    indent: 0,
                    endIndent: 0,
                  ),
                  const SizedBox(height: 0),
                  const CarouselNews(), // Thêm CarouselFilm vào cuối màn hình
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
