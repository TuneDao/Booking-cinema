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

Future<List<dynamic>> getMovies() async {
  return await fetchData('Phim/Get');
}

Future<List<dynamic>> getBill() async {
  return await fetchData('HoaDon/Get');
}

Future<List<dynamic>> getCustome() async {
  return await fetchData('KhachHang/Get');
}

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

Future<List<dynamic>> getBillById(String maKH) async {
  final response = await http.get(
    Uri.parse('${baseUrl}HoaDon/GetByID?MaKH=${maKH}'),
    headers: {'Content-Type': 'application/json'},
  );

  return json.decode(response.body);
}
