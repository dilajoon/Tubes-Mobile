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
            'images/logoawal.jpg',
            width: 470,
            height: 300,
          ),
          const Text(
            'BIG HOLIDAY',
            style: TextStyle(
              fontSize: 30,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w100,
              fontFamily: 'Roboto',
              color: Color.fromARGB(255, 28, 31, 37),
            ),
          ),
        ],
      ),
      splashIconSize: 400,
      splashTransition: SplashTransition.fadeTransition,
      duration: 5000,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      nextScreen: const HomeScreen(), //Next to homescreen
    );
  }
}