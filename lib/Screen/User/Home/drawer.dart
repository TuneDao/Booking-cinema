import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_android/Data/API/sharedpre.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project_android/Screen/User/SignIn/login.dart';
import 'package:project_android/Screen/User/Tickets/buytickets.dart';
import 'package:project_android/config/const.dart';

class DrawerMenu extends StatefulWidget {
  final Function(int) onItemTapped;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final int selectedIndex;
  final List<String> menuItems;
  final List<IconData> menuIcons;

  const DrawerMenu({
    Key? key,
    required this.onItemTapped,
    required this.scaffoldKey,
    required this.selectedIndex,
    required this.menuItems,
    required this.menuIcons,
  }) : super(key: key);

  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  String? email;
  String? name;
  String? avatar;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  _loadUserData() async {
    final userDetails = await SharedPreferencesUtil.getUserDetails();
    setState(() {
      email = userDetails['Email']!;
      name = userDetails['HoTen']!;
      avatar = userDetails['AnhDaiDien']!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  colorTheme,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            // color: colorTheme,
            child: Column(
              children: [
                // Avatar and User Info Section
                Container(
                  margin: const EdgeInsets.only(
                      left: 0, right: 0, top: 40, bottom: 0),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey[300],
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            avatar.toString(),
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset('assets/images/avatar.jpg');
                            },
                            fit: BoxFit.cover,
                            width: 100,
                            height: 100,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      if (name != null && email != null) ...[
                        Text(
                          name!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow
                              .ellipsis, // Thêm dòng này để xử lý overflow
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.email, color: Colors.white, size: 16),
                            const SizedBox(width: 4),
                            Text(
                              email!,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                const Divider(), // kẻ thẳng
                TextButton(
                  onPressed: () {
                    widget.onItemTapped(widget.selectedIndex);
                  },
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.crown,
                          size: 15, color: Colors.white),
                      Text('  Đặc quyền',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                const Divider(), // kẻ thẳng
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TicketsScreen()));
                  },
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.photoFilm,
                          size: 15, color: Colors.white),
                      Text('  Danh sách phim',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                const Divider(), // kẻ thẳng
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    padding: const EdgeInsets.all(20.0),
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    children: widget.menuItems
                        .asMap()
                        .map((index, item) => MapEntry(
                              index,
                              GestureDetector(
                                onTap: () {
                                  widget.onItemTapped(index);
                                  widget.scaffoldKey.currentState
                                      ?.openEndDrawer();
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(widget.menuIcons[index],
                                        size: 25, color: Colors.white),
                                    const SizedBox(height: 5),
                                    Text(
                                      item,
                                      style: const TextStyle(
                                          fontSize: 13, color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ))
                        .values
                        .toList(),
                  ),
                ),
                const Divider(),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () async {
                          await SharedPreferencesUtil.logout();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignInPage2()));
                        },
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.rightFromBracket,
                                size: 15, color: Colors.white),
                            Text(' Đăng xuất',
                                style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
