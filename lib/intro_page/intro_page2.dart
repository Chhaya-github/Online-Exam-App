import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Intro_Page2 extends StatelessWidget {
  const Intro_Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 150,),
              Center(
                child: Container(
                  height: 300,
                  width: 300,
                  child: Center(child: Lottie.network('https://lottie.host/e49761e9-020d-4905-8e06-5baf5ee53489/eR4C4nOjfY.json',)),
                ),
              ),
              Text('Trust yourself', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text('“Trust yourself, you know more than you think you do”', style: TextStyle(fontSize: 16)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
