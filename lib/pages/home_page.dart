import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'receive_battery_page.dart';
import 'send_battery_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        index: 1,
        backgroundColor: Colors.white,
        color: const Color(0xFF075E95),
        animationDuration: const Duration(milliseconds: 400),
        onTap: (index) {
          switch (index) {
            case 0:
              // Navegar a Receive_Battery
              Future.delayed(const Duration(milliseconds: 400), ()
              {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration.zero, // Establece la duración de la transición en cero
                    pageBuilder: (context, animation, secondaryAnimation) => const ReceiveBatteryPage(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return child; // Retorna directamente el child sin aplicar ninguna animación
                    },
                  ),
                );
              });
              break;
            case 1:
              // Navegar a HomePage
              break;
            case 2:
              // Navegar a Send_Battery
              Future.delayed(const Duration(milliseconds: 400), ()
              {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration.zero, // Establece la duración de la transición en cero
                    pageBuilder: (context, animation, secondaryAnimation) => const SendBatteryPage(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return child; // Retorna directamente el child sin aplicar ninguna animación
                    },
                  ),
                );
              });
              break;
          }
        },
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
      ],),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 80,
              decoration: const BoxDecoration(
                color: Color(0xFF075E95),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25.0, 15.0, 0.0, 15.0),
                child: Row(
                  children: [
                    Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 22),
                    const Text(
                      'Name',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Center(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(28.0),
                topRight: Radius.circular(28.0),
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
              child: Image.asset(
                'lib/images/percentages/50_giphy.png',
                width: 250.0,
                height: 250.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
