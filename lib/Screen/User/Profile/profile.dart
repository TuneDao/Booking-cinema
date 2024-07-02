import 'package:flutter/material.dart';
import 'package:project_android/Data/model/model.dart';
import 'package:project_android/Screen/User/Profile/editprofile.dart';
import 'package:project_android/Screen/User/SignIn/changepassword.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User user =
        User(email: 'tune@gmail.com', userName: 'TuneDao', phone: '0328510990');
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
                      child: Image.asset(
                        'assets/images/avatar.jpg',
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    user.userName.toString(),
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EditProfile()));
              },
            ),
            const Divider(),
            _buildMenuItem(
              icon: Icons.lock,
              title: 'Đổi mật khẩu',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChangePassword()));
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
                // Handle tap
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
