import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboarding/providers/question_list_provider.dart';
import 'package:onboarding/screens/test/apti_test_screen.dart';
import 'package:onboarding/services/cloud_firestore.dart';

class TestInstructions extends ConsumerWidget {
  const TestInstructions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  loadQuestions(
                    ref: ref,
                    quizCategoryId: 'aptitude',
                    quizSubcategoryId: 'logical',
                    testId: 'blood_relation',
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AptitudeTestScreen(),
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

  Future loadQuestions({
    required String quizCategoryId,
    required String quizSubcategoryId,
    required String testId,
    required WidgetRef ref,
  }) async {
    final list = await CloudFirestore().getAptitudeQuestions(
        quizCategoryId: quizCategoryId, quizSubcategoryId: quizSubcategoryId, testId: testId);

    ref.read(questionsListProvider.notifier).update((state) => list);
  }
}
