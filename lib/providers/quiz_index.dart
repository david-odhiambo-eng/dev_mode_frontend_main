import 'package:coding_game/model/get_quiz.dart';
import 'package:flutter/material.dart';

class QuizIndexProvider extends ChangeNotifier {
  int quizIndex = 0;

  void addQuizIndex({required List<GetQuizData>? questions}) {
    if (questions == null || quizIndex >= questions!.length-1) {
      return;
    } else {
      quizIndex++;
      notifyListeners();
    }
  }

  void subtractQuizIndex({required List<GetQuizData>? questions}) {
    if (questions == null || quizIndex <= 0) {
      return;
    } else {
      quizIndex--;
      notifyListeners();
    }
  }
}
