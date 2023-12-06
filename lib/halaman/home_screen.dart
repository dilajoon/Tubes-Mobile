import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wisata_app/halaman/dashboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wisata_app/Register/login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  late Timer _timer;

  final List<String> images = [
    'images/tiket.png',
    'images/koper.png',
    'images/maps.png',
  ];
  //   final List<String> nms = [
  //   'Pesan Tiket bisa lebih Mudah',
  //   'Cari Tempat Wisata Favorit',
  //   'Liburan Bersama',
  // ];

  @override
  void initState() {
    super.initState();
    _startPageViewAutoScroll();
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startPageViewAutoScroll() {
    Future.delayed(const Duration(seconds: 3), () {
      if (_currentPage < 3) {
        _pageController.animateToPage(
          _currentPage + 1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDEDED),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 500,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Image.asset(
                        images[index],
                        width: 550,
                        height: 440,
                      ),
                      // SizedBox(height: 3),
                      // Text(
                      //   nms[index].replaceAll('images/', '').replaceAll('.png', ''),
                      //   style: TextStyle(
                      //     fontSize: 25,
                      //     fontWeight: FontWeight.w300,
                      //   ),
                      // ),
                    ],
                  );
                },
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 ElevatedButton(
              onPressed: () async {
                bool isLoggedIn = await checkIsLoggedIn();
                if (isLoggedIn) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardPage()),
                  );
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              child: Text(
                'Next',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Future<bool> checkIsLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    return isLoggedIn;
  }
}
