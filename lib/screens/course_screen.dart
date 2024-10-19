import 'package:flutter/material.dart';
import 'package:onboarding/screens/test/test_instructions.dart';

class CourseScreen extends StatefulWidget {
  CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black87,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TestInstructions(),
                ),
              );
            },
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text('Java test 1'),
              ),
            ),
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TestInstructions(),
                ),
              );
            },
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(child: Text('Java test 2')),
            ),
          )
        ],
      ),
    );
  }
}
