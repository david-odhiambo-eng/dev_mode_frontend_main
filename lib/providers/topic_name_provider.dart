import 'package:flutter/material.dart';

class TopicNameProvider extends ChangeNotifier {
  List<String> topicNames = [];

  void addTopicNames({required String topicName}) {
    topicNames.add(topicName.toLowerCase());
    print('TOPICS SELECTED ARE: ... $topicNames');
    notifyListeners();
  }

  void deleteTopicName({required String topicName}) {
    topicNames.remove(topicName.toLowerCase());
    print('TOPICS SELECTED ARE: ... $topicNames');
    notifyListeners();
  }

  void clearAllTopicNames() {
    topicNames.clear();
    print('TOPICS SELECTED ARE: ... $topicNames');
    notifyListeners();
  }
}
