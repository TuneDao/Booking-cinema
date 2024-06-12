import 'package:flutter/material.dart';
import 'package:project_android/Screen/User/Tickets/buytickets.dart';
import 'package:project_android/Screen/User/News/newspage.dart';
import 'package:project_android/Screen/User/Profile/profile.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _loadWidget(int index) {
    var nameWidgets = "Home";
    switch (index) {
      case 0:
        nameWidgets = "Home";
        break;
      case 1:
        return TicketsScreen();
      case 2:
        {
          return const NewsPage();
        }
      case 3:
        {
          return const ProfilePage1();
        }
      default:
        nameWidgets = "None";
        break;
    }
    return null;
  }

  AppBar _getAppBar(int index) {
    switch (index) {
      case 0:
        return AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: Image.asset(
              'assets/images/logo2.png',
              width: 150,
              height: 150,
            ),
          ),
          backgroundColor: const Color.fromRGBO(0, 51, 160, 1),
        );
      case 1:
        return AppBar(
          automaticallyImplyLeading: false,
          title: const Center(
            child: Text(
              "MUA VÉ",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  wordSpacing: 5,
                  letterSpacing: 5),
            ),
          ),
          backgroundColor: const Color.fromRGBO(0, 51, 160, 1),
        );
      case 2:
        return AppBar(
          automaticallyImplyLeading: false,
          title: const Center(
            child: Text(
              "TIN TỨC & ƯU ĐÃI",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  wordSpacing: 5,
                  letterSpacing: 5),
            ),
          ),
          backgroundColor: const Color.fromRGBO(0, 51, 160, 1),
        );
      case 3:
        return AppBar(
          automaticallyImplyLeading: false,
          title: const Center(
            child: Text(
              "THÀNH VIÊN",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  wordSpacing: 5,
                  letterSpacing: 5),
            ),
          ),
          backgroundColor: const Color.fromRGBO(0, 51, 160, 1),
        );
      default:
        return AppBar(
          automaticallyImplyLeading: false,
          title: const Center(
            child: Text(
              "TIN TỨC & ƯU ĐÃI",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  wordSpacing: 5,
                  letterSpacing: 5),
            ),
          ),
          backgroundColor: const Color.fromRGBO(0, 51, 160, 1),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(_selectedIndex),
      body: Center(
        child: _loadWidget(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(0, 173, 239, 1),
              Color.fromRGBO(0, 99, 137, 1)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SalomonBottomBar(
          currentIndex: _selectedIndex,
          unselectedItemColor: const Color.fromARGB(255, 255, 255, 255),
          onTap: _onItemTapped,
          items: _navBarItems,
        ),
      ),
    );
  }
}

final _navBarItems = [
  SalomonBottomBarItem(
    icon: const Icon(Icons.home),
    title: const Text("Trang chủ"),
    selectedColor: Colors.yellow,
  ),
  SalomonBottomBarItem(
    icon: const FaIcon(FontAwesomeIcons.film),
    title: const Text("Mua vé"),
    selectedColor: Colors.yellow,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.newspaper_outlined),
    title: const Text("Tin Tức"),
    selectedColor: Colors.yellow,
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.person),
    title: const Text("Thành viên"),
    selectedColor: Colors.yellow,
  ),
];
