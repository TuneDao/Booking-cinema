import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_android/Data/API/api.dart';
import 'package:project_android/Screen/User/Home/home.dart';
import 'package:project_android/config/const.dart';

class filmManagement extends StatefulWidget {
  const filmManagement({super.key});

  @override
  _filmManagement createState() => _filmManagement();
}

class _filmManagement extends State<filmManagement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorTheme,
        leading: IconButton(
          icon: const FaIcon(FontAwesomeIcons.arrowLeft),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Row(
          children: [
            Text(
              'Quản lý phim',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      /////
      body: FutureBuilder<List<dynamic>>(
        future: getMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final movies = snapshot.data!;
            return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    width: 380,
                    height: 270,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            spreadRadius: 0,
                            blurRadius: 3,
                            offset:
                                Offset(5, 5)), // 5,5 là bên dưới và bên phải
                      ],
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    // NƠI CHỨA THÔNG TIN PHIM
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 125,
                                  height: 180,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: NetworkImage(movie['AnhPhim']),
                                        fit: BoxFit.cover,
                                      ),
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.black,
                                      )),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        movie['TenPhim'],
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'Đạo Diễn: ' + movie['DaoDien'],
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'Thể loại: ${movie['TheLoai']['TenTL']}',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                      SizedBox(height: 8),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: movie['SuatChieux']
                                            .map<Widget>((suatChieu) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4.0),
                                            child: Text(
                                              'Suất chiếu: ${suatChieu['NgayChieu']} - ${suatChieu['ThoiGianBD']} đến ${suatChieu['ThoiGianKT']} tại rạp ${suatChieu['RapChieu']}',
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 170,
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Sửa',
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.black),
                                    ),
                                    style: TextButton.styleFrom(
                                      backgroundColor:
                                          Color.fromRGBO(255, 213, 79, 1),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 170,
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Xóa',
                                      style: TextStyle(
                                          fontSize: 17, color: Colors.white),
                                    ),
                                    style: TextButton.styleFrom(
                                      backgroundColor:
                                          Color.fromRGBO(255, 79, 79, 1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
