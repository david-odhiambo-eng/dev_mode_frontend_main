import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeImagePage extends StatefulWidget {
  Widget child;
  HomeImagePage({super.key, required this.child});

  @override
  State<HomeImagePage> createState() => _HomeImagePageState();
}

class _HomeImagePageState extends State<HomeImagePage> {
  late Timer _timer;
  Color _chosenColor = Colors.white;

  @override
  void initState() {
    super.initState();
    _pickRandomColor();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _pickRandomColor() {
    final List<Color> pageColors = [Colors.orange, Colors.white, Colors.yellow];

    _timer = Timer.periodic(Duration(seconds: 120), (Timer timer) {
      int randomIndex = Random().nextInt(pageColors.length);
      setState(() {
        _chosenColor = pageColors[randomIndex];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.black),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Opacity(
            opacity: 1,
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(_chosenColor, BlendMode.color),
              child: Image.asset('assets/images/geeky.jpeg', fit: BoxFit.cover),
            ),
          ),
          widget.child,
        ],
      ),
    );
  }
}
