import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:onboarding/models/question_model.dart';

final questionsListProvider = StateProvider<List<QuestionModel>>((ref) {
  return [];
});