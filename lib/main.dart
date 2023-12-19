import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wisata_app/halaman/dashboard_screen.dart';
import 'package:wisata_app/halaman/home_screen.dart';
import 'package:wisata_app/splash_screen.dart';

import 'services/calender_state.dart';
// import 'package:wisata_app/widgets/home_bottom_bar.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EventProvider(),
      child: MaterialApp(
        title: 'Big Holiday',
        home: DashboardPage(),
      ),
    );
  }
}
