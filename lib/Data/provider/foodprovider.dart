import 'package:flutter/services.dart';
import 'package:project_android/Data/model/food.dart';
import 'dart:convert';

class ReadDataFodd {
  Future<List<Food>> loadDataFood() async {
    var data = await rootBundle.loadString("assets/files/food.json");
    var dataJson = jsonDecode(data);
    return (dataJson['data'] as List).map((e) => Food.fromJson(e)).toList();
  }
}
