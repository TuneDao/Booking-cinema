import 'dart:convert';
import 'package:http/http.dart' as http;

// http://10.21.21.131:3030/ trường (HUFLIT-GV)
// http://10.21.11.217:3030/
// http://192.168.1.224:3030 nhà
const String baseUrl = 'http://192.168.1.224:3030/api/';

Future<dynamic> fetchData(String endpoint,
    [Map<String, String>? queryParams]) async {
  var uri = Uri.parse('$baseUrl$endpoint');
  if (queryParams != null) {
    uri = uri.replace(queryParameters: queryParams);
  }

  final response = await http.get(uri);

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

Future<Map<String, dynamic>> getBillByID(String maKH) async {
  return await fetchData('HoaDon/GetByID', {'MaKH': maKH});
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
