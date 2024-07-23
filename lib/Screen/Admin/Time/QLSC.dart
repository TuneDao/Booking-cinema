import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:project_android/Data/API/api.dart';
import 'package:project_android/Screen/Admin/Film/editFilm.dart';
import 'package:project_android/Screen/Admin/Time/add_SC.dart';
import 'package:project_android/Screen/Admin/Time/edit_SC.dart';

class SuatChieuManagement extends StatefulWidget {
  const SuatChieuManagement({super.key});
  @override
  _suatchieuManagement createState() => _suatchieuManagement();
}

class _suatchieuManagement extends State<SuatChieuManagement> {
  late Future<List<dynamic>> _itemsFuture;
  @override
  void initState() {
    super.initState();
    _itemsFuture = getSuatChieu();
  }

  Future<void> _refreshItems() async {
    setState(() {
      _itemsFuture = getSuatChieu();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Danh sách suất chiếu',
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
        future: getSuatChieu(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final times = snapshot.data!;
            return RefreshIndicator(
              onRefresh: _refreshItems,
              child: ListView.builder(
                itemCount: times.length,
                itemBuilder: (context, index) {
                  final time = times[index];
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
                              const SizedBox(width: 15),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'SC0' + time['MaSC'].toString(),
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
                                              Icon(
                                                  Icons
                                                      .video_camera_back_outlined,
                                                  color: Colors.blue,
                                                  size: 20),
                                              const SizedBox(width: 8),
                                              Text.rich(
                                                TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text:
                                                          'Thời gian bắt đầu: ',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16,
                                                          color: Colors.white),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          '${time['ThoiGianBD']}',
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
                                              Icon(
                                                  Icons
                                                      .video_camera_back_rounded,
                                                  color: Colors.red,
                                                  size: 20),
                                              const SizedBox(width: 8),
                                              Text.rich(
                                                TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text:
                                                          'Thời gian kết thúc: ',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16,
                                                          color: Colors.white),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          '${time['ThoiGianKT']}',
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
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.calendar_today,
                                                  color: Colors.orange,
                                                  size: 20),
                                              const SizedBox(width: 8),
                                              Text.rich(
                                                TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'Ngày chiếu: ',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16,
                                                          color: Colors.white),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          '${time['NgayChieu']}',
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
                                          Row(
                                            children: [
                                              Icon(Icons.room,
                                                  color: Colors.green,
                                                  size: 20),
                                              const SizedBox(width: 8),
                                              Text.rich(
                                                TextSpan(
                                                  children: [
                                                    TextSpan(
                                                      text: 'Phòng: ',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 16,
                                                          color: Colors.white),
                                                    ),
                                                    TextSpan(
                                                      text:
                                                          '${time['RapChieu']}',
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
                                            builder: (context) =>
                                                EditSuatChieuScreen(
                                                  maSC: time['MaSC'],
                                                  maPhim: time['MaPhim'],
                                                )));
                                  },
                                  child: const CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.yellow,
                                    child:
                                        Icon(Icons.edit, color: Colors.black),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                // NÚT XÓA
                                GestureDetector(
                                  onTap: () {
                                    _showDeleteDialog(context, time['MaSC']);
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
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddSuatChieuScreen()));
        },
        backgroundColor: Color.fromRGBO(121, 0, 0, 1),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  void _showDeleteDialog(BuildContext context, int maSC) {
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
                await deleteSuatChieu(maSC);
                setState(() {}); // Refresh the list after deletion
              },
            ),
          ],
        );
      },
    );
  }
}
