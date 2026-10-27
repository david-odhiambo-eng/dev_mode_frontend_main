import 'package:flutter/material.dart';

class TopicNameProvider extends ChangeNotifier {
  List<String> topicNames = [];

  void addTopicNames({required String topicName}) {
    topicNames.add(topicName.toLowerCase());
    notifyListeners();
  }
}
