import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_android/Data/model/movie.dart';

// http://192.168.29.164:3030 / 4G
// http://192.168.1.224:3030 nhà

const String baseUrl = 'http://192.168.1.224:3030/api/';

class FilmProvider {
  Future<List<Film_API>> loadData() async {
    final response = await http.get(Uri.parse('${baseUrl}Phim/Get'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Film_API.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load films');
    }
  }
}
