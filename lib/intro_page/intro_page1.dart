import 'package:flutter/material.dart';

class Intro_Page1 extends StatelessWidget {
  const Intro_Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 80,
              ),
              Center(
                child: Container(
                  height: 350,
                  width: 350,
                  child: Column(
                    children: [
                      Center(
                        child: Image.asset('assets/images/i1.jpeg'),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                'Crack any Exam in 1st Attempt',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Get everything you need for coding preparation at one place',
                  style: TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
