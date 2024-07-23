import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:project_android/Screen/User/SignIn/getpassword.dart';
import 'package:project_android/config/const.dart';
import '../../../Data/API/api.dart';

class OTP extends StatelessWidget {
  final String email;
  const OTP({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 300.0,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: colorTheme,
                  )),
              floating: false,
              pinned: true,
              stretch: true,
              flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  background: Image.asset(
                    "assets/images/neonCinema.jpg",
                    fit: BoxFit.cover,
                  )),
            ),
          ];
        },
        body: Center(
          child: SingleChildScrollView(
            child: isSmallScreen
                ? SingleChildScrollView(
                    child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const _Logo(),
                      _FormContent(email: email),
                    ],
                  ))
                : SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      constraints: const BoxConstraints(maxWidth: 800),
                      child: Row(
                        children: [
                          const Expanded(child: _Logo()),
                          Expanded(
                            child: Center(child: _FormContent(email: email)),
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text("XÁC NHẬN OTP",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}

class _FormContent extends StatefulWidget {
  final String email;
  const _FormContent({Key? key, required this.email}) : super(key: key);

  @override
  State<_FormContent> createState() => __FormContentState();
}

class __FormContentState extends State<_FormContent> {
  final _otpController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30.0),
      constraints: const BoxConstraints(maxWidth: 600),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Vui lòng nhập OTP';
                }
                bool otpValid = RegExp(r"[a-z0-9]*\d[a-z0-9]*").hasMatch(value);
                if (!otpValid) {
                  return 'Vui lòng nhập OTP';
                }
                return null;
              },
              style: const TextStyle(color: Colors.black),
              controller: _otpController,
              decoration: const InputDecoration(
                labelText: 'Nhập mã OTP',
                labelStyle: TextStyle(color: Colors.black),
                hintText: 'Mã OTP',
                hintStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                  "Mã OTP sẽ được gửi qua email của bạn. Vui lòng truy cập email để lấy mã OTP",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
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
                onPressed: () async {
                  try {
                    // Lấy OTP từ server
                    final serverOtp = await validateOTP();
                    print(serverOtp);
                    // So sánh OTP từ người dùng với OTP từ server
                    if (_otpController.text == serverOtp) {
                      // OTP đúng
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Xác nhận OTP thành công'),
                      ));
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  GetPassword(email: widget.email)));
                      // Thực hiện hành động tiếp theo, ví dụ điều hướng đến trang khác
                    } else {
                      // OTP không đúng
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('OTP không hợp lệ'),
                      ));
                    }
                  } catch (e) {
                    // Xử lý lỗi nếu API không thành công
                    print(e);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Lỗi khi kiểm tra OTP'),
                    ));
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
