import 'package:flutter/material.dart';
import 'package:trabajo_final/components/buttons/my_button.dart';
import 'package:trabajo_final/components/buttons/change_percentage_button.dart';
import 'dart:math';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:trabajo_final/pages/contacts_page.dart';
import 'package:trabajo_final/pages/login_page.dart';


import '../globals/battery_global.dart';
import '../globals/username_global.dart';
import '../operations/battery_field.dart';
import 'home_page.dart';
import 'send_battery_page.dart';

// int _batteryPercentage = 10; // Valor inicial del porcentaje de batería
// const int _maxmAh = 5000;

class ReceiveBatteryPage extends StatefulWidget{
  const ReceiveBatteryPage({super.key});


  @override
  BatteryScreenState createState() => BatteryScreenState();
}

class BatteryScreenState extends State<ReceiveBatteryPage> {
  int _batteryPercentage = RequestPercentageInfo().requestPercentage; // Valor inicial del porcentaje de batería
  String _selectedContact = '';
  final int _maxmAh = 5000;

  void _showBatteryPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BatteryPopup(
          initialValue: _batteryPercentage,
          onChanged: (value) {
            setState(() {
              _batteryPercentage = value;

            });
          },
        );
      },
    );
  }

  void _showContactsPopup(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ContactPage(
          initialValue: _selectedContact,
          onContactSelected: (String value) {
            setState(() {
              _selectedContact = value; // Actualizar el valor del contacto seleccionado
            });
          },
        ),
      ),
    );
  }

  String getBatteryImage(int batteryPercentage) {
    if (batteryPercentage >= 0 && batteryPercentage < 15) {
      return 'lib/images/percentages/0_gif_0.png';
    } else if (batteryPercentage >= 15 && batteryPercentage < 25) {
      return 'lib/images/percentages/15_giphy.png';
    } else if (batteryPercentage >= 25 && batteryPercentage < 50) {
      return 'lib/images/percentages/25_giphy.png';
    } else if (batteryPercentage >= 50 && batteryPercentage < 75) {
      return 'lib/images/percentages/50_giphy.png';
    } else if (batteryPercentage >= 75 && batteryPercentage < 95) {
      return 'lib/images/percentages/75_giphy.png';
    } else {
      return 'lib/images/percentages/100_giphy.png';
    }
  }

  int calculatemAhFromPercentage(int percentage) {
    return (percentage / 100 * _maxmAh).floor();
  }

  @override
  Widget build(BuildContext context) {
    // final mAh = calculatemAhFromPercentage(_batteryPercentage);

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        backgroundColor: Colors.white,
        color: const Color(0xFF075E95),
        animationDuration: const Duration(milliseconds: 400),
        onTap: (index) {
          switch (index) {
            case 0:
            // Navegar a Receive_Battery
              break;
            case 1:
            // Navegar a HomePage_Battery
              RequestPercentageInfo().requestPercentage = _batteryPercentage;
              Future.delayed(const Duration(milliseconds: 400), ()
              {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration.zero, // Establece la duración de la transición en cero
                    pageBuilder: (context, animation, secondaryAnimation) => const HomePage(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return child; // Retorna directamente el child sin aplicar ninguna animación
                    },
                  ),
                );
              });
              break;
            case 2:
            // Navegar a Send_Battery
              RequestPercentageInfo().requestPercentage = _batteryPercentage;
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
                    const SizedBox(width: 20),
                    Text(
                      UserName().username,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
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
                getBatteryImage(BatteryInfo().batteryPercentage),
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
                    'Receive battery',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 59),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Available Battery  ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Icon(
                        Icons.double_arrow_rounded,
                        color: Colors.white,
                        size: 18,
                      ),
                      Text(
                        '  ${BatteryInfo().batteryPercentage}%',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),


                  const SizedBox(height: 30),
                  /*
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          _showBatteryPopup(context);
                        },
                        child: Column(
                          children: [
                            BatteryField(
                              percentage: _batteryPercentage,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  */


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BatteryField(percentage: _batteryPercentage, showPercentageLabel: false),
                      const SizedBox(width: 20), // Espacio entre el texto y el botón
                      CustomButton(
                        text: 'Change %',
                        onPressed: () {
                          _showBatteryPopup(context);
                        },
                        color: Colors.white,
                      ),
                    ],
                  ),


                  //Contact field
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Contact ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Icon(
                        Icons.double_arrow_rounded,
                        color: Colors.white,
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _selectedContact,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 40),
                      GestureDetector(
                        onTap: () async {
                          _showContactsPopup(context);
                        },
                        child: const Icon(
                          Icons.contacts,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                      const SizedBox(width: 5),
                      if (_selectedContact.isNotEmpty) // Verifica si hay un usuario seleccionado
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedContact = ''; // Elimina la selección del usuario
                            });
                          },
                          child: const Icon(
                            Icons.clear,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                    ],
                  ),

                  const SizedBox(height: 46),
                  //sign in button
                  MyButton(
                    onTap: () {
                      if (BatteryInfo().batteryPercentage + _batteryPercentage <= 100) {
                        BatteryInfo().batteryPercentage += _batteryPercentage;
                        // Acción al hacer clic en el botón "Send"
                        RequestPercentageInfo().requestPercentage = 10;
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: Duration.zero,
                            pageBuilder: (context, animation, secondaryAnimation) => const HomePage(),
                            transitionsBuilder: (context, animation, secondaryAnimation, child) {
                              return child;
                            },
                          ),
                        );
                      } else {
                        // Mostrar Popup de error
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            int result = 100 - BatteryInfo().batteryPercentage;
                            return AlertDialog(
                              content: SizedBox(
                                height: 160,
                                width: 220,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      'Error',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF075E95),
                                        fontSize: 24,
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(height: 16),

                                    Text(
                                      'Percentage should be less or equal to  $result%',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: Color(0xFF075E95),
                                        fontFamily: 'Nunito',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          style: TextButton.styleFrom(
                                            backgroundColor:const Color(0xFF075E95).withOpacity(0.3), // Color de fondo con opacidad reducida
                                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                          ),
                                          child: const Text(
                                            'OK',
                                            style: TextStyle(
                                              color: Color(0xFF075E95),
                                              fontSize: 20,
                                              fontFamily: 'Nunito',
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                    text: 'Request',
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