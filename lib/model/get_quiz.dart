class GetQuizData {
  String quiz;
  String answer;
  String keyWord;

  GetQuizData({
    required this.answer,
    required this.keyWord,
    required this.quiz,
  });

  factory GetQuizData.fromJson(Map<String, dynamic> json) {
    return GetQuizData(
      answer: json['answer'],
      keyWord: json['key_word'],
      quiz: json['quiz'],
    );
  }
}
