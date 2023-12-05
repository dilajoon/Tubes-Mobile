import 'package:flutter/material.dart';

class SingleItemScreen extends StatelessWidget{
  String img;
  SingleItemScreen(this.img);

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
  Widget build(BuildContext context){
      return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: 30, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 25, right: 40),
                    child: Align(
                      child: Column(
                        children: [
                         Text(
                           "Detail",
                           style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                             color: Colors.black,
                             letterSpacing: 2,
                            ),
                          ),
                        SizedBox(height: 1),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 50,),

                  Center(
                    child: Image.asset(
                      "images/$img.jpg",
                      width: MediaQuery.of(context).size.width / 1.2,
                    ),
                  ),
                  SizedBox(height: 50,),

                  Padding(
                    padding: EdgeInsets.only(left: 25, right: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                width: 150,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black.withOpacity(0.2),
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "\Rp.10.000/orang",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                        ),

                        Container(
                                padding: EdgeInsets.all(10),
                                width: 80,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black.withOpacity(0.2),
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 20,
                                    ),
                                    Text(
                                      "\ 5.0",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                            ],
                          ),
                        ),

                        Text(
                          img,
                          style: TextStyle(
                            fontSize: 30,
                            letterSpacing: 5,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 25),

                        Icon(
                          Icons.location_on,
                          color: Colors.blue,
                          size: 20,
                        ),

                        Text(
                          lokasi[0],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10,),

                        Text(
                          "Deskription",
                            style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 10,),
                        
                        Text(
                          deskripsion[0],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }
}