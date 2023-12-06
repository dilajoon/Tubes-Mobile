// import 'package:flutter/material.dart';

// class Favourites extends StatefulWidget {
//   const Favourites({Key? key}) : super(key: key);

//   @override
//   State<Favourites> createState() => _FavouritesState();
// }

// class _FavouritesState extends State<Favourites> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: 10,
//       itemBuilder: (context, index) {
//         return Card(
//           elevation: 3, // Mengatur ketinggian card shadow
//           margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//           child: Padding(
//             padding: const EdgeInsets.all(15),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                   flex: 7,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Product Title $index',
//                         style: TextStyle(
//                           fontSize: 22,
//                           color: Colors.blue,
//                         ),
//                       ),
//                       SizedBox(height: 10.0),
//                       Text(
//                         'Detailed product description $index',
//                         style: TextStyle(
//                           fontSize: 16, // Mengurangi ukuran font deskripsi
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.favorite, color: Colors.red),
//                   onPressed: () {
//                     // Implementasi aksi saat tombol favorit ditekan
//                   },
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
