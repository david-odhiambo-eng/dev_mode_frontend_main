import 'package:coding_game/providers/topic_name_provider.dart';
import 'package:coding_game/views/onboarding/topics/code_languages.dart';
import 'package:coding_game/views/reusables/bool_icons.dart';
import 'package:coding_game/views/reusables/colors.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class IconsPage extends StatefulWidget {
  const IconsPage({super.key});

  @override
  State<IconsPage> createState() => _IconsPageState();
}

class _IconsPageState extends State<IconsPage> {
  int _selectedTopicsCount = 0;
  Color _selectedTopicColor = Colors.red;
  bool _isNextButtonActive = false;

  @override
  Widget build(BuildContext context) {
    TopicNameProvider topicNameProvider = context.read<TopicNameProvider>();
    return Expanded(
      child: Stack(
        children: [
          // AI
          _popupIcons(
            top: 5,
            left: 5,
            icon: FontAwesomeIcons.robot,
            iconColor: !isAiSelected ? aiColor : Colors.green,
            label: 'AI',
            onTap: () {
              setState(() {
                isAiSelected = !isAiSelected;
              });
              isAiSelected ? _increaseTopicCount() : _decreaseTopicCount();
              topicNameProvider.addTopicNames(topicName: 'AI');
            },
          ),

          // ML
          _popupIcons(
            top: 5,
            left: 250,
            icon: FontAwesomeIcons.brain,
            iconColor: !isMlSelected ? mlColor : Colors.green,
            label: 'ML',
            onTap: () {
              setState(() {
                isMlSelected = !isMlSelected;
              });
              isMlSelected ? _increaseTopicCount() : _decreaseTopicCount();
              topicNameProvider.addTopicNames(topicName: 'ML');
            },
          ),

          // Docker
          _popupIcons(
            top: 145,
            left: 5,
            icon: FontAwesomeIcons.docker,
            iconColor: !isDockerSelected ? dockerColor : Colors.green,
            label: 'Docker',
            onTap: () {
              setState(() {
                isDockerSelected = !isDockerSelected;
              });
              isDockerSelected ? _increaseTopicCount() : _decreaseTopicCount();
              topicNameProvider.addTopicNames(topicName: 'Docker');
            },
          ),

          // Database
          _popupIcons(
            top: 145,
            left: 250,
            icon: FontAwesomeIcons.database,
            iconColor: !isDatabaseSelected ? databasesColor : Colors.green,
            label: 'Database',
            onTap: () {
              setState(() {
                isDatabaseSelected = !isDatabaseSelected;
              });
              isDatabaseSelected
                  ? _increaseTopicCount()
                  : _decreaseTopicCount();
              topicNameProvider.addTopicNames(topicName: 'Database');
            },
          ),

          // DSA
          _popupIcons(
            top: 75,
            left: 127,
            icon: FontAwesomeIcons.diagramProject,
            iconColor: !isDsaSelected ? algorithmsColor : Colors.green,
            label: 'DSA',
            isCenter: true,
            onTap: () {
              setState(() {
                isDsaSelected = !isDsaSelected;
              });
              isDsaSelected ? _increaseTopicCount() : _decreaseTopicCount();
              topicNameProvider.addTopicNames(topicName: 'DSA');
            },
          ),

          // GitHub
          _popupIcons(
            top: 285,
            left: 5,
            icon: FontAwesomeIcons.github,
            iconColor: !isGitSelected ? githubColor : Colors.green,
            label: 'Git',
            onTap: () {
              setState(() {
                isGitSelected = !isGitSelected;
              });
              isGitSelected ? _increaseTopicCount() : _decreaseTopicCount();
              topicNameProvider.addTopicNames(topicName: 'Git');
            },
          ),

          // Server
          _popupIcons(
            top: 285,
            left: 250,
            icon: FontAwesomeIcons.server,
            iconColor: !isServerSelected ? serverColor : Colors.green,
            label: 'Backend',
            onTap: () {
              setState(() {
                isServerSelected = !isServerSelected;
              });
              isServerSelected ? _increaseTopicCount() : _decreaseTopicCount();
              topicNameProvider.addTopicNames(topicName: 'Backend');
            },
          ),

          // Coding
          _popupIcons(
            top: 220,
            left: 127,
            icon: FontAwesomeIcons.code,
            iconColor: !isCodeSelected ? codingColor : Colors.green,
            label: 'Code',
            isCenter: true,
            onTap: () {
              setState(() {
                isCodeSelected = !isCodeSelected;
              });
              isCodeSelected ? _increaseTopicCount() : _decreaseTopicCount();
              topicNameProvider.addTopicNames(topicName: 'Code');
            },
          ),

          // Web
          _popupIcons(
            top: 365,
            left: 127,
            icon: FontAwesomeIcons.globe,
            iconColor: !isWebSelected ? webDevelopmentColor : Colors.green,
            label: 'Web',
            isCenter: true,
            onTap: () {
              setState(() {
                isWebSelected = !isWebSelected;
                isWebSelected ? _increaseTopicCount() : _decreaseTopicCount();
                topicNameProvider.addTopicNames(topicName: 'Web');
              });
            },
          ),

          // Next button
          Positioned(
            left: 125,
            bottom: 80,
            child: _isNextButtonActive
                ? ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF272822),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 13,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CodeLanguages(),
                        ),
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'NEXT',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'JetBrainsMono',
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const FaIcon(
                          FontAwesomeIcons.arrowRight,
                          color: Colors.white,
                          size: 12,
                        ),
                      ],
                    ),
                  )
                : SizedBox.shrink(),
          ),

          //topics count
          Positioned(
            bottom: 5,
            left: 125,
            child: Row(
              children: [
                Text(
                  '${_selectedTopicsCount.toString()}/9',
                  style: TextStyle(
                    color: _selectedTopicColor,
                    fontFamily: 'JetBrainsMono',
                  ),
                ),

                SizedBox(width: 10),

                Text(
                  'Selected',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.65),
                    fontFamily: 'JetBrainsMono',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _popupIcons({
    required double top,
    required double left,
    required FaIconData icon,
    required Color iconColor,
    required String label,
    required VoidCallback onTap,
    bool isCenter = false,
  }) {
    return Positioned(
      top: top,
      left: left,
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: isCenter ? 70 : 62,
              height: isCenter ? 70 : 62,
              decoration: BoxDecoration(
                color: const Color(0xFF171717),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: iconColor.withValues(alpha: 0.35),
                  width: 1,
                ),
              ),
              child: Center(
                child: FaIcon(icon, size: isCenter ? 31 : 27, color: iconColor),
              ),
            ),
          ),
          const SizedBox(height: 7),
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.7),
              fontFamily: 'JetBrainsMono',
              fontSize: 9,
            ),
          ),
        ],
      ),
    );
  }

  //decrease counter
  void _decreaseTopicCount() {
    if (_selectedTopicsCount > 0) {
      setState(() {
        _selectedTopicsCount -= 1;
        if (_selectedTopicsCount < 3) {
          _selectedTopicColor = Colors.red;
        }
        if (_selectedTopicsCount >= 3) {
          _isNextButtonActive = true;
        } else {
          _isNextButtonActive = false;
        }
      });
    }
  }

  //increasin topic count
  void _increaseTopicCount() {
    if (_selectedTopicsCount < 9) {
      setState(() {
        _selectedTopicsCount += 1;
        if (_selectedTopicsCount >= 3) {
          _selectedTopicColor = Colors.green;
          _isNextButtonActive = true;
        }
      });
    }
  }
}
