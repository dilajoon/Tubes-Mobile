import 'package:wisata_app/Register/login.dart';
import 'package:wisata_app/constans.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:wisata_app/halaman/home_screen.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/logoawal.png',
            width: 470,
            height: 300,
          ),
          const Text(
            'Rencanakan Liburan Terbesar Anda',
            style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w100,
              fontFamily: 'Roboto',
              color: Colors.black,
            ),
          ),
        ],
      ),
      splashIconSize: 400,
      splashTransition: SplashTransition.fadeTransition,
      duration: 5000,
      backgroundColor: Color(0xFFEDEDED),
      nextScreen: const HomeScreen(), //Next to homescreen
    );
  }
}