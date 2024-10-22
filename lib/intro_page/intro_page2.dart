import 'package:flutter/material.dart';

class Intro_Page2 extends StatelessWidget {
  const Intro_Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              Center(
                child: Container(
                  height: 300,
                  width: 300,
                  child: Image.asset('assets/images/i2.jpeg'),
                ),
              ),
              Text('Trust yourself', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text('“Trust yourself, you know more than you think you do”',
                    style: TextStyle(fontSize: 16)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
