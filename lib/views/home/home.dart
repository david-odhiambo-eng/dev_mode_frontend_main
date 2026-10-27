import 'package:coding_game/views/home/clock_timer.dart';
import 'package:coding_game/views/home/code_snippet.dart';
import 'package:coding_game/views/home/home_image_page.dart';
import 'package:coding_game/views/home/ps_pad.dart';
import 'package:coding_game/views/home/scrollable.dart';
import 'package:coding_game/views/onboarding/topics/add_teams.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeImagePage(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ScrollableKeyWords(),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.3,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddTeams()),
                        );
                      },
                      child: Row(
                        children: [
                          Text(
                            'TEAM NAME',
                            style: TextStyle(
                              fontFamily: 'JetBrainsMono',
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 10),
                          FaIcon(
                            FontAwesomeIcons.penToSquare,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  CodeSnippet(),
                  SizedBox(height: 10),
                  Text(
                    'ROUND 1',
                    style: TextStyle(
                      fontFamily: 'JetBrainsMono',
                      color: Colors.white,
                    ),
                  ),
                  //player controls
                  PsPad(),
                  //timer widget
                  CounterClock(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //load 
}
