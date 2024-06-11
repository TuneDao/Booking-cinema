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
