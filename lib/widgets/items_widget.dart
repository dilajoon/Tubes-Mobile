import 'package:flutter/material.dart';
import 'package:wisata_app/halaman/item_wisata_screen.dart';

class ItemsWidget extends StatelessWidget {
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

  List lokasi = [
    'Campaka',
    'Pasir Kuda',
    'Cidaun',
    'Sidang Barang',
    'Cipanas',
    'Cibodas',
  ];

  List deskripsion = [
    'Curug Cikondang adalah air terjun yang berada di Desa Sukadana, Kabupaten Cianjur. Namanya bukan berasal dari bahasa Sunda yang berarti “terkenal”, melainkan nama tanaman. Kondang adalah nama lain dari pohon loa, tanaman dengan ciri khas buahnya tumbuh di dahan. Namun, tampaknya istilah “kondang” memang sepantasnya disandang oleh air terjun ini. Bentuknya yang masif mengingatkan orang pada Niagara, air terjun di Amerika. Curug Cikondang memang salah satu air terjun eksotis yang pantas untuk dikunjungi.',
    'Curug Citambur adalah sebuah curug atau air terjun yang ketinggiannya kira-kira 130 meter di Kabupaten Cianjur bagian Selatan, Provinsi Jawa Barat, Indonesia. Curug Citambur memiliki tiga tingkatan air terjun dimana tingkat pertama berketinggian 12 meter sedangkan tingkat kedua berketinggian 116 meter dan yang paling tas adalah 2 meter.[1] Air curug yang berada di ketinggian kurang lebih 1.400 Mdpl[2] ini terkenal sangat dingin dan memiliki debit air yang besar terlebih saat musim penghujan. Kondisi tersebut membuat Curug Citambur selalu diliputi kabut tipis dan suara air jatuhannya yang begitu keras bergemuruh. Curug Citambur yang dibatasai tebing curam dan debit air yang besar akan sangat berbahaya jika berada dibawah guyuran airnya.',
    'Pantai Jayanti merupakan objek wisata yang dapat menikmati keindahan pantai dengan ciri khas Pantai selatan dengan ombak dan batu karang yang besar serta panorama sunset yang indah. Kemudian ditambah lagi disana anda dapat menginap di penginapan dengan harga yang cukup terjangkau dan sangat cocok untuk dijadikan liburan bersama keluarga. Selain itu di pantai ini pengunjung bisa melakukan berbagai kegiatan termasuk memancing, berenang serta melakukan kegiatan lainnya.',
    'KARANG Potong Ocean View menyuguhkan pemandangan menakjubkan dengan pantai menawan dan bangunan unik di pinggirnya. Destinasi wisata terletak di Desa Saganten, Kecamatan Sindangbarang, Kabupaten Cianjur, Jawa Barat ini jadi primadona wisatawan.',
    'Taman Bunga Nusantara merupakan taman display bunga pertama di Indonesia. Taman ini dilengkapi dengan berbagai koleksi tanaman berbunga yang terkenal dan unik dari seluruh dunia. Dengan ratusan varietas tanaman berbunga di taman, Taman Bunga Nusantara benar-benar menjadi tempat dimana bunga-bunga dari seluruh dunia tumbuh.',
    'Gunung Gede merupakan sebuah gunung berapi kerucut yang berada di bagian barat Pulau Jawa, Indonesia. Gunung Gede berada dalam ruang lingkup Taman Nasional Gede Pangrango, yang merupakan salah satu dari lima taman nasional yang pertama kali diumumkan di Indonesia pada tahun 1980'
  ];

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
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SingleItemScreen(
                                img[i], Names[i], lokasi[i], deskripsion[i])));
                  },
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
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          Names[i],
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Cianjur",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                      SizedBox(width: 40),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          Icons.favorite,
                          size: 20,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
      ],
    );
  }
}
