import 'package:flutter/material.dart';
import 'package:project_android/Data/model/filmmodel.dart';
import 'package:project_android/Data/model/movie.dart';
import 'package:project_android/Screen/User/Tickets/seats.dart';
import 'package:project_android/Screen/User/Home/carousel_news.dart';
import 'package:project_android/config/const.dart'; // Import CarouselFilm

class FilmDetailScreen extends StatelessWidget {
  final Film_API film;

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
                  Image.network(
                    film.anhPhim, // Large background image
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
                        child: Image.network(
                          film.anhPhim, // Small poster image
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              film.tenPhim,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: film.suatChieux.map((suatChieu) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 5.0),
                                  child: Wrap(
                                    alignment: WrapAlignment.start,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    spacing: 5.0,
                                    runSpacing: 5.0,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(Icons.calendar_today,
                                              color: Colors.blue, size: 20),
                                          SizedBox(width: 5),
                                          Text(
                                            suatChieu.ngayChieu,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(Icons.access_time,
                                              color: Colors.red, size: 20),
                                          SizedBox(width: 5),
                                          Text(
                                            '${suatChieu.thoiGianBD} - ${suatChieu.thoiGianKT}',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(Icons.theaters,
                                              color: Colors.orange, size: 20),
                                          SizedBox(width: 5),
                                          Text(
                                            suatChieu.rapChieu,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
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
                    film.moTa,
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
                  Text('Thể loại: ' + film.theLoai),
                  const SizedBox(height: 10),
                  Text('Đạo diễn: ' + film.daoDien),
                  const SizedBox(height: 10),
                  Text('Ngôn ngữ: ' + film.ngonNgu),
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
