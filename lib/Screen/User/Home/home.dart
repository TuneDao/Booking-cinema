import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_android/Screen/User/Tickets/buytickets.dart';
import 'package:project_android/Screen/User/News/newspage.dart';
import 'package:project_android/Screen/User/Profile/profile.dart';

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
        return const Center(child: Text("Trang chủ"));
      case 1:
        return TicketsScreen();
      case 2:
        return const NewsPage();
      case 3:
        return const ProfilePage1();
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
          backgroundColor: const Color.fromRGBO(0, 51, 160, 1),
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
                    'assets/images/logo2.png',
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
          backgroundColor: const Color.fromRGBO(0, 51, 160, 1),
          elevation: 0,
          title: Row(
            children: [
              if (!isLargeScreen)
                IconButton(
                  icon: const Icon(Icons.menu),
                  color: Colors.white,
                  onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                ),
              const Text(
                "Mua vé",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  wordSpacing: 5,
                ),
              ),
              if (isLargeScreen) Expanded(child: _navBarItems()),
            ],
          ),
        );
      case 2:
        return AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromRGBO(0, 51, 160, 1),
          elevation: 0,
          title: Row(
            children: [
              if (!isLargeScreen)
                IconButton(
                  icon: const Icon(Icons.menu),
                  color: Colors.white,
                  onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                ),
              const Text(
                "Tin mới & Ưu đãi",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    wordSpacing: 5),
              ),
              if (isLargeScreen) Expanded(child: _navBarItems()),
            ],
          ),
        );
      case 3:
        return AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromRGBO(0, 51, 160, 1),
          elevation: 0,
          title: Row(
            children: [
              if (!isLargeScreen)
                IconButton(
                  icon: const Icon(Icons.menu),
                  color: Colors.white,
                  onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                ),
              const Text(
                "Thành viên",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  wordSpacing: 5,
                ),
              ),
              if (isLargeScreen) Expanded(child: _navBarItems()),
            ],
          ),
        );
      default:
        return AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromRGBO(0, 51, 160, 1),
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
                'assets/images/logo2.png',
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
        backgroundColor: const Color.fromARGB(255, 46, 46, 46),
        child: Column(
          children: [
            // Avatar and User Info Section
            Container(
              padding: const EdgeInsets.all(16.0),
              child: const Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                        'assets/images/avatar.png'), // Replace with the path to your avatar image
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Đào Nguyễn Tuấn Anh',
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
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                ],
              ),
            ),

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
