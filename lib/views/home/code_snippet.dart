import 'package:flutter/material.dart';

class CodeSnippet extends StatefulWidget {
  const CodeSnippet({super.key});

  @override
  State<CodeSnippet> createState() => _CodeSnippetState();
}

class _CodeSnippetState extends State<CodeSnippet> {
  String language = 'dart';
  String keyword = 'word to describe appears here';
  String answer = 'Answers only appear after\nround ends';
  String code = 'Questions from selected topics\n\nwill appear here once you press\n\n              GO';

  @override
  Widget build(BuildContext context) {
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
                  language.toUpperCase(),
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
                    code,
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
            topicValue: keyword,
          ),

          _showKeyWordAndAnswer(
            topic: 'Answer:',
            topicValueColor: Colors.green,
            topicValue: answer,
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
      padding: EdgeInsets.only(left: 6),
      child: Row(
        children: [
          Text(
            topic,
            style: TextStyle(fontFamily: 'JetBrainsMono', color: Colors.white),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              topicValue,
              style: TextStyle(
                fontFamily: 'JetBrainsMono',
                color: topicValueColor,
              ),
            ),
          ),
          Spacer(),
          ?visibility,
        ],
      ),
    );
  }
}
