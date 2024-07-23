import 'package:project_android/config/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  static Future<void> saveUserDetails(String email, String hoTen,
      String anhDaiDien, int? idUser, String password, String Sdt) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('Email', email);
    await prefs.setString('MaKH', idUser?.toString() ?? '');
    await prefs.setString('MatKhau', password);
    await prefs.setString('SDT', Sdt);
    await prefs.setString('HoTen', hoTen);
    await prefs.setString('AnhDaiDien', anhDaiDien);
  }

  static Future<Map<String, String?>> getUserDetails() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'Email': prefs.getString('Email'),
      'HoTen': prefs.getString('HoTen'),
      'MaKH': prefs.getString('MaKH'),
      'SDT': prefs.getString('SDT'),
      'MatKhau': prefs.getString('MatKhau'),
      'AnhDaiDien': prefs.getString('AnhDaiDien'),
    };
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('Email');
    await prefs.remove('HoTen');
    await prefs.remove('MaKH');
    await prefs.remove('AnhDaiDien');
    await prefs.remove('MatKhau');
    await prefs.remove('SDT');
  }
}
