import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboarding/providers/question_list_provider.dart';

class ProgrammingTestScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<ProgrammingTestScreen> createState() => _ProgrammingTestScreenState();
}

class _ProgrammingTestScreenState extends ConsumerState<ProgrammingTestScreen> {
  int? selectedIndex = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mcq test'),
      ), // Background color as seen in the image
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildMcqScreen(ref),
      ),
    );
  }

  Widget _buildMcqScreen(WidgetRef ref) {
    final list = ref.read(questionsListProvider);
    final question = list[ref.watch(currentIndexProvider)];
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 35),
        Text(
          (ref.read(currentIndexProvider) + 1).toString() + '. ' + question.questionText,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          // textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        InkWell(
          onTap: () {
            setState(() {
              selectedIndex = 0;
            });
          },
          child: _buildOption(question.options[0], selectedIndex, 0),
        ),
        InkWell(
          onTap: () {
            setState(() {
              selectedIndex = 1;
            });
          },
          child: _buildOption(question.options[1], selectedIndex, 1),
        ),
        InkWell(
          onTap: () {
            setState(() {
              selectedIndex = 2;
            });
          },
          child: _buildOption(question.options[2], selectedIndex, 2),
        ),
        InkWell(
          onTap: () {
            setState(() {
              selectedIndex = 3;
            });
          },
          child: _buildOption(question.options[3], selectedIndex, 3),
        ),
        Spacer(),
        ElevatedButton(
          onPressed: () {
            // Handle next question logic here
            setState(() {
              selectedIndex = null;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue.shade300,
            foregroundColor: Colors.black,
          ),
          child: const Text('Clear Response'),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            ref.watch(currentIndexProvider) != 0
                ? Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle prev question logic here
                        if (selectedIndex != null && ref.read(currentIndexProvider) > 0) {
                          log(ref.read(currentIndexProvider).toString());
                          ref.read(currentIndexProvider.notifier).update((state) => state - 1);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade300,
                        foregroundColor: Colors.black,
                      ),
                      child: const Text('Previous'),
                    ),
                  )
                : Container(),
            SizedBox(width: 5),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // Handle next question logic here
                  if (selectedIndex != null && ref.read(currentIndexProvider) < list.length - 1) {
                    log(ref.read(currentIndexProvider).toString());
                    ref.read(currentIndexProvider.notifier).update((state) => state + 1);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade300,
                  foregroundColor: Colors.black,
                ),
                child: Text(
                  ref.watch(currentIndexProvider) == list.length - 1 ? 'Finish' : 'Next Question',
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 210),
      ],
    );
  }

  Widget _buildOption(String text, int? selectedIndex, int currIndex) {
    if (selectedIndex == null || selectedIndex != currIndex)
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.grey.shade300,
          ),
          height: 42,
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.start,
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
            color: Colors.grey.shade300,
          ),
          height: 42,
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
