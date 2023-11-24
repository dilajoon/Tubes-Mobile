import 'package:flutter/material.dart';
import 'package:wisata_app/halaman/dashboard_screen.dart';

class Penginapan extends StatefulWidget {
  @override
  _PenginapanState createState() => _PenginapanState();
}

class _PenginapanState extends State<Penginapan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCCC2C2),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 5),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute
                        (builder: (context) => DashboardPage()));
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),

                SizedBox(height: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
