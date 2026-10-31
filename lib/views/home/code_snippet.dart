import 'package:coding_game/model/get_quiz.dart';
import 'package:coding_game/providers/quiz_index.dart';
import 'package:coding_game/providers/selected_team.dart';
import 'package:coding_game/providers/team_quiz.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CodeSnippet extends StatefulWidget {
  const CodeSnippet({super.key});

  @override
  State<CodeSnippet> createState() => _CodeSnippetState();
}

class _CodeSnippetState extends State<CodeSnippet> {
  @override
  Widget build(BuildContext context) {
    String selectedTeamName = context
        .watch<SelectedTeamProvider>()
        .selectedTeamName;
    Map<String, List<GetQuizData>?> teamData = context
        .watch<TeamQuizProvider>()
        .teamData;
    List<GetQuizData>? questions = teamData[selectedTeamName];
    int quizIndex = context.watch<QuizIndexProvider>().quizIndex;
    GetQuizData? quiz;
    if (questions != null &&
        questions.isNotEmpty &&
        quizIndex >= 0 &&
        quizIndex < questions.length) {
      quiz = questions[quizIndex];
    }
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          //Editor header
          Container(
            height: 42,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.2),
              border: Border(
                bottom: BorderSide(color: Colors.white.withValues(alpha: 0.08)),
              ),
            ),
            child: Row(
              children: [
                _showDottedColors(color: Colors.red),
                const SizedBox(width: 6),
                _showDottedColors(color: Colors.amber),
                const SizedBox(width: 6),
                _showDottedColors(color: Colors.green),
                const Spacer(),
                Text(
                  quiz?.quizTopic ?? 'topic',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.55),
                    fontSize: 11,
                    fontFamily: 'JetBrainsMono',
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          // Code
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: Center(
                  child: Text(
                    quiz?.quiz ?? 'No questions under\nselected topics\nTry selecting other topics',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'JetBrainsMono',
                    ),
                  ),
                ),
              ),
            ),
          ),

          _showKeyWordAndAnswer(
            topic: 'Keyword:',
            topicValueColor: Colors.red,
            topicValue: quiz?.keyWord ?? 'word to describe will show here',
          ),

          _showKeyWordAndAnswer(
            topic: 'Answer:',
            topicValueColor: Colors.green,
            topicValue: quiz?.answer ?? '',
            visibility: IconButton(
              onPressed: () {},
              icon: Icon(Icons.visibility_off),
            ),
          ),
        ],
      ),
    );
  }

  //showing dotted colors:
  Widget _showDottedColors({required Color color}) {
    return Container(
      width: 9,
      height: 9,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }

  //showing keyword and answer
  Widget _showKeyWordAndAnswer({
    required String topic,
    required Color topicValueColor,
    required String topicValue,
    Widget? visibility,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: Row(
        children: [
          Text(
            topic,
            style: const TextStyle(
              fontFamily: 'JetBrainsMono',
              color: Colors.white,
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                topicValue,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                style: TextStyle(
                  fontFamily: 'JetBrainsMono',
                  color: topicValueColor,
                ),
              ),
            ),
          ),

          ?visibility,
        ],
      ),
    );
  }
}
