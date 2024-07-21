import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_android/Data/API/api.dart';
import 'package:project_android/Data/API/sharedpre.dart';
import 'package:project_android/Screen/Admin/adminscreen.dart';
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
                ),
              ),
              floating: false,
              pinned: true,
              stretch: true,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Image.asset(
                  "assets/images/neonCinema.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: Container(
          color: Colors.white,
          child: Center(
            child: SingleChildScrollView(
              child: isSmallScreen
                  ? const SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _Logo(),
                          _FormContent(),
                        ],
                      ),
                    )
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
          child: Text(
            "ĐĂNG NHẬP",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: colorHome,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
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
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 350),
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
              style: const TextStyle(
                color: colorHome,
                fontSize: 18,
              ),
              decoration: const InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: colorHome, fontSize: 18),
                hintText: 'Email',
                hintStyle: TextStyle(color: colorHome, fontSize: 18),
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: colorHome,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: colorHome),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorHome),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: colorHome),
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
              controller: _passwordController,
              obscureText: !_isPasswordVisible,
              style: const TextStyle(color: colorHome, fontSize: 18),
              decoration: InputDecoration(
                labelText: 'Mật khẩu',
                labelStyle: const TextStyle(color: colorHome, fontSize: 18),
                hintText: 'Mật khẩu',
                hintStyle: const TextStyle(color: colorHome, fontSize: 18),
                prefixIcon: const Icon(
                  Icons.lock_outline_rounded,
                  color: colorHome,
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: colorHome),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: colorHome),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: colorHome),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: colorHome,
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
                        builder: (context) => ForgotPassword(),
                      ),
                    );
                  },
                  child: const Text(
                    'Quên mật khẩu',
                    style: TextStyle(
                      color: colorTheme,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
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
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    'ĐĂNG NHẬP',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                onPressed: () async {
                  final email = _userController.text;
                  final password = _passwordController.text;

                  if (_formKey.currentState?.validate() ?? false) {
                    try {
                      final response = await login(email, password);
                      if (response["status"] == 'success') {
                        await SharedPreferencesUtil.saveUserDetails(
                          response["Email"],
                          response["HoTen"],
                          response["AnhDaiDien"],
                          response["MaKH"],
                          response["MatKhau"],
                          response["SDT"],
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Sai tài khoản hoặc mật khẩu'),
                          ),
                        );
                      }
                      if (response['Email'] == 'tuan@gmail.com' &&
                          response['MatKhau'] == '123456') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AdminScreen(),
                          ),
                        );
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Đăng nhập thất bại'),
                        ),
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
                const Text(
                  'Bạn chưa có tài khoản ?',
                  style: TextStyle(color: colorHome, fontSize: 16),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterPage(),
                      ),
                    );
                  },
                  child: const Text(
                    ' Đăng ký tại đây',
                    style: TextStyle(
                      color: colorTheme,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 20);
}
