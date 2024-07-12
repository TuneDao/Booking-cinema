import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_android/Screen/User/Home/inf.dart';
import 'package:project_android/Screen/User/Home/welcomescreen.dart';
import 'package:project_android/Screen/User/Payment/history_payment.dart';
import 'package:project_android/Screen/User/SignIn/login.dart';
import 'package:project_android/Screen/User/Tickets/buytickets.dart';
import 'package:project_android/Screen/User/News/newspage.dart';
import 'package:project_android/Screen/User/Profile/profile.dart';
import 'package:project_android/config/const.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _loadWidget(int index) {
    switch (index) {
      case 0:
        return WelcomeScreen();
      case 1:
        return TicketsScreen();
      case 2:
        return const NewsScreen();
      case 3:
        return ProfileScreen();
      case 4:
        return MovieTheaterPage();
      case 5:
        return HistoryPayment();
      default:
        return const Center(child: Text("Trang chủ"));
    }
  }

  AppBar _getAppBar(int index) {
    final width = MediaQuery.of(context).size.width;
    final bool isLargeScreen = width > 800;
    switch (index) {
      case 0:
        return AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: colorTheme,
          elevation: 0,
          title: Row(
            children: [
              if (!isLargeScreen)
                IconButton(
                  icon: const Icon(Icons.menu),
                  color: Colors.white,
                  onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                ),
              Expanded(
                child: Center(
                  child: Image.asset(
                    urlLogo,
                    errorBuilder: (context, error, stackTrace) =>
                        const SizedBox.shrink(),
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
              if (isLargeScreen) Expanded(child: _navBarItems()),
            ],
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16.0),
            ),
          ],
        );
      case 1:
        return AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: colorTheme,
          elevation: 0,
          title: Row(
            children: [
              if (!isLargeScreen)
                IconButton(
                  icon: const Icon(Icons.menu),
                  color: Colors.white,
                  onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                ),
              const Text("Mua vé", style: titleStyle),
              if (isLargeScreen) Expanded(child: _navBarItems()),
            ],
          ),
        );
      case 2:
        return AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: colorTheme,
          elevation: 0,
          title: Row(
            children: [
              if (!isLargeScreen)
                IconButton(
                  icon: const Icon(Icons.menu),
                  color: Colors.white,
                  onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                ),
              const Text("Tin mới & Ưu đãi", style: titleStyle),
              if (isLargeScreen) Expanded(child: _navBarItems()),
            ],
          ),
        );
      case 3:
        return AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: colorTheme,
          elevation: 0,
          title: Row(
            children: [
              if (!isLargeScreen)
                IconButton(
                  icon: const Icon(Icons.menu),
                  color: Colors.white,
                  onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                ),
              const Text("Thành viên", style: titleStyle),
              if (isLargeScreen) Expanded(child: _navBarItems()),
            ],
          ),
        );
      case 4:
        return AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: colorTheme,
          elevation: 0,
          title: Row(
            children: [
              if (!isLargeScreen)
                IconButton(
                  icon: const Icon(Icons.menu),
                  color: Colors.white,
                  onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                ),
              const Text("Thông tin rạp", style: titleStyle),
              if (isLargeScreen) Expanded(child: _navBarItems()),
            ],
          ),
        );
      case 5:
        return AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: colorTheme,
          elevation: 0,
          title: Row(
            children: [
              if (!isLargeScreen)
                IconButton(
                  icon: const Icon(Icons.menu),
                  color: Colors.white,
                  onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                ),
              const Text("Vé của tôi", style: titleStyle),
              if (isLargeScreen) Expanded(child: _navBarItems()),
            ],
          ),
        );
      default:
        return AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: colorHome,
          elevation: 0,
          title: Row(
            children: [
              if (!isLargeScreen)
                IconButton(
                  icon: const Icon(Icons.menu),
                  color: Colors.white,
                  onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                ),
              Image.asset(
                urlLogo,
                errorBuilder: (context, error, stackTrace) =>
                    const SizedBox.shrink(),
                width: 150,
                height: 150,
              ),
              if (isLargeScreen) Expanded(child: _navBarItems()),
            ],
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16.0),
            ),
          ],
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isLargeScreen = width > 800;

    return Scaffold(
      key: _scaffoldKey,
      appBar: _getAppBar(_selectedIndex),
      drawer: isLargeScreen ? null : _drawer(),
      body: _loadWidget(_selectedIndex),
    );
  }

  Widget _navBarItems() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: _menuItems
            .asMap()
            .map((index, item) => MapEntry(
                  index,
                  InkWell(
                    onTap: () => _onItemTapped(index),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 24.0, horizontal: 16),
                      child: Row(
                        children: [
                          Icon(_menuIcons[index],
                              color: Colors.white), // Add icon
                          const SizedBox(
                              width: 8), // Space between icon and text
                          Text(
                            item,
                            style: const TextStyle(
                                fontSize: 18, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
            .values
            .toList(),
      );

  Widget _drawer() => Drawer(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/rapphim.jpg', // Thay thế đường dẫn đến hình ảnh của bạn
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: 20.0,
                    sigmaY:
                        20.0), // Điều chỉnh giá trị sigma để thay đổi mức độ làm mờ
                child: Container(
                  color: Colors.black
                      .withOpacity(0), // Giữ cho container trong suốt
                ),
              ),
            ),
            Container(
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
                            child: Image.asset(
                              'assets/images/avatar.jpg',
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "TuneDao",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.card_membership,
                                    color: Colors.white, size: 16),
                                SizedBox(width: 4),
                                Text(
                                  'Member',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(), // kẻ thẳng
                  TextButton(
                    onPressed: () {
                      _loadWidget(_selectedIndex);
                    },
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.crown,
                          size: 15,
                          color: Colors.white,
                        ),
                        Text(
                          '  Đặc quyền',
                          style: TextStyle(color: Colors.white),
                        ),
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
                        Icon(
                          FontAwesomeIcons.photoFilm,
                          size: 15,
                          color: Colors.white,
                        ),
                        Text(
                          '  Danh sách phim',
                          style: TextStyle(color: Colors.white),
                        ),
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
                      children: _menuItems
                          .asMap()
                          .map((index, item) => MapEntry(
                                index,
                                GestureDetector(
                                  onTap: () {
                                    _onItemTapped(index);
                                    _scaffoldKey.currentState?.openEndDrawer();
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        _menuIcons[index],
                                        size: 25,
                                        color: Colors.white,
                                      ), // Icon size
                                      const SizedBox(
                                        height: 5,
                                      ),
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
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInPage2()));
                          },
                          child: const Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.rightFromBracket,
                                size: 15,
                                color: Colors.white,
                              ),
                              Text(
                                ' Đăng xuất',
                                style: TextStyle(color: Colors.white),
                              ),
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

final List<String> _menuItems = <String>[
  'Trang chủ',
  'Mua vé',
  'Tin tức & Ưu đãi',
  'Thành viên',
  'Rạp HF',
  'Vé của tôi'
];

final List<IconData> _menuIcons = <IconData>[
  FontAwesomeIcons.houseCircleCheck, // Trang chủ
  FontAwesomeIcons.ticketSimple, // Mua vé
  FontAwesomeIcons.gifts, // Tin Tức
  FontAwesomeIcons.userCheck, // Thành viên
  FontAwesomeIcons.circleInfo,
  FontAwesomeIcons.moneyBillWave,
];
