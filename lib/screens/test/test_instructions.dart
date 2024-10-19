import 'package:flutter/material.dart';
import 'package:onboarding/screens/test/test_screen.dart';

class TestInstructions extends StatelessWidget {
  const TestInstructions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Instructions',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.only(left: 20),
            margin: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('This is a FREE online test.'),
                Text('Total number of questions 20'),
                Text('Each question carries 1 mark'),
                Text('There are no negative mark'),
                Text('Score will be shown after test is completed'),
                Text('All the best'),
              ],
            ),
          ),
          Spacer(),

          // start button
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TestScreen(),
                    ),
                  );
                },
                child: Text('Start test'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
