import 'package:coding_game/model/get_quiz.dart';
import 'package:coding_game/providers/quiz_index.dart';
import 'package:coding_game/providers/selected_team.dart';
import 'package:coding_game/providers/team_quiz.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PsPad extends StatelessWidget {
  const PsPad({super.key});

  static const double imageAspectRatio = 1536 / 1024;
  static const double designWidth = 360.0;
  static const double designHeight = 240.0;

  @override
  Widget build(BuildContext context) {
    QuizIndexProvider quizIndexProvider = context.read<QuizIndexProvider>();
    String selectedTeamName = context
        .watch<SelectedTeamProvider>()
        .selectedTeamName;
    Map<String, List<GetQuizData>?> teamData = context
        .watch<TeamQuizProvider>()
        .teamData;
    List<GetQuizData>? questions = teamData[selectedTeamName];
    return AspectRatio(
      aspectRatio: imageAspectRatio,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final w = constraints.maxWidth;
          final h = constraints.maxHeight;

          double px(double value) => value * (w / designWidth);
          double py(double value) => value * (h / designHeight);

          return Stack(
            children: [
              Image.asset(
                'assets/images/ps_pad.png',
                width: w,
                height: h,
                fit: BoxFit.contain,
              ),

              Positioned(
                top: py(50),
                left: px(258),
                child: _button(
                  child: IconButton(
                    onPressed: () {
                      quizIndexProvider.addQuizIndex(questions: questions);
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              Positioned(
                top: py(50),
                right: px(255),
                child: _button(
                  child: IconButton(
                    onPressed: () {
                      quizIndexProvider.subtractQuizIndex(questions: questions);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              Positioned(
                top: py(95),
                right: px(205),
                child: _button(
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.remove, color: Colors.red),
                  ),
                ),
              ),

              Positioned(
                top: py(95),
                left: px(205),
                child: _button(
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add, color: Colors.green),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  static Widget _button({required Widget child}) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: const Color(0xFF23241F),
      child: child,
    );
  }
}
