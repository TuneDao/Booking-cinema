import 'package:flutter/material.dart';
import 'package:project_android/Data/API/sharedpre.dart';
import 'package:project_android/Data/model/user.dart';
import 'package:project_android/Screen/User/Payment/history_payment.dart';
import 'package:project_android/Screen/User/Profile/editprofile.dart';
import 'package:project_android/Screen/User/SignIn/changepassword.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String email = '';
  String userName = '';
  String avatar = '';
  String maKH = '';
  String matkhau = '';
  String sdt = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  _loadUserData() async {
    final userDetails = await SharedPreferencesUtil.getUserDetails();
    setState(() {
      email = userDetails['Email']!;
      userName = userDetails['HoTen']!;
      avatar = userDetails['AnhDaiDien']!;
      maKH = userDetails['MaKH']!;
      matkhau = userDetails['MatKhau']!;
      sdt = userDetails['SDT']!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[300],
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        avatar,
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return Image.network(avatar.toString(),
                              width: 100, height: 100, fit: BoxFit.cover);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    userName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // Menu Items
            _buildMenuItem(
              icon: Icons.account_circle,
              title: 'Thông tin tài khoản',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfile(
                      maKH: maKH,
                      matkhau: matkhau,
                      userName: userName,
                      email: email,
                      avatar: avatar,
                      sdt: sdt,
                    ),
                  ),
                );
              },
            ),

            const Divider(),
            _buildMenuItem(
              icon: Icons.card_membership,
              title: 'Thẻ thành viên',
              onTap: () {
                // Handle tap
              },
            ),
            const Divider(),
            _buildMenuItem(
              icon: Icons.history,
              title: 'Lịch sử giao dịch',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HistoryPayment()));
              },
            ),
            const Divider(),
            _buildMenuItem(
              icon: Icons.card_giftcard,
              title: 'Voucher',
              onTap: () {
                // Handle tap
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Helper function to create a menu item
Widget _buildMenuItem(
    {required IconData icon,
    required String title,
    required VoidCallback onTap}) {
  return ListTile(
    leading: Icon(icon, color: Colors.black),
    title: Text(title),
    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    onTap: onTap,
  );
}
