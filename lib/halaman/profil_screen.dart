import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wisata_app/halaman/dashboard_screen.dart';
import 'package:wisata_app/main.dart';

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
      appBar: AppBar(
        title: const Text(''),
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
              backgroundImage: AssetImage('assetName'),
            ),
            const SizedBox(height: 15,),
            Align(
              alignment: Alignment.centerLeft,
              child: ListTile(
                title: const Text('Account'),
                tileColor: Colors.white,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: ListTile(
                title: const Text('Location'),
                tileColor: Colors.white,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: ListTile(
                title: const Text('About'),
                tileColor: Colors.white,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: ListTile(
                title: const Text('Help Center'),
                tileColor: Colors.white,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(15),
              ),
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}


// class ProfilScreen extends StatelessWidget {
//   const ProfilScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(''),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => DashboardPage()),
//                 );
//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             CircleAvatar(
//               radius: 70,
//               backgroundImage: AssetImage('assetName'),
//             ),
//             const SizedBox(height: 15,),
//             ListTile(
//               title: const Text('Account'),
//               tileColor: Colors.white,
//             ),
//             ListTile(
//               title: const Text('Location'),
//               tileColor: Colors.white,
//             ),
//             ListTile(
//               title: const Text('About'),
//               tileColor: Colors.white,
//             ),
//             ListTile(
//               title: const Text('Help Center'),
//               tileColor: Colors.white,
//             ),
//             ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 padding: EdgeInsets.all(15),
//               ),
//               child: const Text('Sign Out'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
