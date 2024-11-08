import 'package:flutter/material.dart';
import 'package:onboarding/services/cloud_firestore.dart';

class ProgrammingTestScreen extends StatefulWidget {
  @override
  State<ProgrammingTestScreen> createState() => _ProgrammingTestScreenState();
}

class _ProgrammingTestScreenState extends State<ProgrammingTestScreen> {
  int? selectedIndex = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.blue[900], // Background color as seen in the image
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<List>(
          future: CloudFirestore().getProgrammingLangQuestions(
            quizCategoryId: 'programming_languages',
            quizSubcategoryId: 'java',
            testId: 'test1',
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              final list = snapshot.data![0];
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
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    child: _buildOption(list.options[0], selectedIndex, 0),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    child: _buildOption(list.options[1], selectedIndex, 1),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 2;
                      });
                    },
                    child: _buildOption(list.options[2], selectedIndex, 2),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 3;
                      });
                    },
                    child: _buildOption(list.options[3], selectedIndex, 3),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      // Handle next question logic here
                      setState(() {
                        selectedIndex = null;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      foregroundColor: Colors.black,
                    ),
                    child: const Text('Clear Response'),
                  ),
                  const SizedBox(height: 20),
                  Row(children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle next question logic here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          foregroundColor: Colors.black,
                        ),
                        child: const Text('Previous'),
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle next question logic here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          foregroundColor: Colors.black,
                        ),
                        child: const Text('Next Question'),
                      ),
                    ),
                  ]),
                ],
              );
            } else {
              return Center(
                child: Text('No question'),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildOption(String text, int? selectedIndex, int currIndex) {
    if (selectedIndex == null || selectedIndex != currIndex)
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          height: 35,
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      );
    else {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.green,
              width: 5,
            ),
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          height: 35,
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      );
    }
  }
}
