import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:onboarding/models/question_model.dart';
import 'package:onboarding/models/user_model.dart';

class CloudFirestore {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUser(UserModel userModel) async {
    await _firestore.collection('users').doc().set(userModel.toMap());
  }

  Future<void> getUser(String userId) async {
    DocumentSnapshot doc = await _firestore.collection('users').doc(userId).get();
    if (doc.exists) {
      print("User data: ${doc.data()}");
    } else {
      print("User does not exist.");
    }
  }

  Future<void> getAllUsers() async {
    QuerySnapshot querySnapshot = await _firestore.collection('users').get();

    final list = querySnapshot.docs
        .map((e) => UserModel.fromSnapshot(e as DocumentSnapshot<Map<String, dynamic>>))
        .toList();

    for (final data in list) {
      log(data.userName);
    }
  }

  Future<List<QuestionModel>> getProgrammingLangQuestions({
    required String quizCategoryId,
    required String quizSubcategoryId,
    required String testId,
  }) async {
    QuerySnapshot querySnapshot = await _firestore
        .collection('questions')
        .where('quizCategoryId', isEqualTo: quizCategoryId)
        .where('quizSubcategoryId', isEqualTo: quizSubcategoryId)
        .where('testId', isEqualTo: testId)
        .get();

    final list = querySnapshot.docs
        .map((e) => QuestionModel.fromSnapshot(e as DocumentSnapshot<Map<String, dynamic>>)).toList();

    return list;
  }

  Future<List<QuestionModel>> getAptitudeQuestions({
    required String quizCategoryId,
    required String quizSubcategoryId,
    required String testId,
  }) async {
    QuerySnapshot querySnapshot = await _firestore
        .collection('questions')
        .where('quizCategoryId', isEqualTo: quizCategoryId)
        .where('quizSubcategoryId', isEqualTo: quizSubcategoryId)
        .where('testId', isEqualTo: testId)
        .get();

    final list = querySnapshot.docs
        .map((e) => QuestionModel.fromSnapshot(e as DocumentSnapshot<Map<String, dynamic>>)).toList();

    return list;
  }
}
