import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveTeamNames({required List<String> teamNames}) async {
  final prefs = await SharedPreferences.getInstance();

  await prefs.setStringList('topicNames', teamNames);
}

Future<List<String>> getTeamNames() async {
  final prefs = await SharedPreferences.getInstance();

  return prefs.getStringList('topicNames') ?? [];
}

Future<void> deleteTeamNames({required int teamNameIndex}) async {
  final prefs = await SharedPreferences.getInstance();

  final List<String> teamNames = prefs.getStringList('topicNames') ?? [];

  if (teamNameIndex < 0 || teamNameIndex >= teamNames.length) {
    return;
  }

  teamNames.removeAt(teamNameIndex);

  await prefs.setStringList('topicNames', teamNames);
}
