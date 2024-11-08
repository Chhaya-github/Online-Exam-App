// import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:onboarding/screens/home_screen.dart';

// class AccountScreen extends StatefulWidget {
//   const AccountScreen({super.key});

//   @override
//   State<AccountScreen> createState() => _AccountScreenState();
// }

// class _AccountScreenState extends State<AccountScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: const IconThemeData(color: Colors.white),
//         backgroundColor: const Color.fromRGBO(0,80,203,2),
//         title: const Text('Profile', style: TextStyle(color: Colors.white)),
//       ),
//       body: Column(
//         children: [
//           const SizedBox(height: 20),
//           const Text('Your Profile', style: TextStyle(color: Color.fromRGBO(0,80,203,2), fontWeight: FontWeight.bold, fontSize: 30),),
//           Center(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                width: 200,
//                height: 200,
//                decoration: BoxDecoration(
//                  border: Border.all(width: 4, color: Colors.white),
//                  boxShadow: const [
//                    BoxShadow(
//                      spreadRadius: 2,
//                      blurRadius: 10,
//                      color: Colors.black38
//                    ),
//                  ],
//                  shape: BoxShape.circle,
//                  image: const DecorationImage(
//                    fit: BoxFit.contain,
//                    image: AssetImage('assets/images/Cpassport.jpeg')
//                  )
//                ),
//               ),
//             ),
//           )
//         ],
//       ),
//       bottomNavigationBar: GNav(
//         activeColor: Colors.white,
//         color: Colors.white,
//         backgroundColor: const Color.fromRGBO(0,80,203,2),
//         tabs: [
//           GButton(icon: Icons.home,
//             text: 'Home',
//             onPressed: () {
//               Navigator.push(context, MaterialPageRoute(
//                   builder: (context) => HomeScreen()));
//             },
//           ),
//           const GButton(icon: Icons.note_alt_sharp, text: 'Notes'),
//           const GButton(icon: Icons.search, text: 'Search'),
//           GButton(icon: Icons.person,
//             text: 'Account',
//             onPressed: (){
//               Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountScreen()));
//             },)
//         ],
//       ),
//     );
//   }
// }
