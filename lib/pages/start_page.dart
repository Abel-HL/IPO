import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:async';
import 'login_page.dart';




class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  StartPageState createState() => StartPageState();
}

class StartPageState extends State<StartPage> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => LoginPage(),
        ),
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(28.0),
                topRight: Radius.circular(28.0),
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
              child: Image.asset(
                'lib/images/giphy.gif',
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