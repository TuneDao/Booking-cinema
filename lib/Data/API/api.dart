import 'dart:convert';
import 'package:http/http.dart' as http;

// http://10.21.21.131:3030/ trường (HUFLIT-GV)
// http://10.21.11.217:3030/
// http://10.21.43.166:3030/
// http://192.168.29.164:3030/ 4G Toàn
// http://192.168.1.224:3030 nhà
const String baseUrl = 'http://192.168.1.224:3030/api/';

Future<List<dynamic>> fetchData(String endpoint) async {
  final response = await http.get(Uri.parse('$baseUrl/$endpoint'));

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}

/*===================GET=============================*/
Future<List<dynamic>> getMovies() async {
  return await fetchData('Phim/Get');
}

Future<List<dynamic>> getBill() async {
  return await fetchData('HoaDon/Get');
}

Future<List<dynamic>> getCustome() async {
  return await fetchData('KhachHang/Get');
}

Future<List<dynamic>> getCategories() async {
  return await fetchData('TheLoai/Get');
}

Future<List<dynamic>> getBillById(String maKH) async {
  final response = await http.get(
    Uri.parse('${baseUrl}HoaDon/GetByID?MaKH=${maKH}'),
    headers: {'Content-Type': 'application/json'},
  );

  return json.decode(response.body);
}

Future<List<dynamic>> getSuatChieu() async {
  return await fetchData('SuatChieu/Get');
}
/*================POST============================== */

Future<void> addFilm(
  String maPhim,
  String tenPhim,
  String anhPhim,
  String daoDien,
  String maTL,
  String ngonNgu,
  String mota,
) async {
  final response = await http.post(
    Uri.parse('${baseUrl}Phim/Post'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'MaPhim': maPhim,
      'TenPhim': tenPhim,
      'AnhPhim': anhPhim,
      'DaoDien': daoDien,
      'MaTL': maTL,
      'NgonNgu': ngonNgu,
      'MoTa': mota,
    }),
  );
}

Future<void> addSuatChieu(
  String maSC,
  String maPhim,
  String thoigianBD,
  String thoigianKT,
  String ngayChieu,
  String rapChieu,
) async {
  final response = await http.post(
    Uri.parse('http://192.168.1.224:3030/api/SuatChieu/Post'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'MaSC': maSC,
      'MaPhim': maPhim,
      'ThoiGianBD': thoigianBD,
      'ThoiGianKT': thoigianKT,
      'NgayChieu': ngayChieu,
      'RapChieu': rapChieu,
    }),
  );

  if (response.statusCode == 201) {
    // If the server returns an OK response, parse the JSON.
    print('Suất chiếu added successfully.');
  } else {
    // If the server did not return an OK response, throw an exception.
    throw Exception('Failed to add suất chiếu.');
  }
}

/*===============PUT================================ */

Future<void> editFilm(String maPhim, String tenPhim, String anhPhim,
    String daoDien, String maTL, String ngonNgu, mota) async {
  final response = await http.put(
    Uri.parse('${baseUrl}/Phim/Put/$maPhim'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'MaPhim': maPhim,
      'TenPhim': tenPhim,
      'AnhPhim': anhPhim,
      'DaoDien': daoDien,
      'MaTL': maTL,
      'MoTa': mota,
    }),
  );

  if (response.statusCode == 200) {
    // If the server returns an OK response, parse the JSON.
    print('Film edited successfully.');
  } else {
    // If the server did not return an OK response, throw an exception.
    throw Exception('Failed to edit film.');
  }
}

/*===============DELETE============================= */
Future<void> deleteFilm(String maPhim) async {
  final response = await http.delete(
    Uri.parse('${baseUrl}/Delete/$maPhim'),
  );

  if (response.statusCode == 200) {
    print('Film deleted successfully.');
  } else {
    throw Exception('Failed to delete film.');
  }
}

Future<void> deleteSuatChieu(String maSC) async {
  final response = await http.delete(
    Uri.parse('${baseUrl}SuatChieu/Delete/$maSC'),
  );

  if (response.statusCode == 200) {
    print('Xóa xuất chiếu thành công.');
  } else {
    throw Exception('Lỗi xóa xuất chiếu.');
  }
}

/*==============================USER======================== */

Future<Map<String, dynamic>> login(String email, String password) async {
  final response = await http.post(
    Uri.parse(
        '${baseUrl}KhachHang/login?email=${email}&password=${password}'), // Đảm bảo đúng trường hợp và endpoint
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to login: ${response.body}');
  }
}
