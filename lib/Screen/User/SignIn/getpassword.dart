import 'package:flutter/material.dart';
import 'package:project_android/Screen/User/SignIn/login.dart';
import '../../../Data/API/api.dart';
import '../../../config/const.dart';

class GetPassword extends StatefulWidget {
  final String email;
  const GetPassword({Key? key, required this.email}) : super(key: key);

  @override
  State<GetPassword> createState() => _GetPasswordState();
}

class _GetPasswordState extends State<GetPassword> {
  late Future<String> _passwordFuture;

  @override
  void initState() {
    super.initState();
    _passwordFuture = getPassword(widget.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          'Lấy lại mật khẩu',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: colorTheme,
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: _passwordFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Lỗi: ${snapshot.error}');
            } else {
              final password = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Mật khẩu của bạn là:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      password,
                      style: const TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
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
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignInPage2()));
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
