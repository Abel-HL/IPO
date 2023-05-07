import 'package:flutter/material.dart';

class MyButton extends StatelessWidget{

  final Function()? onTap;
  final String text;



  const MyButton({Key? key, required this.onTap, required this.text})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
        child: Center(
          child: Text(
              text,
            style: const TextStyle(
              color: Color(0xFF075E95),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}