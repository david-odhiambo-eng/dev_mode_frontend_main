import 'package:coding_game/views/reusables/type_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DevGreeting extends StatefulWidget {
  const DevGreeting({super.key});

  @override
  State<DevGreeting> createState() => _DevGreetingState();
}

class _DevGreetingState extends State<DevGreeting> {
  final _fullText = 'Dev Mode...\nA Developer\'s fun place             ';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: double.infinity,
      child: Row(
        children: [
          const FaIcon(
            FontAwesomeIcons.terminal,
            color: Colors.white,
            size: 17,
          ),
          const SizedBox(width: 12),
          Expanded(child: TypingTextWidget(code: _fullText)),
        ],
      ),
    );
  }
}
