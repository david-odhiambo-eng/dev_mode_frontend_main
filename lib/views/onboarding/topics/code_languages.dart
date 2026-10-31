import 'package:coding_game/providers/topic_name_provider.dart';
import 'package:coding_game/viewModel/get_quiz.dart';
import 'package:coding_game/views/home/home.dart';

import 'package:coding_game/views/home/home_image_page.dart';
import 'package:coding_game/views/onboarding/topics/add_teams.dart';

import 'package:coding_game/views/reusables/bool_icons.dart';
import 'package:coding_game/views/reusables/colors.dart';
import 'package:coding_game/views/reusables/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class CodeLanguages extends StatefulWidget {
  const CodeLanguages({super.key});

  @override
  State<CodeLanguages> createState() => _CodeLanguagesState();
}

class _CodeLanguagesState extends State<CodeLanguages> {
  bool _isDone = false;

  int _languageCount = 0;
  @override
  Widget build(BuildContext context) {
    TopicNameProvider topicNameProvider = context.read<TopicNameProvider>();
    List<String> topicNames = context.watch<TopicNameProvider>().topicNames;
    GetQuizDbProvider getQuizDbProvider = context.read<GetQuizDbProvider>();
    bool isLoading = context.watch<GetQuizDbProvider>().isLoading;
    return Scaffold(
      body: HomeImagePage(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              children: [
                // Title
                Text(
                  'What is your favorite language(s)?',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: 'JetBrainsMono',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 35),

                // Languages
                Expanded(
                  child: Center(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 18,
                      runSpacing: 24,
                      children: [
                        _showCodeLanguages(
                          languageName: 'Python',
                          icon: FontAwesomeIcons.python,
                          iconColor: !isPython
                              ? const Color(0xFF3776AB)
                              : Colors.green,
                          onTap: () {
                            setState(() {
                              isPython = !isPython;
                            });
                            isPython ? _increaseCount() : _reduceCount();
                            topicNameProvider.addTopicNames(
                              topicName: 'Python',
                            );
                          },
                        ),

                        _showCodeLanguages(
                          languageName: 'JavaScript',
                          icon: FontAwesomeIcons.js,
                          iconColor: !isJs
                              ? const Color(0xFFF7DF1E)
                              : Colors.green,
                          onTap: () {
                            setState(() {
                              isJs = !isJs;
                            });
                            isJs ? _increaseCount() : _reduceCount();
                            topicNameProvider.addTopicNames(
                              topicName: 'JavaScript',
                            );
                          },
                        ),

                        _showCodeLanguages(
                          languageName: 'Java',
                          icon: FontAwesomeIcons.java,
                          iconColor: !isJava
                              ? const Color(0xFFED8B00)
                              : Colors.green,
                          onTap: () {
                            setState(() {
                              isJava = !isJava;
                            });
                            isJava ? _increaseCount() : _reduceCount();
                            topicNameProvider.addTopicNames(topicName: 'Java');
                          },
                        ),

                        _showCodeLanguages(
                          languageName: 'C++',
                          icon: FontAwesomeIcons.code,
                          iconColor: !isCpp
                              ? const Color(0xFF00599C)
                              : Colors.green,
                          onTap: () {
                            setState(() {
                              isCpp = !isCpp;
                            });
                            isCpp ? _increaseCount() : _reduceCount();
                            topicNameProvider.addTopicNames(topicName: 'C++');
                          },
                        ),

                        _showCodeLanguages(
                          languageName: 'C#',
                          icon: FontAwesomeIcons.cuttlefish,
                          iconColor: !isC
                              ? const Color(0xFF68217A)
                              : Colors.green,
                          onTap: () {
                            setState(() {
                              isC = !isC;
                            });
                            isC ? _increaseCount() : _reduceCount();
                            topicNameProvider.addTopicNames(topicName: 'C#');
                          },
                        ),

                        _showCodeLanguages(
                          languageName: 'TypeScript',
                          icon: FontAwesomeIcons.js,
                          iconColor: !isTypeScript
                              ? const Color(0xFF3178C6)
                              : Colors.green,
                          onTap: () {
                            setState(() {
                              isTypeScript = !isTypeScript;
                            });
                            isTypeScript ? _increaseCount() : _reduceCount();
                            topicNameProvider.addTopicNames(
                              topicName: 'TypeScript',
                            );
                          },
                        ),

                        _showCodeLanguages(
                          languageName: 'Go',
                          icon: FontAwesomeIcons.golang,
                          iconColor: !isGo
                              ? const Color(0xFF00ADD8)
                              : Colors.green,
                          onTap: () {
                            setState(() {
                              isGo = !isGo;
                            });
                            isGo ? _increaseCount() : _reduceCount();
                            topicNameProvider.addTopicNames(topicName: 'Go');
                          },
                        ),

                        _showCodeLanguages(
                          languageName: 'Rust',
                          icon: FontAwesomeIcons.rust,
                          iconColor: !isRust
                              ? const Color(0xFFDEA584)
                              : Colors.green,
                          onTap: () {
                            setState(() {
                              isRust = !isRust;
                            });
                            isRust ? _increaseCount() : _reduceCount();
                            topicNameProvider.addTopicNames(topicName: 'Rust');
                          },
                        ),

                        _showCodeLanguages(
                          languageName: 'PHP',
                          icon: FontAwesomeIcons.php,
                          iconColor: !isPhp
                              ? const Color(0xFF777BB4)
                              : Colors.green,
                          onTap: () {
                            setState(() {
                              isPhp = !isPhp;
                            });
                            isPhp ? _increaseCount() : _reduceCount();
                            topicNameProvider.addTopicNames(topicName: 'PHP');
                          },
                        ),

                        _showCodeLanguages(
                          languageName: 'Dart',
                          icon: FontAwesomeIcons.dartLang,
                          iconColor: !isDart
                              ? const Color(0xFF0175C2)
                              : Colors.green,
                          onTap: () {
                            setState(() {
                              isDart = !isDart;
                            });
                            isDart ? _increaseCount() : _reduceCount();
                            topicNameProvider.addTopicNames(topicName: 'Dart');
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                // Done button
                _isDone
                    ? SizedBox(
                        width: 150,
                        height: 45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: mainButttonColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: isLoading
                              ? null
                              : () async {
                                  await getQuizDbProvider.getQuizDb(
                                    topicNames: topicNames,
                                  );
                                  if (context.mounted) {
                                    if (getQuizDbProvider.question != null) {
                                      showErrorOrSuccess(
                                        message: 'READY TO START',
                                        backgroundColor: Colors.green,
                                        iconColor: Colors.white,
                                        icon: Icons.check,
                                        context: context,
                                      );
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Home(),
                                        ),
                                      );
                                    } else if (getQuizDbProvider.errorMessage !=
                                        null) {
                                      showErrorOrSuccess(
                                        message:
                                            '${getQuizDbProvider.errorMessage}',
                                        backgroundColor: Colors.red,
                                        iconColor: Colors.white,
                                        icon: Icons.info,
                                        context: context,
                                      );
                                    }
                                  }
                                },
                          child: isLoading
                              ? CircularProgressIndicator(color: Colors.white)
                              : Text(
                                  'DONE',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'JetBrainsMono',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                        ),
                      )
                    : SizedBox.shrink(),

                const SizedBox(height: 18),

                // Progress
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${_languageCount.toString()}/10',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'JetBrainsMono',
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Languages',
                      style: TextStyle(
                        color: Colors.white.withValues(alpha: 0.65),
                        fontFamily: 'JetBrainsMono',
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //increase language count
  void _increaseCount() {
    if (_languageCount < 10) {
      setState(() {
        _languageCount++;
        if (_languageCount >= 1) {
          _isDone = true;
        }
      });
    }
  }

  //reduce count
  void _reduceCount() {
    if (_languageCount > 0) {
      setState(() {
        _languageCount--;
      });
    }
    if (_languageCount == 0) {
      setState(() {
        _isDone = false;
      });
    }
  }

  // languages

  Widget _showCodeLanguages({
    required String languageName,
    required FaIconData icon,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 72,
            width: 72,
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.55),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.18),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: iconColor.withValues(alpha: 0.12),
                  blurRadius: 12,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Center(child: FaIcon(icon, color: iconColor, size: 48)),
          ),

          const SizedBox(height: 8),

          Text(
            languageName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'JetBrainsMono',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.white.withValues(alpha: 0.75),
              letterSpacing: 0.2,
            ),
          ),
        ],
      ),
    );
  }
}
