import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project_android/Screen/User/SignIn/changepassword.dart';
import 'package:project_android/Screen/User/SignIn/otp.dart';
import 'package:project_android/config/const.dart';

import '../../../Data/API/api.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

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
          child: Text("QUÊN MẬT KHẨU",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: colorHome, fontSize: 30, fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text("Nhập email tài khoản bạn đã đăng ký",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: colorHome, fontSize: 16, fontWeight: FontWeight.bold)),
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _email;

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
              onSaved: (value) => _email = value,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Vui lòng nhập thông tin';
                }
                bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value);
                if (!emailValid) {
                  return 'Vui lòng nhập email';
                }
                return null;
              },
              style: const TextStyle(color: colorHome),
              decoration: const InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: colorHome),
                hintText: 'Email',
                hintStyle: TextStyle(color: colorHome),
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
                    'GỬI OTP',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    try {
                      await sendOTP(_email!);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OTP(email: _email!),
                        ),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Failed to send OTP: $e')),
                      );
                    }
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
