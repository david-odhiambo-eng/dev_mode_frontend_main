import 'package:flutter/widgets.dart';

class TeamNamesProvider extends ChangeNotifier {
  List<String> teamNames = [];

  void addTeam({required String teamName}) {
    teamNames.add(teamName);

    notifyListeners();
  }

  void deleteTeam({required int teamNameIndex}) {
    if (teamNameIndex < 0 || teamNameIndex >= teamNames.length) {
      return;
    }

    teamNames.removeAt(teamNameIndex);
    notifyListeners();
  }
}
