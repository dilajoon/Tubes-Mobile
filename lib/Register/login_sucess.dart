import 'package:flutter/material.dart';
import 'package:wisata_app/halaman/dashboard_screen.dart';
import 'package:wisata_app/halaman/home_screen.dart';
import 'package:wisata_app/size_config.dart';

class LoginSuccessScreen extends StatelessWidget {
  const LoginSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Text("Login Success"),
      ),
      body: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          Image.asset(
            "assets/images/success.png",
            height: SizeConfig.screenHeight * 0.4,
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.08),
          Text(
            "Login Success",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(30),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          SizedBox(
            width: SizeConfig.screenWidth * 0.6,
            child: ElevatedButton(
              onPressed: () {
                // Tambahkan navigasi untuk ke halaman selanjutnya
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardPage()),
                  (Route<dynamic> route) => false, // Bersihkan stack sehingga tidak ada rute sebelumnya
                );
              },
              child: Text("Back to home"),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
