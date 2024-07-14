import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      body: Container(
        color: Colors.white, // Replace with your desired background color
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
      ),
    ));
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
                  color: colorHome, fontSize: 18), // Increased font size
              decoration: const InputDecoration(
                labelText: 'Tài khoản',
                labelStyle: TextStyle(
                    color: colorHome, fontSize: 18), // Increased font size
                hintText: 'Tên tài khoản',
                hintStyle: TextStyle(
                    color: colorHome, fontSize: 18), // Increased font size
                prefixIcon: Icon(
                  Icons.person_2_outlined,
                  color: colorHome, // Màu của icon
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: colorHome), // Màu của border
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: colorHome), // Màu border khi chưa được focus
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: colorHome), // Màu border khi được focus
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
              style: const TextStyle(
                  color: colorHome, fontSize: 18), // Increased font size
              decoration: InputDecoration(
                labelText: 'Mật khẩu',
                labelStyle: const TextStyle(
                    color: colorHome, fontSize: 18), // Increased font size
                hintText: 'Mật khẩu',
                hintStyle: const TextStyle(
                    color: colorHome, fontSize: 18), // Increased font size
                prefixIcon: const Icon(
                  Icons.lock_outline_rounded,
                  color: colorHome, // Màu của icon
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: colorHome), // Màu của border
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: colorHome), // Màu border khi chưa được focus
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: colorHome), // Màu border khi được focus
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: colorHome, // Màu của icon
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
                    child: const Text(
                      'Quên mật khẩu',
                      style: TextStyle(
                          color: colorTheme, fontWeight: FontWeight.bold),
                    ))
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
                  padding: EdgeInsets.all(14.0), // Increased padding
                  child: Text(
                    'ĐĂNG NHẬP',
                    style: TextStyle(
                      fontSize: 18, // Increased font size
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
                const Text('Bạn chưa có tài khoản ?',
                    style: TextStyle(
                        color: colorHome, fontSize: 16)), // Increased font size
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              RegisterPage()), // Replace with your Forgot Password page
                    );
                  },
                  child: const Text(
                    ' Đăng ký tại đây',
                    style: TextStyle(
                        color: colorTheme,
                        fontWeight: FontWeight.bold,
                        fontSize: 16), // Increased font size
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 20); // Increased gap height
}
