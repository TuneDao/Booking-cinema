import 'dart:convert';
import 'package:http/http.dart' as http;

// http://10.21.27.70:3030/ trường (HUFLIT-GV)
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

/*===================ADMIN============================ */
Future<Map<String, dynamic>> getBillDetailById(int maHD) async {
  final response = await http.get(
    Uri.parse('${baseUrl}HoaDon/GetByID?id=${maHD}'),
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
  int? maTL,
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
      'MaTL': maTL.toString(),
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
    Uri.parse('${baseUrl}SuatChieu/Post'),
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

Future<void> editFilm(int maPhim, String tenPhim, String anhPhim,
    String daoDien, int? maTL, String ngonNgu, mota) async {
  final response = await http.put(
    Uri.parse('${baseUrl}/Phim/Put/$maPhim'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'MaPhim': maPhim.toString(),
      'TenPhim': tenPhim,
      'AnhPhim': anhPhim,
      'DaoDien': daoDien,
      'NgonNgu': ngonNgu,
      'MaTL': maTL.toString(),
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

Future<void> editSC(int? maSC, String maPhim, String thoiGianBD,
    String thoiGianKT, String ngayChieu, String rapChieu) async {
  final response = await http.put(
    Uri.parse('${baseUrl}/SuatChieu/Put/$maSC'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'MaSC': maSC.toString(),
      'MaPhim': maPhim,
      'ThoiGianBD': thoiGianBD,
      'ThoiGianKT': thoiGianKT,
      'NgayChieu': ngayChieu,
      'RapChieu': rapChieu,
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
Future<void> deleteFilm(int? maPhim) async {
  final response = await http.delete(
    Uri.parse('${baseUrl}/Phim/Delete/$maPhim'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    print('Film deleted successfully.');
  } else {
    throw Exception('Failed to delete film.');
  }
}

Future<void> deleteSuatChieu(int maSC) async {
  final response = await http.delete(
    Uri.parse('${baseUrl}SuatChieu/Delete/$maSC'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
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

Future<bool> updateUser(String maKH, String hoTen, String email, String matKhau,
    String SDT, String anhDaidien) async {
  final response = await http.put(
    Uri.parse('${baseUrl}/KhachHang/Put/$maKH'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'MaKH': maKH,
      'HoTen': hoTen,
      'Email': email,
      'MatKhau': matKhau,
      'STD': SDT,
      'AnhDaiDien': anhDaidien,
    }),
  );

  if (response.statusCode == 200) {
    print('Cập nhật thành công.');
    return true;
  } else {
    print('Cập nhật bị lỗi.');
    return false;
  }
}

Future<bool> registerUser(Map<String, dynamic> userData) async {
  final response = await http.post(
    Uri.parse('${baseUrl}/KhachHang/Post'),
    headers: {
      'Content-Type': 'application/json',
    },
    body: jsonEncode(userData),
  );

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

/*==============================OTP======================== */

Future<Map<String, dynamic>> sendOTP(String email) async {
  final response = await http.post(
    Uri.parse('$baseUrl/KhachHang/PostOTP')
        .replace(queryParameters: {'email': email}),
    headers: {'Content-Type': 'application/json'},
  );

  if (response.statusCode == 200) {
    // Successful response
    return json.decode(response.body);
  } else {
    // Error response
    throw Exception('Failed to send OTP');
  }
}

Future<String> validateOTP() async {
  final response = await http.get(Uri.parse('$baseUrl/KhachHang/getOTP'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    return data['OTP'];
  } else {
    throw Exception('Failed to load OTP');
  }
}

/*==============================ForgotPassword======================== */
Future<String> getPassword(String email) async {
  final response = await http.get(
    Uri.parse(
        '$baseUrl/KhachHang/GetPassword?email=${Uri.encodeComponent(email)}'),
    headers: {'Accept': 'application/json'},
  );

  if (response.statusCode == 200) {
    // Parse the JSON response
    final data = json.decode(response.body);
    // Extract the password from the response
    if (data.containsKey('MatKhau')) {
      return data['MatKhau'];
    } else {
      throw Exception('Password not found in response');
    }
  } else {
    throw Exception('Failed to load password');
  }
}

/**==========================BILL======================= */
class ApiService {
  final String detailUrl = '${baseUrl}DatVe/Post';
  final String orderUrl = '${baseUrl}HoaDon/Post';

  Future<int?> createDetail(Map<String, dynamic> detailData) async {
    final http.Response detailResponse = await http.post(
      Uri.parse(detailUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(detailData),
    );

    if (detailResponse.statusCode == 201) {
      return jsonDecode(detailResponse.body)['MaDat'];
    } else {
      print('Tạo chi tiết hóa đơn thất bại: ${detailResponse.statusCode}');
      return null;
    }
  }

  Future<bool> createOrder(Map<String, dynamic> orderData) async {
    final http.Response orderResponse = await http.post(
      Uri.parse(orderUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(orderData),
    );

    if (orderResponse.statusCode == 201) {
      return true;
    } else {
      print('Tạo hóa đơn thất bại: ${orderResponse.statusCode}');
      return false;
    }
  }
}

//get MAX id Đặt vé
Future<int> fetchMaxIdDV() async {
  final response = await http.get(Uri.parse('${baseUrl}/DatVe/Get'));

  if (response.statusCode == 200) {
    final List<dynamic> accounts = json.decode(response.body);
    int maxId = accounts
        .map((account) => account['MaDat'])
        .reduce((a, b) => a > b ? a : b);
    return maxId;
  } else {
    throw Exception('Failed to load accounts');
  }
}

//get MAX id Hóa đơn
Future<int> fetchMaxIdHoaDon() async {
  final response = await http.get(Uri.parse('${baseUrl}/HoaDon/Get'));

  if (response.statusCode == 200) {
    final List<dynamic> accounts = json.decode(response.body);
    int maxId = accounts
        .map((account) => account['MaHD'])
        .reduce((a, b) => a > b ? a : b);
    return maxId;
  } else {
    throw Exception('Failed to load accounts');
  }
}

// get max id KhachHang
Future<int> fetchMaxIdKhachHang() async {
  final response = await http.get(Uri.parse('${baseUrl}/KhachHang/Get'));

  if (response.statusCode == 200) {
    final List<dynamic> accounts = json.decode(response.body);
    int maxId = accounts
        .map((account) => account['MaKH'])
        .reduce((a, b) => a > b ? a : b);
    return maxId;
  } else {
    throw Exception('Failed to load accounts');
  }
}
