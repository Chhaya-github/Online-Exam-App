
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String userName;
  final String email;
  final int testSolved;
  final int questionsSolved;

  UserModel({
    required this.userName,
    required this.email,
    required this.testSolved,
    required this.questionsSolved,
  });

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'email': email,
      'testSolved': testSolved,
      'questionsSolved': questionsSolved,
    };
  }

  factory UserModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot,
  ) {
    final data = documentSnapshot.data()!;
    return UserModel(
      userName: data['userName'],
      email: data['email'],
      testSolved: data['testSolved'],
      questionsSolved: data['questionsSolved'],
    );
  }
}
