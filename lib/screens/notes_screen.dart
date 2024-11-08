import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:onboarding/screens/account/account_screen.dart';
import 'package:onboarding/screens/home_screen.dart';
import '../bottom_screen/account_screen.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        activeColor: Colors.white,
        color: Colors.white,
        backgroundColor: const Color.fromRGBO(0, 80, 203, 2),
        tabs: [
          GButton(
            icon: Icons.home,
            text: 'Home',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
            },
          ),
          GButton(
            icon: Icons.note_alt_sharp,
            semanticLabel: "Notes",
            text: 'Notes',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NotesScreen()));
            },
          ),
          const GButton(icon: Icons.search, text: 'Search'),
          GButton(
            icon: Icons.person,
            active: true,
            text: 'Account',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AccountScreen()));
            },
          )
        ],
      ),
    );
  }
}
