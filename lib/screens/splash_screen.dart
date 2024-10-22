import 'dart:async';
import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({super.key});

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => OnboardingScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLightTheme = MediaQuery.of(context).platformBrightness == Brightness.light;
    return Scaffold(
      backgroundColor: isLightTheme ? null : Color(0xff0a1627),
      body: Center(
        child: Container(
            child: isLightTheme
                ? Image.asset('assets/images/splash/light.png')
                : Image.asset('assets/images/splash/dark.png')),
      ),
    );
  }
}
