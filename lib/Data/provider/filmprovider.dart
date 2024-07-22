import 'package:flutter/services.dart';
import '../model/filmmodel.dart';
import 'dart:convert';

class ReadData {
  Future<List<Film>> loadData() async {
    var data = await rootBundle.loadString("assets/files/film.json");
    var dataJson = jsonDecode(data);
    return (dataJson['data'] as List).map((e) => Film.fromJson(e)).toList();
  }
}

// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:project_android/Data/model/filmmodel.dart';

// const String baseUrl = 'http://192.168.1.224:3030/api/';

// class FilmProvider {
//   Future<List<Film>> loadData() async {
//     final response = await http.get(Uri.parse('${baseUrl}Phim/Get'));

//     if (response.statusCode == 200) {
//       List<dynamic> data = jsonDecode(response.body);
//       return data.map((json) => Film.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load films');
//     }
//   }
// }
