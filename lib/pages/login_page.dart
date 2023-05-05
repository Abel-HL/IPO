import 'package:flutter/material.dart';
import 'package:trabajo_final/components/my_button.dart';
import 'package:trabajo_final/components/my_textfield.dart';


import 'home_page.dart';

class LoginPage extends StatelessWidget{
  LoginPage({Key? key}) : super(key: key);


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
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              // Contenedor azul con texto
              Container(
                width: 320,
                height: 480,
                margin: const EdgeInsets.only(top: 226.0),
                decoration: const BoxDecoration(
                  color: Color(0xFF075E95),
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 80),
                    const Text(
                      'Welcome to BatteryLife',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 40),

                    //username text
                    MyTextField(
                      controller: usernameController,
                      hintText: 'Username',
                      obscureText: false,
                    ),

                    const SizedBox(height: 20),


                    //password text
                    MyTextField(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true,
                    ),


                    //forgot password??
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const[
                          Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Colors.white,

                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 40),
                    //sign in button
                    MyButton(
                      onTap: () => signUserIn(context),
                    ),

                    const SizedBox(height: 20),



                    //continue with

                    //google + apple sign in buttons

                    //not a member? register now


                  ],
                ),
              ),


              //logo
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Image.asset(
                  'lib/images/percentages/0_gif_0.png',
                  width: 154.0,
                  height: 298.0,
                ),
              ),






              //forgot password??

              //sign in button

              //continue with

              //google + apple sign in buttons

              //not a member? register now
            ],
          ),
        ),
      ),
    );
  }
}