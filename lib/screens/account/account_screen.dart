import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});

  final FirebaseAuth auth = FirebaseAuth.instance;
  final int questionsSolved = 123;

  @override
  Widget build(BuildContext context) {
    String email = auth.currentUser?.email.toString() ?? 'User not logged in';
    String userName = auth.currentUser?.displayName ?? 'User not logged in';
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Account'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey,
              ),
              Text(
                email,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                userName,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              // SizedBox(height: 14),
              // Text(
              //   '@gmail.com',
              //   style: TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              SizedBox(height: 10),
              Text(
                email,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Questions Solved',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                questionsSolved.toString(),
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Spacer(),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Add your logout logic here
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Logout'),
                          content: Text('Are you sure you want to logout?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                // Perform logout operation
                                Navigator.of(context).pop();
                                // Navigate to login screen or home screen after logout
                              },
                              child: Text('Logout'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text('Logout'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
