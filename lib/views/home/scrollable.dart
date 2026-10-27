import 'package:flutter/material.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';

class ScrollableKeyWords extends StatefulWidget {
  const ScrollableKeyWords({super.key});

  @override
  State<ScrollableKeyWords> createState() => _ScrollableKeyWordsState();
}

class _ScrollableKeyWordsState extends State<ScrollableKeyWords> {
  @override
  Widget build(BuildContext context) {
    return ScrollLoopAutoScroll(
      duration: Duration(seconds: 200),
      gap: 40,
      scrollDirection: Axis.horizontal,
      reverseScroll: false,
      enableScrollInput: true,
      delayAfterScrollInput: Duration(seconds: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _showKeyWords(number: '1', word: '**kwargs'),
          SizedBox(width: 10),
          _showKeyWords(number: '2', word: 'class'),
          SizedBox(width: 10),
          _showKeyWords(number: '3', word: 'tuple'),
          SizedBox(width: 10),
          _showKeyWords(number: '4', word: '__init__'),
          SizedBox(width: 10),
          _showKeyWords(number: '5', word: 'def'),
          SizedBox(width: 10),
          _showKeyWords(number: '6', word: 'self'),
          SizedBox(width: 10),
          _showKeyWords(number: '7', word: ':='),
          SizedBox(width: 10),
          _showKeyWords(number: '8', word: 'Database'),
          SizedBox(width: 10),
          _showKeyWords(number: '9', word: 'str'),
          SizedBox(width: 10),
          _showKeyWords(number: '10', word: '.env'),
        ],
      ),
    );
  }

  //widget for showing key words suggestions
  Widget _showKeyWords({required String number, required String word}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$number.',
          style: const TextStyle(
            fontFamily: 'JetBrainsMono',
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          '$word   ',
          style: const TextStyle(
            fontFamily: 'JetBrainsMono',
            color: Colors.red,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
