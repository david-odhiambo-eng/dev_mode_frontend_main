class GetQuizData {
  String quiz;
  String answer;
  String keyWord;
  String quizTopic;

  GetQuizData({
    required this.answer,
    required this.keyWord,
    required this.quiz,
    required this.quizTopic
  });

  factory GetQuizData.fromJson(Map<String, dynamic> json) {
    return GetQuizData(
      answer: json['answer'],
      keyWord: json['key_word'],
      quiz: json['quiz'],
      quizTopic: json['quiz_topic']
    );
  }
}
