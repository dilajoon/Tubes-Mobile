import 'package:flutter/material.dart';
import 'package:wisata_app/halaman/calender_screen.dart';
import 'package:wisata_app/halaman/dashboard_screen.dart';
import 'package:wisata_app/halaman/profil_screen.dart';

class HomeBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 65,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xFF878787),
            spreadRadius: 1,
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildIconContainer(
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardPage()),
                );
              },
              icon: Icon(
                Icons.home,
                color: Color(0xFF4C4DDC),
                size: 30,
              ),
            ),
          ),
          _buildIconContainer(
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalenderBottom()),
                );
              },
              icon: Icon(
                Icons.calendar_month,
                color: Color(0xFF4C4DDC),
                size: 30,
              ),
            ),
          ),
          _buildIconContainer(
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite,
                color: Color(0xFF4C4DDC),
                size: 30,
              ),
            ),
          ),
          _buildIconContainer(
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              },
              icon: Icon(
                Icons.person,
                color: Color(0xFF4C4DDC),
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconContainer(Widget icon) {
    return Container(
      padding: EdgeInsets.all(8),
      child: icon,
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:wisata_app/halaman/calender_screen.dart';
// import 'package:wisata_app/halaman/dashboard_screen.dart';
// import 'package:wisata_app/halaman/profil_screen.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

// class HomeBottomBar extends StatefulWidget {
//   @override
//   _HomeBottomBarState createState() => _HomeBottomBarState();
// }

// class _HomeBottomBarState extends State<HomeBottomBar> {
//   int _selectedIndex = 0;

//   final List<Widget> _screens = [
//     DashboardPage(),
//     ProfilScreen(),
//     CalenderBottom(),
//     // DashboardScreen(),
//     // CalenderScreen(),
//     // Tambahkan widget layar lain di sini jika diperlukan:
//     // FavoriteScreen(),
//     // UserScreen(),
//     // ProfileScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _screens[_selectedIndex],
//       bottomNavigationBar: GNav(
//         backgroundColor: Color(0xFF878787),
//         color: Color(0xFF4C4DDC),
//         activeColor: Color(0xFF4C4DDC),
//         tabBackgroundColor: Colors.white,
//         gap: 8,
//         selectedIndex: _selectedIndex,
//         onTabChange: (index) {
//           setState(() {
//             _selectedIndex = index;
//           });
//         },
//         tabs: [
//           GButton(
//             icon: Icons.home,
//             text: 'Home',
//             onPressed: () {
//               _onItemTapped(0, context);
//             },
//           ),
//           GButton(
//             icon: Icons.calendar_today,
//             text: 'Calendar',
//             onPressed: () {
//               _onItemTapped(1, context);
//             },
//           ),
//           GButton(
//             icon: Icons.favorite, 
//             text: 'Favorite', 
//             onPressed: () { _onItemTapped(2, context); }),
//           GButton(
//             icon: Icons.verified_user, 
//             text: 'User', 
//             onPressed: () { _onItemTapped(3, context); }),
//           GButton(
//             icon: Icons.person,
//             text: 'Profile',
//             onPressed: () {
//               _onItemTapped(2, context);
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   void _onItemTapped(int index, BuildContext context) {
//     setState(() {
//       _selectedIndex = index;
//     });

//     switch (index) {
//       case 0:
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => DashboardPage()),
//         );
//         break;
//       case 1:
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => CalenderBottom()),
//         );
//         break;
//       case 2:
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => ProfilScreen()),
//         );
//         break;
//     }
//   }
// }
