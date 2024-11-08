import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboarding/models/question_model.dart';

final questionsListProvider = StateProvider<List<QuestionModel>>((ref) {
  return [];
});

final currentIndexProvider = StateProvider<int>((ref) {
  return 0;
});

final currentOptionProvider = StateProvider<int?>((ref) {
  return null;
});
