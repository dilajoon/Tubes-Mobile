import 'package:flutter/material.dart';
import 'package:wisata_app/Register/login.dart';
import 'package:wisata_app/halaman/dashboard_screen.dart';
import 'package:wisata_app/halaman/wisata_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _startPageViewAutoScroll();
  }

  void _startPageViewAutoScroll() {
    Future.delayed(const Duration(seconds: 3), () {
      if (_currentPage < 3) { // Check to prevent exceeding the page count
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 400,
              child: PageView(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: [
                  Image.asset(
                    'images/homeTiket.jpg',
                    width: 300,
                    height: 230,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'images/homeKoper.jpg',
                    width: 300,
                    height: 230,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'images/homeWisata.jpg',
                    width: 300,
                    height: 230,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigasi ke halaman DashboardPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF4C4DDC),
                    fixedSize: Size(100, 24),
                  ),
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
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
}
