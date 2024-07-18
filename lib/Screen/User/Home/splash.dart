import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_android/config/const.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Mô phỏng việc tải dữ liệu hoặc khởi tạo.
    Future.delayed(Duration(seconds: 5), () {
      // Sau 3 giây, chuyển đến trang chủ hoặc trang đăng nhập.
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    // Thiết lập chế độ toàn màn hình cho splash screen.
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return Scaffold(
      backgroundColor: Colors.white, // Màu nền của splash screen.
      body: Center(
        child: Image.asset(
          urlLogo,
          errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
          width: 300,
          height: 300,
        ),
      ),
    );
  }
}