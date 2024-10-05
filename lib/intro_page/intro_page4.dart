import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Intro_Page4 extends StatelessWidget {
  const Intro_Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 60,),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 350,
                  width: 350,
                  child: Center(child: Lottie.network('https://lottie.host/4282497b-dcd5-4033-86a2-1e7ddbbc6acb/DcQkG8ktDH.json',)),
                ),
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
    );
  }
}
