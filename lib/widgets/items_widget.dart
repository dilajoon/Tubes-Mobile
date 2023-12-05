import 'package:flutter/material.dart';
import 'package:wisata_app/halaman/Favourits_screen.dart';

class ItemsWidget extends StatefulWidget {
  @override
  _ItemsWidgetState createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget> {
  List img = [
    'curugcikondang',
    'curugcitambur',
    'pantaijayanti',
    'pantaikarangpotong',
    'tamanbunga',
    'gununggede',
  ];

  List Names = [
    'Curug Cikondang',
    'Curug Citambur',
    'Patai Jayanti',
    'Pantai Karangpotong',
    'Taman Bunga Nusantara',
    'Gunung gede'
  ];

  List<bool> isFavoriteList = List.generate(6, (index) => false);

  void _toggleFavorite(int index) {
    setState(() {
      isFavoriteList[index] = !isFavoriteList[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: (150 / 195),
      children: [
        for (int i = 0; i < img.length; i++)
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 13),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 8,
                ),
              ],
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Image.asset(
                      "assets/images/${img[i]}.jpg",
                      width: 140,
                      height: 140,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Names[i],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Cianjur",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20,
                          ),
                          SizedBox(width: 4),
                          Text(
                            "5.0",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 120),
                      InkWell(
                        onTap: () {
                          _toggleFavorite(i);
                        },
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(
                            Icons.favorite,
                            size: 20,
                            color: isFavoriteList[i] ? Colors.red : Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
      ],
    );
  }
}
