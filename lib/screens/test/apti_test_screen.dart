import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:onboarding/services/cloud_firestore.dart';

class AptitudeTestScreen extends StatefulWidget {
  @override
  State<AptitudeTestScreen> createState() => _AptitudeTestScreenState();
}

class _AptitudeTestScreenState extends State<AptitudeTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.blue[900], // Background color as seen in the image
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List>(
            future: CloudFirestore().getAptitudeQuestions(
              quizCategoryId: 'aptitude',
              quizSubcategoryId: 'logical',
              testId: 'blood_relation',
            ),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasData) {
                final list = snapshot.data![0];
                log(snapshot.data!.length.toString());
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      list.questionText,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    _buildOption(list.options[0]),
                    _buildOption(list.options[1]),
                    _buildOption(list.options[2]),
                    _buildOption(list.options[3]),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        // Handle next question logic here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        foregroundColor: Colors.black,
                      ),
                      child: const Text('Next Question'),
                    ),
                  ],
                );
              } else {
                return Center(
                  child: Text('No question'),
                );
              }
            }),
      ),
    );
  }

  Widget _buildOption(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          // Handle answer selection
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          minimumSize: const Size(double.infinity, 50),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}
