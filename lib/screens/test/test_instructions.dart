import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboarding/providers/question_list_provider.dart';
import 'package:onboarding/screens/test/apti_test_screen.dart';
import 'package:onboarding/screens/test/prog_test_screen.dart';
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
          Padding(
            padding: EdgeInsets.only(left: 40),
            child: Text(
              'Instructions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(),
          Container(
            padding: EdgeInsets.only(left: 20),
            margin: EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '• This is a FREE online test.',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '• Total number of questions 15',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '• Each question carries 1 mark',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '• There are no negative mark',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '• Score will be shown after test is completed',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '• All the best',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Spacer(),

          // start button
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Center(
              child: ElevatedButton(
                onPressed: () async {
                  await loadQuestions(
                    ref: ref,
                    quizCategoryId: 'programming_languages',
                    quizSubcategoryId: 'java',
                    testId: 'test1',
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProgrammingTestScreen(),
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
    final list = await CloudFirestore().getProgrammingLangQuestions(
        quizCategoryId: quizCategoryId, quizSubcategoryId: quizSubcategoryId, testId: testId);

    ref.read(questionsListProvider.notifier).update((state) => list);
  }
}
