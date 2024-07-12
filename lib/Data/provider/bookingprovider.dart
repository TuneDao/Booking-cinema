// Parse JSON data and create a list of MovieBooking objects
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:project_android/Data/model/booking.dart';

class ReadDataFodd {
  Future<List<MovieBooking>> loadDataBooking() async {
    var data = await rootBundle.loadString("assets/files/booking.json");
    var dataJson = jsonDecode(data);
    return (dataJson['data'] as List)
        .map((e) => MovieBooking.fromJson(e))
        .toList();
  }
}
