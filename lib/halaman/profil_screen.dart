import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wisata_app/halaman/account_screen.dart';
import 'package:wisata_app/halaman/dashboard_screen.dart';
import 'package:wisata_app/helper/session_manager.dart';
import 'package:wisata_app/main.dart';
import 'package:wisata_app/widgets/home_bottom_bar.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home : const ProfilScreen(),
    );
  }
}

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCCC2C2),
      appBar: AppBar(
        title: const Text('PROFIL'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DashboardPage()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('/assets/images/users.jpg'),
            ),
            const SizedBox(height: 15,),

            buildAccountItem(context, 'Account'),
            buildAccountItem(context, 'Location'),
            buildAccountItem(context, 'About'),
            buildAccountItem(context, 'Help Center'),

            SizedBox(height: 30,),

            ElevatedButton(
              onPressed: () async {
                SessionManager sessionManager = await SessionManager.getInstance();
                await sessionManager.clearUserData(context);
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(15),
              ),
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: HomeBottomBar(),
    );
  }

  Widget buildAccountItem(BuildContext context, String title) {
    return ListTile(
      title: Text(title),
      onTap: () {
        if (title == 'Account') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AccountScreen()),
          );
        } else if (title == 'Location') {
          // Handle Location item, navigate or perform action accordingly
        } else if (title == 'About') {
          // Handle About item, navigate or perform action accordingly
        } else if (title == 'Help Center') {
          // Handle Help Center item, navigate or perform action accordingly
        }
        // Add more conditions for other items if needed
      },
    );
  }
}

