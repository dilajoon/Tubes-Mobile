<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:wisata_app/halaman/dashboard_screen.dart';
// import 'package:wisata_app/halaman/home_screen.dart';
import 'package:wisata_app/splash_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  SplashScreen(),
    );
  }
}
=======
import 'package:flutter/material.dart';
import 'package:wisata_app/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}
>>>>>>> 8332ae40505e205f05b12c0ea138b291adffa3f9
