// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:project_android/Screen/User/SignIn/login.dart';
// import 'package:project_android/config/const.dart';

// class RegisterPage extends StatelessWidget {
//   const RegisterPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

//     return Scaffold(
//         body: NestedScrollView(
//       headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//         return <Widget>[
//           SliverAppBar(
//             expandedHeight: 300.0,
//             leading: IconButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 icon: const Icon(
//                   Icons.arrow_back,
//                   color: colorTheme,
//                 )),
//             floating: false,
//             pinned: true,
//             stretch: true,
//             flexibleSpace: FlexibleSpaceBar(
//                 collapseMode: CollapseMode.parallax,
//                 background: Image.asset(
//                   "assets/images/neonCinema2.jpg",
//                   fit: BoxFit.cover,
//                 )),
//           ),
//         ];
//       },
//       body: Container(
//         color: Colors.white, // Replace with your desired background color
//         child: Center(
//           child: SingleChildScrollView(
//               child: isSmallScreen
//                   ? const SingleChildScrollView(
//                       child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         _Logo(),
//                         _FormContent(),
//                       ],
//                     ))
//                   : SingleChildScrollView(
//                       child: Container(
//                       padding: const EdgeInsets.all(15.0),
//                       constraints: const BoxConstraints(maxWidth: 800),
//                       child: const Row(
//                         children: [
//                           Expanded(child: _Logo()),
//                           Expanded(
//                             child: Center(child: _FormContent()),
//                           ),
//                         ],
//                       ),
//                     ))),
//         ),
//       ),
//     ));
//   }
// }

// class _Logo extends StatelessWidget {
//   const _Logo({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

//     return const Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Text("ĐĂNG KÝ",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   color: colorHome,
//                   fontSize: 34, // Increased font size
//                   fontWeight: FontWeight.bold)),
//         )
//       ],
//     );
//   }
// }

// class _FormContent extends StatefulWidget {
//   const _FormContent({Key? key}) : super(key: key);

//   @override
//   State<_FormContent> createState() => __FormContentState();
// }

// class __FormContentState extends State<_FormContent> {
//   bool _isPasswordVisible = false;
//   bool _isPasswordVisible1 = false;
//   final _userController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       constraints: const BoxConstraints(maxWidth: 350), // Increased maxWidth
//       child: Form(
//         key: _formKey,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             _buildTextField(
//               controller: _userController,
//               label: 'Tài khoản',
//               hint: 'Tên tài khoản',
//               icon: Icons.person_2_outlined,
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Vui lòng nhập tài khoản';
//                 }
//                 return null;
//               },
//             ),
//             _gap(),
//             _buildPasswordField(
//               isPasswordVisible: _isPasswordVisible,
//               onVisibilityToggle: () {
//                 setState(() {
//                   _isPasswordVisible = !_isPasswordVisible;
//                 });
//               },
//               label: 'Mật khẩu',
//               hint: 'Nhập mật khẩu',
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Vui lòng nhập mật khẩu';
//                 }
//                 if (value.length < 6) {
//                   return 'Mật khẩu phải trên 6 ký tự';
//                 }
//                 return null;
//               },
//             ),
//             _gap(),
//             _buildPasswordField(
//               isPasswordVisible: _isPasswordVisible1,
//               onVisibilityToggle: () {
//                 setState(() {
//                   _isPasswordVisible1 = !_isPasswordVisible1;
//                 });
//               },
//               label: 'Xác nhận mật khẩu',
//               hint: 'Nhập lại mật khẩu',
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Vui lòng nhập mật khẩu';
//                 }
//                 if (value.length < 6) {
//                   return 'Mật khẩu phải trên 6 ký tự';
//                 }
//                 return null;
//               },
//             ),
//             _gap(),
//             _buildTextField(
//               controller: TextEditingController(),
//               label: 'Email',
//               hint: 'Nhập email',
//               icon: Icons.email_outlined,
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Vui lòng nhập email';
//                 }
//                 bool emailValid = RegExp(
//                         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                     .hasMatch(value);
//                 if (!emailValid) {
//                   return 'Vui lòng nhập email hợp lệ';
//                 }
//                 return null;
//               },
//             ),
//             _gap(),
//             _buildTextField(
//               controller: TextEditingController(),
//               label: 'Số điện thoại',
//               hint: 'Nhập số điện thoại',
//               icon: Icons.phone_iphone_outlined,
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Vui lòng nhập số điện thoại';
//                 }
//                 if (value.length != 10) {
//                   return 'Nhập số điện thoại đúng 10 số';
//                 }
//                 return null;
//               },
//             ),
//             _gap(),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(4)),
//                     backgroundColor: colorTheme),
//                 child: const Padding(
//                   padding: EdgeInsets.all(16.0), // Increased padding
//                   child: Text(
//                     'ĐĂNG KÝ',
//                     style: TextStyle(
//                         fontSize: 18, // Increased font size
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white),
//                   ),
//                 ),
//                 onPressed: () {
//                   if (_formKey.currentState?.validate() ?? false) {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => SignInPage2()),
//                     );
//                   }
//                 },
//               ),
//             ),
//             _gap(),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text('Bạn đã có tài khoản',
//                     style: TextStyle(
//                         color: colorHome, fontSize: 16)), // Increased font size
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) =>
//                               SignInPage2()), // Replace with your Forgot Password page
//                     );
//                   },
//                   child: const Text(
//                     ' Đăng nhập tại đây',
//                     style: TextStyle(
//                         color: colorTheme,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16), // Increased font size
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _gap() => const SizedBox(height: 20); // Increased gap height

