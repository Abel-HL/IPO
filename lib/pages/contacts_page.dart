import 'package:flutter/material.dart';
import 'dart:math';


import 'package:trabajo_final/globals/battery_global.dart';
import '../globals/contacts_global.dart';
import 'send_battery_page.dart';
import 'receive_battery_page.dart';
import 'home_page.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class ContactPage extends StatefulWidget {
  final String? initialValue;
  final void Function(String)? onContactSelected;

  ContactPage({
    Key? key,
    required this.initialValue,
    this.onContactSelected
  }) : super(key: key);

  @override
  ContactPageState createState() => ContactPageState();
}

class ContactPageState extends State<ContactPage> {
  List<String> randomNames = ContactsInfo().randomNames;
  List<String> randomPhoneNumbers = ContactsInfo().randomPhoneNumbers;
  late String _contactSelected;

  @override
  void initState() {
    super.initState();
    _contactSelected = widget.initialValue ?? '';
  }

  @override
  Widget build(BuildContext context) {

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
            // Navegar a Receive_Battery
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
            // Navegar a Receive_Battery
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
        ],
      ),
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
          top: 90,
          left: 0,
          right: 0,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16.0),
            color: Colors.white,
            child: const Text(
              'Contacts',
              style: TextStyle(
                fontSize: 28,
                color: Color(0xFF075E95),
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),



          Positioned(
            top: 160,
            left: 0,
            right: 0,
            bottom: 60, // Ajusta el valor según el tamaño de tu barra de navegación inferior
            child: ListView.separated(
              padding: const EdgeInsets.only(bottom: 16), // Agrega un padding inferior
              itemCount: randomNames.length > 8 ? 8 : randomNames.length,
              separatorBuilder: (BuildContext context, int index) => const Divider(color: Colors.white, height: 1), // Agrega un separador entre los contactos
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                    onTap: () {
                      widget.onContactSelected!("Villa");
                      Navigator.of(context).pop(); // Llamamos a la función para seleccionar el contacto
                    },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 120,
                  color: const Color(0xFF075E95),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Icon(
                          Icons.contact_phone,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              randomNames[index],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              randomPhoneNumbers[index],
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Nunito',
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


