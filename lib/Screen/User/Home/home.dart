import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_android/Data/API/sharedpre.dart';
import 'package:project_android/Screen/User/Home/drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_android/Screen/User/Home/inf.dart';
import 'package:project_android/Screen/User/Home/navbaritems.dart';
import 'package:project_android/Screen/User/Home/welcomescreen.dart';
import 'package:project_android/Screen/User/Payment/history_payment.dart';
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
  String? savedImageUrl;
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
              const Expanded(
                child: Center(
                  child: Text(
                    'HF CINEMA',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              if (isLargeScreen)
                NavBarItems(
                  onItemTapped: _onItemTapped,
                  menuItems: _menuItems,
                  menuIcons: _menuIcons,
                ),
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
              if (isLargeScreen)
                NavBarItems(
                  onItemTapped: _onItemTapped,
                  menuItems: _menuItems,
                  menuIcons: _menuIcons,
                ),
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
              if (isLargeScreen)
                NavBarItems(
                  onItemTapped: _onItemTapped,
                  menuItems: _menuItems,
                  menuIcons: _menuIcons,
                ),
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
              if (isLargeScreen)
                NavBarItems(
                  onItemTapped: _onItemTapped,
                  menuItems: _menuItems,
                  menuIcons: _menuIcons,
                ),
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
              if (isLargeScreen)
                NavBarItems(
                  onItemTapped: _onItemTapped,
                  menuItems: _menuItems,
                  menuIcons: _menuIcons,
                ),
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
              if (isLargeScreen)
                NavBarItems(
                  onItemTapped: _onItemTapped,
                  menuItems: _menuItems,
                  menuIcons: _menuIcons,
                ),
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
              if (isLargeScreen)
                NavBarItems(
                  onItemTapped: _onItemTapped,
                  menuItems: _menuItems,
                  menuIcons: _menuIcons,
                ),
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
      // extendBodyBehindAppBar: true,
      appBar: _getAppBar(_selectedIndex),
      drawer: isLargeScreen
          ? null
          : DrawerMenu(
              onItemTapped: _onItemTapped,
              scaffoldKey: _scaffoldKey,
              selectedIndex: _selectedIndex,
              menuItems: _menuItems,
              menuIcons: _menuIcons,
            ),
      body: _loadWidget(_selectedIndex),
    );
  }
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