//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String label,
//     required String hint,
//     required IconData icon,
//     required String? Function(String?)? validator,
//   }) {
//     return TextFormField(
//       controller: controller,
//       style: const TextStyle(
//           color: colorHome, fontSize: 18), // Increased font size
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: const TextStyle(
//             color: colorHome, fontSize: 18), // Increased font size
//         hintText: hint,
//         hintStyle: const TextStyle(
//             color: colorHome, fontSize: 18), // Increased font size
//         prefixIcon: Icon(
//           icon,
//           color: colorHome,
//         ),
//         border: const OutlineInputBorder(
//           borderSide: BorderSide(color: colorHome),
//         ),
//         enabledBorder: const OutlineInputBorder(
//           borderSide:
//               BorderSide(color: colorHome), // Border color when not focused
//         ),
//         focusedBorder: const OutlineInputBorder(
//           borderSide: BorderSide(color: colorHome), // Border color when focused
//         ),
//       ),
//       validator: validator,
//     );
//   }

//   Widget _buildPasswordField({
//     required bool isPasswordVisible,
//     required VoidCallback onVisibilityToggle,
//     required String label,
//     required String hint,
//     required String? Function(String?)? validator,
//   }) {
//     return TextFormField(
//       obscureText: !isPasswordVisible,
//       style: const TextStyle(
//           color: colorHome, fontSize: 18), // Increased font size
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: const TextStyle(
//             color: colorHome, fontSize: 18), // Increased font size
//         hintText: hint,
//         hintStyle: const TextStyle(
//             color: colorHome, fontSize: 18), // Increased font size
//         prefixIcon: const Icon(
//           Icons.lock_outline_rounded,
//           color: colorHome,
//         ),
//         border: const OutlineInputBorder(
//           borderSide: BorderSide(color: colorHome),
//         ),
//         enabledBorder: const OutlineInputBorder(
//           borderSide:
//               BorderSide(color: colorHome), // Border color when not focused
//         ),
//         focusedBorder: const OutlineInputBorder(
//           borderSide: BorderSide(color: colorHome), // Border color when focused
//         ),
//         suffixIcon: IconButton(
//           icon: Icon(
//             isPasswordVisible ? Icons.visibility_off : Icons.visibility,
//             color: colorHome,
//           ),
//           onPressed: onVisibilityToggle,
//         ),
//       ),
//       validator: validator,
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:project_android/Data/API/api.dart';
import 'package:project_android/Screen/User/SignIn/login.dart';
import 'package:project_android/config/const.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

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
                  "assets/images/neonCinema2.jpg",
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
          child: Text("ĐĂNG KÝ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: colorHome,
                  fontSize: 34, // Increased font size
                  fontWeight: FontWeight.bold)),
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
  bool _isPasswordVisible = false;
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  final _avatarController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 350), // Increased maxWidth
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTextField(
              controller: _userController,
              label: 'Họ Tên',
              hint: 'Họ Tên',
              icon: Icons.person_2_outlined,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Vui lòng nhập họ tên';
                }
                return null;
              },
            ),
            _gap(),
            _buildTextField(
              controller: _emailController,
              label: 'Email',
              hint: 'Nhập email',
              icon: Icons.email_outlined,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Vui lòng nhập email';
                }
                bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(value);
                if (!emailValid) {
                  return 'Vui lòng nhập email hợp lệ';
                }
                return null;
              },
            ),
            _gap(),
            _buildPasswordField(
              controller: _passwordController,
              isPasswordVisible: _isPasswordVisible,
              onVisibilityToggle: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
              label: 'Mật khẩu',
              hint: 'Nhập mật khẩu',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Vui lòng nhập mật khẩu';
                }
                if (value.length < 6) {
                  return 'Mật khẩu phải trên 6 ký tự';
                }
                return null;
              },
            ),
            _gap(),
            _buildTextField(
              controller: _phoneController,
              label: 'Số điện thoại',
              hint: 'Nhập số điện thoại',
              icon: Icons.phone_iphone_outlined,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Vui lòng nhập số điện thoại';
                }
                if (value.length != 10) {
                  return 'Nhập số điện thoại đúng 10 số';
                }
                return null;
              },
            ),
            _gap(),
            _buildTextField(
              controller: _avatarController,
              label: 'Ảnh đại diện',
              hint: 'Hình Ảnh URL',
              icon: Icons.image,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Vui lòng nhập hình ảnh';
                }
                return null;
              },
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
                  padding: EdgeInsets.all(16.0), // Increased padding
                  child: Text(
                    'ĐĂNG KÝ',
                    style: TextStyle(
                        fontSize: 18, // Increased font size
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                onPressed: () async {
                  int MaxMaKH = await fetchMaxIdKhachHang();
                  if (_formKey.currentState?.validate() ?? false) {
                    Map<String, dynamic> userData = {
                      "MaKH": MaxMaKH + 1,
                      "HoTen": _userController.text,
                      "Email": _emailController.text,
                      "MatKhau": _passwordController.text,
                      "STD": _phoneController.text,
                      "AnhDaiDien": _avatarController
                          .text, // Replace with the actual data or remove if not needed
                    };
                    bool success = await registerUser(userData);
                    if (success) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInPage2()),
                      );
                    }
                    // } else {
                    //   // Show error message
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(
                    //       content: Text('Đăng ký thất bại. Vui lòng thử lại.'),
                    //     ),
                    //   );
                    // }
                  }
                },
              ),
            ),
            _gap(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Bạn đã có tài khoản',
                    style: TextStyle(
                        color: colorHome, fontSize: 16)), // Increased font size
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              SignInPage2()), // Replace with your Forgot Password page
                    );
                  },
                  child: const Text(
                    ' Đăng nhập tại đây',
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    required String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(
          color: colorHome, fontSize: 18), // Increased font size
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
            color: colorHome, fontSize: 18), // Increased font size
        hintText: hint,
        hintStyle: const TextStyle(
            color: colorHome, fontSize: 18), // Increased font size
        prefixIcon: Icon(
          icon,
          color: colorHome,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: colorHome),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: colorHome), // Border color when not focused
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: colorHome), // Border color when focused
        ),
      ),
      validator: validator,
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required bool isPasswordVisible,
    required VoidCallback onVisibilityToggle,
    required String label,
    required String hint,
    required String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: !isPasswordVisible,
      style: const TextStyle(
          color: colorHome, fontSize: 18), // Increased font size
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
            color: colorHome, fontSize: 18), // Increased font size
        hintText: hint,
        hintStyle: const TextStyle(
            color: colorHome, fontSize: 18), // Increased font size
        prefixIcon: const Icon(
          Icons.lock_outline_rounded,
          color: colorHome,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: colorHome),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: colorHome), // Border color when not focused
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: colorHome), // Border color when focused
        ),
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible ? Icons.visibility_off : Icons.visibility,
            color: colorHome,
          ),
          onPressed: onVisibilityToggle,
        ),
      ),
      validator: validator,
    );
  }
}
