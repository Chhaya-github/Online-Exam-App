import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Intro_Page3 extends StatelessWidget {
  const Intro_Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 60,),
              Center(
                child: Container(
                  height: 350,
                  width: 350,
                  child: Center(child: Lottie.network('https://lottie.host/9d054047-a66d-4ec9-85f7-d63b5b5fd4b1/E7fqYE7WjK.json',)),
                ),
              ),
              Text('Education: opening your mind', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text('“Education’s purpose is to replace an empty mind with an open one.”', style: TextStyle(fontSize: 16)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
