import 'package:coding_game/views/home/home_image_page.dart';
import 'package:coding_game/views/onboarding/topics/icons_page.dart';
import 'package:coding_game/views/onboarding/topics/add_teams.dart';

import 'package:coding_game/views/onboarding/topics/dev_greeting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopicsPage extends StatefulWidget {
  const TopicsPage({super.key});

  @override
  State<TopicsPage> createState() => _TopicsPageState();
}

class _TopicsPageState extends State<TopicsPage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: HomeImagePage(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 18),
              
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  DevGreeting(),

                  const SizedBox(height: 22),

                  // Section title
                  Text(
                    'What\'s your favorite topic(s) ?',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'JetBrainsMono',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),

                  const SizedBox(height: 12),

                  IconsPage(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
