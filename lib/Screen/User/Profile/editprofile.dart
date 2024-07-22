// import 'package:flutter/material.dart';
// import 'package:project_android/config/const.dart';

// class EditProfile extends StatefulWidget {
//   const EditProfile({super.key});

//   @override
//   State<EditProfile> createState() => _EditProfileState();
// }

// class _EditProfileState extends State<EditProfile> {
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [_AppBar(), _FormContent()],
//         ),
//       ),
//     );
//   }
// }

// class _AppBar extends StatelessWidget {
//   const _AppBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//         iconTheme: const IconThemeData(color: Colors.white),
//         title: const Text("CẬP NHẬT THÔNG TIN", style: titleStyle),
//         backgroundColor: colorTheme);
//   }
// }

// class _FormContent extends StatefulWidget {
//   const _FormContent({super.key});

//   @override
//   State<_FormContent> createState() => __FormContentState();
// }

// class __FormContentState extends State<_FormContent> {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController idController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   bool isMale = true;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(30),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const Text(
//             'Cập nhật thông tin thành viên',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 20),
//           TextField(
//             controller: nameController,
//             decoration: const InputDecoration(
//               labelText: 'Họ tên',
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 20),
//           TextField(
//             controller: idController,
//             decoration: const InputDecoration(
//               labelText: 'CMND/CCCD',
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 20),
//           TextField(
//             controller: phoneController,
//             decoration: const InputDecoration(
//               labelText: 'SĐT',
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 20),
//           TextField(
//             controller: emailController,
//             decoration: const InputDecoration(
//               labelText: 'Địa chỉ email',
//               border: OutlineInputBorder(),
//             ),
//           ),
//           const SizedBox(height: 20),
//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10)),
//                   backgroundColor: colorTheme),
//               child: const Padding(
//                 padding: EdgeInsets.all(10.0),
//                 child: Text(
//                   'CẬP NHẬT',
//                   style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white),
//                 ),
//               ),
//               onPressed: () {},
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:project_android/Data/API/api.dart';
import 'package:project_android/config/const.dart';

class EditProfile extends StatefulWidget {
  final String maKH;
  final String userName;
  final String email;
  final String avatar;
  final String matkhau;
  final String sdt;

  const EditProfile({
    required this.maKH,
    required this.userName,
    required this.email,
    required this.avatar,
    required this.matkhau,
    required this.sdt,
    super.key,
  });

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController avatarController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.userName);
    emailController = TextEditingController(text: widget.email);
    // Assuming phone and id are also part of the user data
    phoneController = TextEditingController(text: widget.sdt);
    avatarController = TextEditingController(text: widget.avatar);
    passwordController = TextEditingController(text: widget.matkhau);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("CẬP NHẬT THÔNG TIN", style: titleStyle),
        backgroundColor: colorTheme,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Cập nhật thông tin thành viên',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Họ tên',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: avatarController,
                decoration: const InputDecoration(
                  labelText: 'Ảnh đại diện',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: 'SĐT',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Địa chỉ email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Mật khẩu',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: colorTheme),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'CẬP NHẬT',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  onPressed: () async {
                    bool success = await updateUser(
                      widget.maKH,
                      nameController.text,
                      emailController.text,
                      passwordController.text,
                      phoneController.text,
                      avatarController.text,
                    );

                    if (success) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Cập nhật thành công')),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Cập nhật bị lỗi')),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
