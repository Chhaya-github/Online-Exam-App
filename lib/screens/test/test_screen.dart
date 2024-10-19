import 'dart:async';

import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int _timeRemaining = 30; // Timer duration in seconds
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timeRemaining > 0) {
        setState(() {
          _timeRemaining--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void _nextQuestion() {
    // Logic to go to the next question
  }

  void _prevQuestion() {
    // Logic to go to the previous question
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Logical Reasoning - 12'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Time: $_timeRemaining s'),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'What is reverse of "HELLO"?',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('OLLHE'),
                    leading: Radio<int>(
                      value: 1,
                      groupValue: null, // Replace with your group value variable
                      onChanged: (int? value) {
                        // Handle radio button change
                      },
                    ),
                  ),
                  ListTile(
                    title: Text('OLHEL'),
                    leading: Radio<int>(
                      value: 2,
                      groupValue: null, // Replace with your group value variable
                      onChanged: (int? value) {
                        // Handle radio button change
                      },
                    ),
                  ),
                  ListTile(
                    title: Text('OLLEH'),
                    leading: Radio<int>(
                      value: 3,
                      groupValue: null, // Replace with your group value variable
                      onChanged: (int? value) {
                        // Handle radio button change
                      },
                    ),
                  ),
                  ListTile(
                    title: Text('LLEOH'),
                    leading: Radio<int>(
                      value: 4,
                      groupValue: null, // Replace with your group value variable
                      onChanged: (int? value) {
                        // Handle radio button change
                      },
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _prevQuestion,
                  child: Text('Prev'),
                ),
                ElevatedButton(
                  onPressed: _nextQuestion,
                  child: Text('Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
