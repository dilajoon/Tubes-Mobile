import 'package:flutter/material.dart';

class RestoDestinationWidget extends StatefulWidget {
  @override
  _RestoDestinationWidget createState() => _RestoDestinationWidget();
}

class _RestoDestinationWidget extends State<RestoDestinationWidget> {
  List img = [
    'satemaranggi',
    'sabore',
    'ikanbakar',
    'alamsunda',
  ];

  List names = [
    'Sate Maranggi',
    'Sabore Kitchen',
    'Ikan Bakar Cianjur',
    'Alam Sunda',
  ];

  List lokasi = [
    'Jl. Moch. Ali No.66, Solokpandan, Kec. Cianjur, Kabupaten Cianjur, Jawa Barat 43214',
    'Jl. K. H. Hasyim Ashari No.44 46, RW.Warujajar, Solokpandan, Kec. Cianjur, Kabupaten Cianjur, Jawa Barat 43214',
    'Jl. Dr. Muwardi No.141, Bojongherang, Kec. Cianjur, Kabupaten Cianjur, Jawa Barat 43216',
    'Solokpandan, Jl. HOS Cokro Aminoto No.11, Muka, Kec. Cianjur, Kabupaten Cianjur, Jawa Barat 43215',
  ];

  List deskripsi = [
    'Sate Maranggi Sate Maranggi adalah salah satu jenis kuliner khas Kabupaten Purwakarta yang biasanya terdiri dari potongan daging berbentuk dadu berukuran sekitar 1 cm.',
    'Sabore Kitchen menyajikan berbagai menu dengan rasa yang bikin meleleh di lidah dan harga yang cukup terjangkau. Cafe Sabore Kitchen selain mempunyai rasa masakan yang khas, juga menyediakan tempat yang tentunya sangat cocok untuk nongkrong bersama pasangan dan keluarga.',
    'Ikan bakar adalah hidangan khas Indonesia yang terkenal karena cita rasanya yang lezat dan unik. Proses memasaknya melibatkan memanggang ikan dengan bumbu-bumbu khas Indonesia di atas panggangan atau arang, memberikan rasa yang khas dan aroma yang menggugah selera.',
    'Alam Sunda merupakan hidangan-hidangan khas Sunda yang lezat dan kaya akan cita rasa tradisional.'
  ];

  List<bool> isFavoriteList = List.generate(6, (index) => false);

  void _toggleFavorite(int index) {
    setState(() {
      isFavoriteList[index] = !isFavoriteList[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 200,
        child: PageView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: img.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 5,
                color: Colors.white,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SingleItemScreen(
                          img[index],
                          names[index],
                          lokasi[index],
                          deskripsi[index],
                        ),
                      ),
                    );
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        width: 140,
                        height: 140,
                        child: Image.asset(
                          "assets/images/${img[index]}.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                names[index],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                lokasi[index],
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SingleItemScreen extends StatelessWidget {
  final String img;
  final String name;
  final String location;
  final String description;

  const SingleItemScreen(this.img, this.name, this.location, this.description);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/$img.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    location,
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  SizedBox(height: 16),
                  Text(
                    description,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
