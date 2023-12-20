import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wisata_app/helper/session_manager.dart';
import 'package:wisata_app/main.dart';
import 'package:wisata_app/halaman/profil_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: '',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home : const AccountScreen(),
    );
  }
}

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCCC2C2),
      appBar: AppBar(
        title: const Text('ACCOUNT'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilScreen()),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilScreen()),
                );
              },
              icon: Icon(Icons.person), // Ikon Profil
              label: const Text('Profil'),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Handle tombol Password
              },
              icon: Icon(Icons.lock), // Ikon Password
              label: const Text('Change Password'),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Handle tombol No Telp
              },
              icon: Icon(Icons.phone), // Ikon No Telp
              label: const Text('Telephone Number'),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Handle tombol Hapus Akun
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // Menggunakan warna merah untuk tombol hapus
              ),
              icon: Icon(Icons.delete), // Ikon Hapus Akun
              label: const Text('Delete Account'),
            ),
          ],
        ),
      ),
    );
  }
}
