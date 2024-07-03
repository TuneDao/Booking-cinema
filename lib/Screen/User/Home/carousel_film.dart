import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project_android/Data/model/filmmodel.dart';
import 'package:project_android/Data/provider/filmprovider.dart';

// class CarouselFilm extends StatelessWidget {
//   const CarouselFilm({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CarouselSlider(
//       options: CarouselOptions(
//         autoPlay: false,
//         aspectRatio: 1.11, // Thay đổi tỷ lệ để phù hợp với màn hình
//         enlargeCenterPage: true,
//         enlargeStrategy: CenterPageEnlargeStrategy.zoom, // Giữ nguyên tỷ lệ
//       ),
//       items: imageSliders,
//     );
//   }
// }

// final List<Widget> imageSliders = InfoFilm.map((item) => Container(
//       margin: EdgeInsets.all(8.0),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(15.0),
//         child: Stack(
//           children: <Widget>[
//             Image.asset(
//               item,
//               fit: BoxFit.contain,
//               width: double.infinity,
//               height: double.infinity,
//             ),
//             Positioned(
//               bottom: 0.0,
//               left: 0.0,
//               right: 0.0,
//               child: Container(
//                 decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     colors: [Colors.black.withOpacity(0.8), Colors.transparent],
//                     begin: Alignment.bottomCenter,
//                     end: Alignment.topCenter,
//                   ),
//                 ),
//                 padding: const EdgeInsets.symmetric(
//                     vertical: 10.0, horizontal: 20.0),
//                 child: Text(
//                   'Hình ảnh phim',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     )).toList();

// final List<String> InfoFilm = [
//   'assets/images/traihu.jpg',
//   'assets/images/minions4.jpg',
//   'assets/images/garfield_movie.jpg',
//   'assets/images/insideout2.jpg',
// ];
class CarouselFilm extends StatefulWidget {
  const CarouselFilm({super.key});

  @override
  _CarouselFilmState createState() => _CarouselFilmState();
}

class _CarouselFilmState extends State<CarouselFilm> {
  List<Film> films = [];

  @override
  void initState() {
    super.initState();
    loadFilmData();
  }

  Future<void> loadFilmData() async {
    List<Film> loadedFilms = await ReadData().loadData();
    setState(() {
      films = loadedFilms;
    });
  }

  @override
  Widget build(BuildContext context) {
    return films.isNotEmpty
        ? CarouselSlider(
            options: CarouselOptions(
              autoPlay: false,
              aspectRatio: 1.11, // Thay đổi tỷ lệ để phù hợp với màn hình
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
            ),
            items: films.map((film) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Stack(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/${film.img}', // Sử dụng hình ảnh từ assets
                            fit: BoxFit.cover,
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
                                  colors: [
                                    Colors.black.withOpacity(0.7),
                                    Colors.transparent
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    film.name ?? '',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      shadows: [
                                        Shadow(
                                          offset: Offset(0, 2),
                                          blurRadius: 4.0,
                                          color: Colors.black.withOpacity(0.7),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Thể loại: ${film.category ?? ''}',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 16,
                                      shadows: [
                                        Shadow(
                                          offset: Offset(0, 2),
                                          blurRadius: 4.0,
                                          color: Colors.black.withOpacity(0.7),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          )
        : Center(child: CircularProgressIndicator());
  }
}
