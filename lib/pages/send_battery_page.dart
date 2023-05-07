import 'package:flutter/material.dart';
import 'package:trabajo_final/components/my_button.dart';
import 'package:trabajo_final/components/my_textfield.dart';
import 'dart:math';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:trabajo_final/pages/login_page.dart';
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
          Positioned(
            top: 42,
            left: 0,
            right: 0,
            child: Transform.rotate(
              angle: 90 * pi / 180,
              child: Image.asset(
                'lib/images/percentages/0_gif_0.png',
                width: 117.75,
                height: 223.5,
                //width: MediaQuery.of(context).size.height * 1,
                //height: MediaQuery.of(context).size.width * 1,
              ),
            ),
          ),
          Positioned(
            top: 226,
            left: 40,
            right: 40,
            child: Container(
              width: 310,
              height: 460,
              margin: const EdgeInsets.only(top: 0.0),
              decoration: const BoxDecoration(
                color: Color(0xFF075E95),
                borderRadius: BorderRadius.all(Radius.circular(40.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 46),
                  const Text(
                    'Send battery',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 59),

                  const Text(
                    'Available Battery:   76%',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    'Send:  10%     500mAh',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  //forgot password??
                  const SizedBox(height: 30),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Contact',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 80),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LoginPage()),
                          );
                        },
                        child: const Icon(
                          Icons.contacts,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 68),
                  //sign in button
                  MyButton(
                    onTap: () => signUserIn(context),
                    text: 'Send',
                  ),

                  const SizedBox(height: 47),

                  //continue with

                  //google + apple sign in buttons

                  //not a member? register now
                ],
              ),
            ),
          ),


        ],
      ),
    );
  }
}