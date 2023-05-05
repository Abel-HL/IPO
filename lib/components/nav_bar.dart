import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class CustomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const CustomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.white,
      color: const Color(0xFF075E95),
      animationDuration: const Duration(milliseconds: 400),
      index: selectedIndex,
      onTap: onTap,
      items: [
        Image.asset(
          'lib/images/menu/Receive_Icon.png',
          width: 30.0,
          height: 30.0,
        ),
        Image.asset(
          'lib/images/menu/Home_Icon.png',
          width: 30.0,
          height: 30.0,
        ),
        Image.asset(
          'lib/images/menu/Send_Icon.png',
          width: 30.0,
          height: 30.0,
        ),
      ],
    );
  }
}
