import 'package:flutter/material.dart';
import 'package:project_android/Pages/login.dart';

class OTP extends StatelessWidget {
  const OTP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
        body: Center(
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
                      )))));
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
          'assets/images/logo.png',
          width: isSmallScreen ? 230 : 500,
          height: isSmallScreen ? 200 : 500,
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text("XÁC NHẬN OTP",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromRGBO(21, 52, 72, 1),
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
              controller: _otpController,
              decoration: const InputDecoration(
                labelText: 'Nhập mã OTP',
                hintText: 'Mã OTP',
                border: OutlineInputBorder(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                  "Mã OTP sẽ được gửi qua email của bạn. Vui lòng truy cập email để lấy mã OTP",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromRGBO(21, 52, 72, 1),
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
                    backgroundColor: const Color.fromRGBO(232, 189, 15, 1)),
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
                      MaterialPageRoute(builder: (context) => SignInPage2()),
                    );
                  }
                },
              ),
            ),
            _gap(),
            const Text(
              'CONTACT US',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color.fromRGBO(21, 52, 72, 1)),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: null,
                  icon: Icon(Icons.facebook),
                  iconSize: 30,
                ),
                IconButton(
                  onPressed: null,
                  icon: Icon(Icons.email),
                  iconSize: 30,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}
