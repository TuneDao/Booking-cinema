import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:unicons/unicons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Image.asset(
            'assets/images/logo2.png',
            width: 150,
            height: 150,
          ),
        ),
        backgroundColor: const Color.fromRGBO(0, 51, 160, 1),
      ),
      body: Center(
        child: _navBarItems[_selectedIndex].title,
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
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: _navBarItems,
        ),
      ),
    );
  }
}

final _navBarItems = [
  SalomonBottomBarItem(
    icon: const Icon(Icons.home),
    title: const Text("Home"),
    selectedColor: const Color.fromRGBO(255, 189, 15, 1),
  ),
  SalomonBottomBarItem(
    icon: const FaIcon(FontAwesomeIcons.ticket),
    title: const Text("Ticket"),
    selectedColor: const Color.fromRGBO(255, 189, 15, 1),
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.newspaper_outlined),
    title: const Text("News"),
    selectedColor: const Color.fromRGBO(255, 189, 15, 1),
  ),
  SalomonBottomBarItem(
    icon: const Icon(Icons.person),
    title: const Text("Profile"),
    selectedColor: const Color.fromRGBO(255, 189, 15, 1),
  ),
];
