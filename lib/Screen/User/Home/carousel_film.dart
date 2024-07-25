// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:project_android/Data/model/filmmodel.dart';
// import 'package:project_android/Data/provider/filmprovider.dart';
// import 'package:project_android/Screen/User/Tickets/detailfilm.dart';

// class CarouselFilm extends StatefulWidget {
//   const CarouselFilm({super.key});

//   @override
//   _CarouselFilmState createState() => _CarouselFilmState();
// }

// class _CarouselFilmState extends State<CarouselFilm> {
//   List<Film> films = [];

//   @override
//   void initState() {
//     super.initState();
//     loadFilmData();
//   }

//   Future<void> loadFilmData() async {
//     List<Film> loadedFilms = await ReadData().loadData();
//     setState(() {
//       films = loadedFilms;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return films.isNotEmpty
//         ? CarouselSlider(
//             options: CarouselOptions(
//               autoPlay: false,
//               aspectRatio: 0.8,
//               enlargeCenterPage: true,
//               enlargeFactor: 0.5,
//               enlargeStrategy: CenterPageEnlargeStrategy.zoom,
//             ),
//             items: films.map((film) {
//               return Builder(
//                 builder: (BuildContext context) {
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => FilmDetailScreen(film: film),
//                         ),
//                       );
//                     },
//                     child: Container(
//                       margin: EdgeInsets.symmetric(horizontal: 5.0),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(15.0),
//                         child: Stack(
//                           children: <Widget>[
//                             Image.asset(
//                               'assets/images/${film.img}',
//                               fit: BoxFit.cover,
//                               width: double.infinity,
//                               height: double.infinity,
//                             ),
//                             Positioned(
//                               bottom: 0.0,
//                               left: 0.0,
//                               right: 0.0,
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   gradient: LinearGradient(
//                                     colors: [
//                                       Colors.black.withOpacity(0.7),
//                                       Colors.transparent,
//                                     ],
//                                     begin: Alignment.bottomCenter,
//                                     end: Alignment.topCenter,
//                                   ),
//                                 ),
//                                 padding: const EdgeInsets.symmetric(
//                                     vertical: 10.0, horizontal: 20.0),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       film.name ?? '',
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold,
//                                         shadows: [
//                                           Shadow(
//                                             offset: Offset(0, 2),
//                                             blurRadius: 4.0,
//                                             color:
//                                                 Colors.black.withOpacity(0.7),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     SizedBox(height: 5),
//                                     Text(
//                                       'Thể loại: ${film.category ?? ''}',
//                                       style: TextStyle(
//                                         color: Colors.white70,
//                                         fontSize: 16,
//                                         shadows: [
//                                           Shadow(
//                                             offset: Offset(0, 2),
//                                             blurRadius: 4.0,
//                                             color:
//                                                 Colors.black.withOpacity(0.7),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               );
//             }).toList(),
//           )
//         : Center(child: CircularProgressIndicator());
//   }
// }
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project_android/Data/API/api.dart';
import 'package:project_android/Data/model/filmmodel.dart';
import 'package:project_android/Data/model/movie.dart';
import 'package:project_android/Data/provider/movies_provider.dart';
import 'package:project_android/Screen/User/Tickets/detailfilm.dart';

class CarouselFilm extends StatefulWidget {
  const CarouselFilm({super.key});

  @override
  _CarouselFilmState createState() => _CarouselFilmState();
}

class _CarouselFilmState extends State<CarouselFilm> {
  List<Film_API> films = [];
  @override
  void initState() {
    super.initState();
    loadFilmData();
  }

  Future<void> loadFilmData() async {
    try {
      List<Film_API> loadedFilms = await FilmProvider().loadData();
      setState(() {
        films = loadedFilms;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return films.isNotEmpty
        ? CarouselSlider(
            options: CarouselOptions(
              autoPlay: false,
              aspectRatio: 0.8,
              enlargeCenterPage: true,
              enlargeFactor: 0.5,
              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
            ),
            items: films.map((film) {
              return Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FilmDetailScreen(film: film),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Stack(
                          children: <Widget>[
                            Image.network(
                              film.anhPhim,
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
                                      Colors.transparent,
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
                                      film.tenPhim,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        shadows: [
                                          Shadow(
                                            offset: Offset(0, 2),
                                            blurRadius: 4.0,
                                            color:
                                                Colors.black.withOpacity(0.7),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Thể loại: ${film.theLoai}',
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 16,
                                        shadows: [
                                          Shadow(
                                            offset: Offset(0, 2),
                                            blurRadius: 4.0,
                                            color:
                                                Colors.black.withOpacity(0.7),
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
                    ),
                  );
                },
              );
            }).toList(),
          )
        : Center(child: CircularProgressIndicator());
  }
}
