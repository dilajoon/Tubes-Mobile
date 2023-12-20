
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
    'Sukadana, Kec. Campaka, Kabupaten Cianjur, Jawa Barat',
    'Desa Karangjaya, Kecamatan Pasirkuda, Kabupaten Cianjur, Provinsi Jawa Barat, Indonesia',
    'Jl. Pantai Jayanti, Cidamar, Kec. Cidaun, Kabupaten Cianjur, Jawa Barat 43275',
    'G5J9+26J, Saganten, Kec. Sindangbarang, Kabupaten Cianjur, Jawa Barat 43272',
    'Jl. Mariwati No.KM. 7, Kawungluwuk, Kec. Sukaresmi, Kabupaten Cianjur, Jawa Barat 43254',
    'Jl. Kebun Raya Cibodas, Sindangjaya, Kec. Cipanas, Kabupaten Cianjur, Jawa Barat 43253',
  ];

  List descriptions = [
    'Curug Cikondang adalah salah satu air terjun yang terletak di kawasan Cianjur, Jawa Barat, Indonesia. "Curug" adalah istilah dalam bahasa Sunda yang artinya air terjun. Curug Cikondang menawarkan pemandangan alam yang memukau dengan keindahan air terjunnya dan suasana sekitar yang alami.',
    'Curug Citambur adalah sebuah curug atau air terjun yang ketinggiannya kira-kira 130 meter di Kabupaten Cianjur bagian Selatan, Provinsi Jawa Barat,',
    'Pantai Jayanti adalah sebuah pantai yang terletak di Desa Cidamar, Kecamatan Cidaun, Kabupaten Cianjur, Jawa Barat. Pantai ini berdampingan dengan Cagar Alam Bojonglarang dan pelabuhan nelayan.',
    'Pantai Karangpotong adalah sebuah pantai yang terletak di daerah Karangpapak, Cianjur, Jawa Barat, Indonesia. Pantai ini terkenal karena keindahan pemandangannya yang menakjubkan dengan garis pantai yang panjang, pasir putihnya yang halus, serta air laut yang jernih.',
    'Taman Bunga Nusantara adalah sebuah taman bunga seluas 35 hektare yang terletak dekat Gunung Gede Pangrango dan Kebun Teh Bogor dengan jarak tempuh sekitar 2,5 - 3 jam perjalanan dari Jakarta, tepatnya berada di antara dua desa yaitu, Kawungluwuk, Sukaresmi, Cianjur dengan Sukawangi, Sukamakmur, Jonggol.',
    'Gunung Gede merupakan sebuah gunung berapi kerucut yang berada di bagian barat Pulau Jawa, Indonesia. Gunung Gede berada dalam ruang lingkup Taman Nasional Gede Pangrango, yang merupakan salah satu dari lima taman nasional yang pertama kali diumumkan di Indonesia pada tahun 1980.',
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
      childAspectRatio: (257 / 450),
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
                              builder: (context) => SingleItemScreen(
                                imgs[i],
                                names[i],
                                locations[i],
                                descriptions[i],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 1, horizontal: 1),
                          child: Image.asset(
                            "assets/images/${imgs[i]}.jpg",
                            width: 240,
                            height: 240,
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
                                'Cianjur',
                                maxLines:3,
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
