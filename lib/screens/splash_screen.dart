import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:onboarding/onboarding.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({super.key});


  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => OnboardingScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Lottie.network(
            height: 185,
              width: 185,
              'https://lottie.host/c4b398db-10da-46cc-a44a-92f6689cb126/Lb8SiqCr9d.json'))
    );
  }
}
