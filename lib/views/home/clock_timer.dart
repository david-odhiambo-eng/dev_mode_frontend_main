import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class CounterClock extends StatefulWidget {
  const CounterClock({super.key});

  @override
  State<CounterClock> createState() => _CounterClockState();
}

class _CounterClockState extends State<CounterClock>
    with SingleTickerProviderStateMixin {
  Timer? _counterTimer;

  int _timeRemaining = 60;
  bool _isTimerStarted = false;

  Color _color = Colors.white;

  late AnimationController _timerAnimationController;
  late Animation<double> _timerAnimation;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();

    _timerAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _timerAnimation = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 40.0, end: 80.0), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 80.0, end: 40.0), weight: 50),
    ]).animate(_timerAnimationController);
  }

  Future<void> _startTimer() async {
    // Reset values
    setState(() {
      _isTimerStarted = true;
    });

    // Start the animation immediately
    _timerAnimationController.forward(from: 0);

    // Start counting

    _counterTimer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (_timeRemaining > 0) {
        setState(() {
          _timeRemaining--;

          if (_timeRemaining <= 10) {
            _color = Colors.red;
          }
        });

        // Restart animation for this second
        _timerAnimationController.forward(from: 0);
      }

      if (_timeRemaining == 0) {
        timer.cancel();
        _playSound();

        setState(() {
          _isTimerStarted = false;
          _color = Colors.white;
          _timeRemaining = 60;
        });
      }
    });
  }

  // Method to play asset sound
  Future<void> _playSound() async {
    await _audioPlayer.play(AssetSource('audio/thanos.MP3'));
  }

 

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _timerAnimationController,
      builder: (context, child) {
        return _isTimerStarted
            ? Text(
                _timeRemaining.toString(),
                style: TextStyle(
                  color: _color,
                  fontSize: _timerAnimation.value,
                  fontFamily: 'JetBrainsMono',
                ),
              )
            : _showGoButton();
      },
    );
  }

  Widget _showGoButton() {
    return GestureDetector(
      onTap: _startTimer,
      child: SizedBox(
        height: 110,
        width: 110,
        child: Image.asset('assets/images/go.png', fit: BoxFit.contain),
      ),
    );
  }

  @override
  void dispose() {
    _counterTimer?.cancel();
    _timerAnimationController.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }
}
