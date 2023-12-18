
import 'package:flutter/material.dart';
import 'package:wisata_app/halaman/item_wisata_screen.dart';
import 'package:wisata_app/halaman/wisata_screen.dart';

class ItemsWidget extends StatefulWidget {
  @override
  _ItemsWidgetState createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget> {
  List imgs = [
    'curugcikondang',
    'curugcitambur',
    'pantaijayanti',
    'pantaikarangpotong',
    'tamanbunga',
    'gununggede',
  ];

  List names = [
    'Curug Cikondang',
    'Curug Citambur',
    'Pantai Jayanti',
    'Pantai Karangpotong',
    'Taman Bunga Nusantara',
    'Gunung Gede'
  ];

  List locations = [
    'Campaka',
    'Pasir Kuda',
    'Cidaun',
    'Sidang Barang',
    'Cipanas',
    'Cibodas',
  ];

  List descriptions = [
    'Deskripsi Curug Cikondang...',
    'Deskripsi Curug Citambur...',
    'Deskripsi Pantai Jayanti...',
    'Deskripsi Pantai Karangpotong...',
    'Deskripsi Taman Bunga Nusantara...',
    'Deskripsi Gunung Gede...',
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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (int i = 0; i < imgs.length; i++)
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
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WisataScreen(
                                // imgs[i],
                                // names[i],
                                // locations[i],
                                // descriptions[i],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Image.asset(
                            "assets/images/${imgs[i]}.jpg",
                            width: 140,
                            height: 140,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 18),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                names[i],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                locations[i],
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
                ),
            ],
          ),
        ),
      ],
    );
  }
}
