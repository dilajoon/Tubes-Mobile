import 'package:flutter/material.dart';
import 'package:wisata_app/halaman/restoran_screen.dart';
import 'package:wisata_app/halaman/wisata_screen.dart';
import 'package:wisata_app/widgets/home_bottom_bar.dart';

class DashboardPage extends StatelessWidget {
  final List<String> catNames = [
    'Restaurant',
    'Tour',
  ];

  final List<Color> catColors = [
    Color(0xFFFFD33C),
    Color(0xFF9FBB73),
  ];

  List<IconData> catIcons = [
    Icons.restaurant,
    Icons.tour,
  ];

  List imgList = [
    'saungnikmat',
    'satemaranggi',
    'curugcikondang',
    'curugcitambur',
  ];

  List nameList = [
    'Saung Nikmat',
    'Sate Maranggi',
    'Curug Cikondang',
    'Curug Citambur',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCCC2C2),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
            decoration: BoxDecoration(
              color: Color(0xFF4C4DDC),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    Icon(
                      Icons.notifications,
                      size: 30,
                      color: Colors.white,
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Padding(
                  padding: EdgeInsets.only(left: 9, bottom: 30),
                  child: Text(
                    "Where do you have holiday plans today?",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                      wordSpacing: 2,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 304,
                  height: 45,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Search here ...",
                        hintStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40, left: 25, right: 25),
            child: Column(
              children: [
                GridView.builder(
                  itemCount: catNames.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.1,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (catNames[index] == 'Restaurant') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RestoranScreen()),
                          );
                        } else if (catNames[index] == 'Tour') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WisataScreen()),
                          );
                        }
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 60,
                            width: 80,
                            decoration: BoxDecoration(
                              color: catColors[index],
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(
                                catIcons[index],
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            catNames[index],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.7),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Rekomendasi",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WisataScreen()),
                        );
                      },
                      child: Text(
                        'See All',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF674AEF),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                GridView.builder(
                  itemCount: imgList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio:
                        (MediaQuery.of(context).size.height - 50 - 25) /
                            (4 * 140),
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFFF5F3FF),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Image.asset(
                                "assets/images/${imgList[index]}.jpg",
                                width: 100,
                                height: 100,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              nameList[index],
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Wisata Terdekat",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: HomeBottomBar(),
    );
  }
}
