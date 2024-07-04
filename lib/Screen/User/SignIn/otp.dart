import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_android/Screen/User/SignIn/changepassword.dart';
import 'package:project_android/config/const.dart';

class OTP extends StatelessWidget {
  const OTP({Key? key}) : super(key: key);

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
                        )))),
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
          child: Text("XÁC NHẬN OTP",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
        ),
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
  final _otpController = TextEditingController();

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
                // add email validation
                if (value == null || value.isEmpty) {
                  return 'Vui lòng nhập OTP';
                }
                bool otpValid = RegExp("[a-z0-9]*\\d[a-z0-9]*").hasMatch(value);
                if (!otpValid) {
                  return 'Vui lòng nhập OTP';
                }
                return null;
              },
              style: const TextStyle(color: Colors.yellow),
              controller: _otpController,
              decoration: const InputDecoration(
                labelText: 'Nhập mã OTP',
                labelStyle: TextStyle(color: Colors.yellow),
                hintText: 'Mã OTP',
                hintStyle: TextStyle(color: Colors.yellow),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.yellow),
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
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                  "Mã OTP sẽ được gửi qua email của bạn. Vui lòng truy cập email để lấy mã OTP",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ),
            _gap(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    backgroundColor: colorTheme),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'XÁC NHẬN',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    /// do something
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChangePassword()),
                    );
                  }
                },
              ),
            ),
            _gap(),
          ],
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}
