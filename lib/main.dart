import 'package:coding_game/providers/selected_team.dart';
import 'package:coding_game/providers/temprary_teams.dart';
import 'package:coding_game/viewModel/auth/sign_in.dart';
import 'package:coding_game/providers/topic_name_provider.dart';
import 'package:coding_game/viewModel/auth/sign_up_provider.dart';

import 'package:coding_game/viewModel/get_quiz.dart';
import 'package:coding_game/views/onboarding/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  //locking screen to potrait
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignUpProvider()),
        ChangeNotifierProvider(create: (_) => SingnInProvider()),
        ChangeNotifierProvider(create: (_) => TemporaryTeamsProvider()),
        ChangeNotifierProvider(create: (_) => TopicNameProvider()),
        ChangeNotifierProvider(create: (_) => GetQuizDbProvider()),
        ChangeNotifierProvider(create: (_) => SelectedTeamProvider()),
      ],
      child: CodingGame(),
    ),
  );
}

class CodingGame extends StatelessWidget {
  const CodingGame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Welcome(), debugShowCheckedModeBanner: false);
  }
}
