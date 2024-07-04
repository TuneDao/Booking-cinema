import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:project_android/Screen/User/SignIn/forgotpassword.dart';
import 'package:project_android/Screen/User/Home/home.dart';
import 'package:project_android/Screen/User/SignIn/register.dart';
import 'package:project_android/config/const.dart';

class SignInPage2 extends StatelessWidget {
  const SignInPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      body: Stack(
        children: [
          // Hình nền với hiệu ứng mờ
          Positioned.fill(
            child: Image.asset(
              'assets/images/background_login.jpg', // Thay thế đường dẫn đến hình ảnh của bạn
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 20.0,
                  sigmaY:
                      20.0), // Điều chỉnh giá trị sigma để thay đổi mức độ làm mờ
              child: Container(
                color:
                    Colors.black.withOpacity(0), // Giữ cho container trong suốt
              ),
            ),
          ),
          // Nội dung màn hình đăng nhập
          Center(
            child: SingleChildScrollView(
                child: isSmallScreen
                    ? const SingleChildScrollView(
                        child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _Logo(),
                          _FormContent(),
                        ],
                      ))
                    : SingleChildScrollView(
                        child: Container(
                        padding: const EdgeInsets.all(15.0),
                        constraints: const BoxConstraints(maxWidth: 800),
                        child: const Row(
                          children: [
                            Expanded(child: _Logo()),
                            Expanded(
                              child: Center(child: _FormContent()),
                            ),
                          ],
                        ),
                      ))),
          ),
        ],
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/logo2.png',
          width: isSmallScreen ? 230 : 500,
          height: isSmallScreen ? 200 : 500,
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            "ĐĂNG NHẬP",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}

class _FormContent extends StatefulWidget {
  const _FormContent({Key? key}) : super(key: key);

  @override
  State<_FormContent> createState() => __FormContentState();
}

class __FormContentState extends State<_FormContent> {
  final _userController = TextEditingController();
  final _passWordcontroller = TextEditingController();

  bool _isPasswordVisible = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Vui lòng nhập tài khoản';
                }
                return null;
              },
              controller: _userController,
              style: const TextStyle(color: Colors.yellow), // Màu chữ trắng
              decoration: const InputDecoration(
                labelText: 'Tài khoản',
                labelStyle:
                    TextStyle(color: Colors.yellow), // Màu chữ của label
                hintText: 'Tên tài khoản',
                hintStyle: TextStyle(color: Colors.yellow), // Màu chữ hint
                prefixIcon: Icon(
                  Icons.person_2_outlined,
                  color: Colors.yellow, // Màu của icon
                ),
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.yellow), // Màu của border
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.yellow), // Màu border khi chưa được focus
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.yellow), // Màu border khi được focus
                ),
              ),
            ),
            _gap(),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Vui lòng nhập mật khẩu';
                }

                if (value.length < 6) {
                  return 'Mật khẩu ít nhất phải 6 ký tự';
                }
                return null;
              },
              controller: _passWordcontroller,
              obscureText: !_isPasswordVisible,
              style: const TextStyle(color: Colors.yellow), // Màu chữ trắng
              decoration: InputDecoration(
                labelText: 'Mật khẩu',
                labelStyle:
                    const TextStyle(color: Colors.yellow), // Màu chữ của label
                hintText: 'Mật khẩu',
                hintStyle:
                    const TextStyle(color: Colors.yellow), // Màu chữ hint
                prefixIcon: const Icon(
                  Icons.lock_outline_rounded,
                  color: Colors.yellow, // Màu của icon
                ),
                border: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.yellow), // Màu của border
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.yellow), // Màu border khi chưa được focus
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.yellow), // Màu border khi được focus
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: Colors.yellow, // Màu của icon
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
            ),
            _gap(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ForgotPassword()), // Replace with your Forgot Password page
                      );
                    },
                    child: const textWhite(
                      text: 'Quên mật khẩu',
                    )),
              ],
            ),
            _gap(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  backgroundColor: colorTheme,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'ĐĂNG NHẬP',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                onPressed: () {
                  final username = _userController.text;
                  final password = _passWordcontroller.text;
                  if (_formKey.currentState?.validate() ?? false) {
                    if (username == "TuneDao" && password == "123456") {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    }
                  }
                },
              ),
            ),
            _gap(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const textWhite(text: 'Bạn đã có tài khoản ?'),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              RegisterPage()), // Replace with your Forgot Password page
                    );
                  },
                  child: const textWhite(text: ' Đăng ký tại đây'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}

// Định nghĩa widget textWhite
class textWhite extends StatelessWidget {
  final String text;

  const textWhite({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white),
    );
  }
}
