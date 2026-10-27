import 'dart:async';

import 'package:flutter/material.dart';

class TypingTextWidget extends StatefulWidget {
  final String code;
  const TypingTextWidget({super.key, required this.code});

  @override
  State<TypingTextWidget> createState() => _TypingTextWidgetState();
}

class _TypingTextWidgetState extends State<TypingTextWidget> {
  
  String _displayText = '';
  late Timer _typingTimer;

  @override
  void initState() {
    _typeText();
    super.initState();
  }

  void _typeText() {
    int currentIndex = 0;
    int lastIndex = widget.code.length - 1;

    _typingTimer = Timer.periodic(const Duration(milliseconds: 100), (
      Timer timer,
    ) {
      if (!mounted) return;

      setState(() {
        _displayText += widget.code[currentIndex];
        currentIndex++;

        if (currentIndex == lastIndex) {
          currentIndex = 0;
          _displayText = '';
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _displayText,
      style: TextStyle(color: Colors.white, fontFamily: 'JetBrainsMono'),
    );
  }

  @override
  void dispose() {
    _typingTimer.cancel();
    super.dispose();
  }
}
