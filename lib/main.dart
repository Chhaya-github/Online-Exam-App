import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:onboarding/screens/account/account_screen.dart';
import 'package:onboarding/screens/home_screen.dart';
import 'package:onboarding/screens/search/search_screen.dart';
import 'package:onboarding/screens/splash_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ExamApp());
}

class ExamApp extends StatelessWidget {
  const ExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
