import 'package:flutter/material.dart';
import 'package:wisata_app/halaman/dashboard_screen.dart';
import 'package:wisata_app/widgets/home_bottom_bar.dart';
import 'package:wisata_app/widgets/items_widget.dart';

class WisataScreen extends StatefulWidget {
  const WisataScreen({Key? key}) : super(key: key);

  @override
  State<WisataScreen> createState() => _WisataScreenState();
}

class _WisataScreenState extends State<WisataScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xFFEDEDED),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 15),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DashboardPage(),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.black,
                          size: 29,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){},
                      child: Icon(
                        Icons.notifications,
                        color: Colors.black,
                        size: 35,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "Where do you want to go on holiday today?",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                width: MediaQuery.of(context).size.width,
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search here ...",
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.black.withOpacity(0.5),
                    )
                  ),
                ),
              ),
              TabBar(
                controller: _tabController,
                labelColor: Color(0xFF4C4DDC),
                unselectedLabelColor: Colors.white.withOpacity(0.5),
                isScrollable: true,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 3,
                    color: Color(0xFF4C4DDC),
                  ),
                  insets: EdgeInsets.symmetric(horizontal: 16),
                ),
                labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                labelPadding: EdgeInsets.symmetric(horizontal: 20),
                tabs: [
                  Tab(text: "Nearby your location"),
                  Tab(text: "Popular Destination"),
                ],
              ),
              SizedBox(height: 10),
              Center(
                child: [
                  ItemsWidget(),
                  ItemsWidget(),
                ][_tabController.index],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: HomeBottomBar(),
    );
  }
}
