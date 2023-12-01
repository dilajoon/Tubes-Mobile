import 'package:flutter/material.dart';
import 'package:wisata_app/screen/login.dart';

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
      //waktu
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 300), //waktu
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
              //bagian gambar
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
              onPressed: () {
                // navigation to LoginPage
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
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
}
