// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:project_android/config/const.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key});
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // Mô phỏng việc tải dữ liệu hoặc khởi tạo.
//     Future.delayed(Duration(seconds: 5), () {
//       // Sau 3 giây, chuyển đến trang chủ hoặc trang đăng nhập.
//       Navigator.pushReplacementNamed(context, '/home');
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Thiết lập chế độ toàn màn hình cho splash screen.
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

//     return Scaffold(
//       backgroundColor: colorTheme, // Màu nền của splash screen.
//       body: ClipRRect(
//         child: Center(
//           child: Image.asset(
//             urlLogo1,
//             errorBuilder: (context, error, stackTrace) =>
//                 const SizedBox.shrink(),
//             width: 300,
//             height: 300,
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_android/config/const.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Mô phỏng việc tải dữ liệu hoặc khởi tạo.
    Future.delayed(const Duration(seconds: 10), () {
      // Sau 3 giây, chuyển đến trang chủ hoặc trang đăng nhập.
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    // Thiết lập chế độ toàn màn hình cho splash screen.
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    return Scaffold(
      backgroundColor: colorTheme, // Màu nền của splash screen.
      body: Center(
        child: FutureBuilder(
          future: precacheImage(AssetImage(urlLogo1), context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Image.asset(
                urlLogo1,
                width: 300,
                height: 300,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.error, size: 100, color: Colors.red),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
