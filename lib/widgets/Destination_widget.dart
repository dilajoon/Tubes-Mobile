import 'package:flutter/material.dart';

class DestinationWidget extends StatefulWidget {
  @override
  _DestinationWidgetState createState() => _DestinationWidgetState();
}

class _DestinationWidgetState extends State<DestinationWidget> {
  List imgs = [
    'curugcikondang',
    'pantaijayanti',
    'tamanbunga',
    'gununggede',
  ];

  List Names = [
    'Curug Cikondang',
    'Patai Jayanti',
    'Taman Bunga Nusantara',
    'Gunung Gede'
  ];

  List lokasi = [
    'Sukadana, Kec. Campaka, Kabupaten Cianjur, Jawa Barat',
    'Jl. Pantai Jayanti, Cidamar, Kec. Cidaun, Kabupaten Cianjur, Jawa Barat 43275',
    'Jl. Mariwati No.KM. 7, Kawungluwuk, Kec. Sukaresmi, Kabupaten Cianjur, Jawa Barat 43254',
    'Cibodas',
  ];

  List deskripsi = [
    'Curug Cikondang adalah air terjun yang berada di Desa Sukadana, Kabupaten Cianjur. Namanya bukan berasal dari bahasa Sunda yang berarti “terkenal”, melainkan nama tanaman. Kondang adalah nama lain dari pohon loa, tanaman dengan ciri khas buahnya tumbuh di dahan. Namun, tampaknya istilah “kondang” memang sepantasnya disandang oleh air terjun ini. Bentuknya yang masif mengingatkan orang pada Niagara, air terjun di Amerika. Curug Cikondang memang salah satu air terjun eksotis yang pantas untuk dikunjungi.',
    'Pantai Jayanti merupakan objek wisata yang dapat menikmati keindahan pantai dengan ciri khas Pantai selatan dengan ombak dan batu karang yang besar serta panorama sunset yang indah. Kemudian ditambah lagi disana anda dapat menginap di penginapan dengan harga yang cukup terjangkau dan sangat cocok untuk dijadikan liburan bersama keluarga. Selain itu di pantai ini pengunjung bisa melakukan berbagai kegiatan termasuk memancing, berenang serta melakukan kegiatan lainnya.',
    'Taman Bunga Nusantara merupakan taman display bunga pertama di Indonesia. Taman ini dilengkapi dengan berbagai koleksi tanaman berbunga yang terkenal dan unik dari seluruh dunia. Dengan ratusan varietas tanaman berbunga di taman, Taman Bunga Nusantara benar-benar menjadi tempat dimana bunga-bunga dari seluruh dunia tumbuh.',
    'Gunung Gede merupakan sebuah gunung berapi kerucut yang berada di bagian barat Pulau Jawa, Indonesia. Gunung Gede berada dalam ruang lingkup Taman Nasional Gede Pangrango, yang merupakan salah satu dari lima taman nasional yang pertama kali diumumkan di Indonesia pada tahun 1980'
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
          itemCount: imgs.length,
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
                          imgs[index],
                          Names[index],
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
                          "assets/images/${imgs[index]}.jpg",
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
                                Names[index],
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
