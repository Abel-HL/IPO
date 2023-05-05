import 'package:flutter/material.dart';
import 'package:trabajo_final/components/my_button.dart';
import 'package:trabajo_final/components/my_textfield.dart';


import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'home_page.dart';
import 'receive_battery_page.dart';

class SendBatteryPage extends StatelessWidget{
  SendBatteryPage({Key? key}) : super(key: key);


  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // SingIn user in method
  void signUserIn(BuildContext context) {
    // Aquí agregas la lógica para autenticar al usuario y manejar la navegación a la página de inicio ("home page")
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (BuildContext context) => const HomePage()),
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        index: 2,
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
                  MaterialPageRoute(
                    builder: (context) => ReceiveBatteryPage(),
                  ),
                );
              });
              break;
            case 1:
            // Navegar a Receive_Battery
              Future.delayed(const Duration(milliseconds: 400), ()
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              });
              break;
            case 2:
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
    );
  }
}