import 'package:flutter/material.dart';
import 'package:wisata_app/halaman/item_restoran_screen.dart';

class KulinerWidgets extends StatefulWidget {
  @override
  _KulinerWidgetsState createState() => _KulinerWidgetsState();
}

class _KulinerWidgetsState extends State<KulinerWidgets> {
  List img = [
    'saungnikmat',
    'satemaranggi',
    'sabore',
    'kapau',
    'ikanbakar',
    'alamsunda',
    'pempek',
  ];

  List names = [
    'Saung Nikmat',
    'Sate Maranggi',
    'Sabore Kitchen',
    'Kapau II',
    'Ikan Bakar Cianjur',
    'Alam Sunda',
    'Warung Pempek 168'
  ];

  List lokasi = [
    'Jl. Dr. Muwardi No.155, Bojongherang, Kec. Cianjur,',
    'Pacet, Cipendawa, Kecamatan Pacet, Kabupaten Cianjur, Jawa Barat.',
    'Jl. K.H Hasyim Ashari No. 44-46, Warujajar, Solokpandan, Kec. Cianjur,jawa barat',
    'JL.By Pass Dr Mawardi,Cianjur Bojongherang Jawa Barat',
    'Jalan Raya Cianjur-Cipanas Km 7, Puncak, Jawa Barat, Cianjur Indonesia',
    'Jalan Raya Kota Bunga No.61,Plasari,Cipanas,Jawa Barat',
    'Jl. Yulius Usman no. 30, Cianjur 43213 Indonesia',
  ];

  List deskripsi = [
    'restoran Saung nikmat ini terkenal dengan hidangan khas sunda yang menggugah selera dan suasana asri dengan konsep saung dan kolam ikan yang menambah kesan alami.',
    'Sate Maranggi Sate Maranggi adalah salah satu jenis kuliner khas Kabupaten Purwakarta yang biasanya terdiri dari potongan daging berbentuk dadu berukuran sekitar 1 cm.',
    'Sabore Kitchen menyajikan berbagai menu dengan rasa yang bikin meleleh di lidah dan harga yang cukup terjangkau. Cafe Sabore Kitchen selain mempunyai rasa masakan yang khas, juga menyediakan tempat yang tentunya sangat cocok untuk nongkrong bersama pasangan dan keluarga.',
    'Rumah makan Padang yang diberi nama KAPAU adalah usaha rumah makan keluarga yang bergerak dalam bisnis jasa, Usaha ini dinamakan KAPAU dikarenakan pemilik usaha ini berasal dari Negeri KApau yang berada di Padang.',
    'Ikan bakar adalah hidangan khas Indonesia yang terkenal karena cita rasanya yang lezat dan unik. Proses memasaknya melibatkan memanggang ikan dengan bumbu-bumbu khas Indonesia di atas panggangan atau arang, memberikan rasa yang khas dan aroma yang menggugah selera.',
    'Alam Sunda merupakan hidangan-hidangan khas Sunda yang lezat dan kaya akan cita rasa tradisional.'
  ];

  List<bool> isFavoriteList = List.generate(7, (index) => false);

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
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => restoranItemScreen(
                                img[i],
                                names[i],
                                lokasi[i],
                                deskripsi[i],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 1, horizontal: 1),
                          child: Image.asset(
                            "assets/images/${img[i]}.jpg",
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
                                  color:
                                      isFavoriteList[i] ? Colors.red : Colors.grey,
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
