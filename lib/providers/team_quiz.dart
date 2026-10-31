import 'package:coding_game/model/get_quiz.dart';
import 'package:flutter/material.dart';

class TeamQuizProvider extends ChangeNotifier {
  Map<String, List<GetQuizData>?> teamData = {};

  void addTeamData({
    required String teamName,
    required List<GetQuizData>? questions,
  }) {
    teamData = {teamName: questions};
  }
}
