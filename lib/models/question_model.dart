import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionModel {
  final String correctAnswer;
  final List<String> options;
  final String questionText;

  QuestionModel({
    required this.correctAnswer,
    required this.options,
    required this.questionText,
  });

  factory QuestionModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot,
  ) {
    final data = documentSnapshot.data()!;
    return QuestionModel(
      correctAnswer: data['correctAnswer'],
      options: List.from(data['options']),
      questionText: data['questionText'],
    );
  }

}