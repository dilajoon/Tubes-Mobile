import 'package:flutter/material.dart';
import 'package:wisata_app/screen/login.dart';
import 'package:wisata_app/halaman/dashboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      _startPageViewAutoScroll();
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
                  Image.asset(
                    'images/logoawal.jpg',
                    width: 54,
                    height: 500,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
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
      ),
    );
  }

  Future<bool> checkIsLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    return isLoggedIn;
  }
}
