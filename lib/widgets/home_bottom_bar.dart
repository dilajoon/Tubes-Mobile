import 'package:flutter/material.dart';
import 'package:wisata_app/halaman/Favourits_screen.dart';
import 'package:wisata_app/halaman/calender_screen.dart';

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
              onPressed: () {},
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
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => Favourites()),
                // );
              },
              icon: Icon(
                Icons.favorite,
                color: Color(0xFF4C4DDC),
                size: 30,
              ),
            ),
          ),
          _buildIconContainer(
            IconButton(
              onPressed: () {},
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
