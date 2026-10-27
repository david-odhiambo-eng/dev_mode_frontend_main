import 'package:coding_game/backendService/get_quiz.dart';
import 'package:coding_game/model/get_quiz.dart';
import 'package:flutter/material.dart';

class GetQuizDbProvider extends ChangeNotifier {
  bool _isLoading = false;
  List<GetQuizData>? _questions;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  List<GetQuizData>? get question => _questions;
  String? get errorMessage => _errorMessage;

  Future<void> getQuizDb({required List<String> topicNames}) async {
    _isLoading = true;
    _questions = null;
    _errorMessage = null;
    notifyListeners();

    try {
      final questions = await getQuestions(topicNames: topicNames);
      _questions = questions;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
