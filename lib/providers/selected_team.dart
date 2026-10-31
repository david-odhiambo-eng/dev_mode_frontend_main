import 'package:flutter/material.dart';

class SelectedTeamProvider extends ChangeNotifier{
  String selectedTeamName = '';

  void selectTeamName({required String teamName}){
    selectedTeamName = teamName;
   
    notifyListeners();
  }
}