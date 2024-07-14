// nav_bar_items.dart
import 'package:flutter/material.dart';

class NavBarItems extends StatelessWidget {
  final Function(int) onItemTapped;
  final List<String> menuItems;
  final List<IconData> menuIcons;

  const NavBarItems({
    Key? key,
    required this.onItemTapped,
    required this.menuItems,
    required this.menuIcons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: menuItems
          .asMap()
          .map((index, item) => MapEntry(
                index,
                InkWell(
                  onTap: () => onItemTapped(index),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 24.0, horizontal: 16),
                    child: Row(
                      children: [
                        Icon(menuIcons[index], color: Colors.white), // Add icon
                        const SizedBox(width: 8), // Space between icon and text
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
  }
}
