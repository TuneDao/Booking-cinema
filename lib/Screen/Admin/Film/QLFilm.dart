import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:project_android/Data/API/api.dart';
import 'package:project_android/Screen/Admin/Film/AddFilm.dart';
import 'package:project_android/Screen/Admin/Film/editFilm.dart';

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
        title: const Text(
          'Danh sách phim',
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(121, 0, 0, 1),
        leading: IconButton(
          icon: const FaIcon(FontAwesomeIcons.arrowLeft),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
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
                  child: Card(
                    color: Colors.grey[850],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Stack(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                              ),
                              child: Image.network(movie['AnhPhim'],
                                  height: 180, width: 100, fit: BoxFit.cover),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      movie['TenPhim'],
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            FaIcon(FontAwesomeIcons.video,
                                                color: Colors.blue, size: 20),
                                            const SizedBox(width: 8),
                                            Text.rich(
                                              TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: 'Đạo diễn: ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16,
                                                        color: Colors.white),
                                                  ),
                                                  TextSpan(
                                                    text: '${movie['DaoDien']}',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.white),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Row(
                                          children: [
                                            Icon(Icons.category,
                                                color: Colors.orange, size: 20),
                                            const SizedBox(width: 8),
                                            Text.rich(
                                              TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: 'Thể Loại: ',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16,
                                                        color: Colors.white),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        '${movie['TheLoai']['TenTL']}',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: movie['SuatChieux']
                                              .map<Widget>((suatChieu) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4.0),
                                              child: Text(
                                                'Suất chiếu: ${suatChieu['NgayChieu']} - ${suatChieu['ThoiGianBD']} đến ${suatChieu['ThoiGianKT']}\nTại rạp: ${suatChieu['RapChieu']}',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Column(
                            children: [
                              // NÚT SỬA
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => EditFilmPage(
                                                maPhim: movie['MaPhim'],
                                                tenPhim: movie['TenPhim'],
                                                anhPhim: movie['AnhPhim'],
                                                daoDien: movie['DaoDien'],
                                                ngonNgu: movie['NgonNgu'],
                                                moTa: movie['MoTa'],
                                              )));
                                },
                                child: const CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.yellow,
                                  child: Icon(Icons.edit, color: Colors.black),
                                ),
                              ),
                              const SizedBox(height: 12),
                              // NÚT XÓA
                              GestureDetector(
                                onTap: () {
                                  _showDeleteDialog(context, movie['MaPhim']);
                                },
                                child: const CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.red,
                                  child:
                                      Icon(Icons.delete, color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddFilmPage()));
        },
        backgroundColor: Color.fromRGBO(121, 0, 0, 1),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, String maPhim) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Xác nhận xóa"),
          content: Text("Bạn có chắc muốn xóa phim này không?"),
          actions: <Widget>[
            TextButton(
              child: Text("Không"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Có"),
              onPressed: () async {
                Navigator.of(context).pop();
                await deleteFilm(maPhim);
                setState(() {}); // Refresh the list after deletion
              },
            ),
          ],
        );
      },
    );
  }
}
