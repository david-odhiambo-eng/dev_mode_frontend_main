import 'package:flutter/material.dart';

class PsPad extends StatelessWidget {
  const PsPad({super.key});

  static const double imageAspectRatio = 1536 / 1024;
  static const double designWidth = 360.0;
  static const double designHeight = 240.0;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: imageAspectRatio,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final w = constraints.maxWidth;
          final h = constraints.maxHeight;

          double px(double value) => value * (w / designWidth);
          double py(double value) => value * (h / designHeight);

          return Stack(
            children: [
              Image.asset(
                'assets/images/ps_pad.png',
                width: w,
                height: h,
                fit: BoxFit.contain,
              ),

              Positioned(
                top: py(50),
                left: px(258),
                child: _button(
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              Positioned(
                top: py(50),
                right: px(255),
                child: _button(
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              Positioned(
                top: py(95),
                right: px(205),
                child: _button(
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),

              Positioned(
                top: py(95),
                left: px(205),
                child: _button(
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  static Widget _button({required Widget child}) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: const Color(0xFF23241F),
      child: child,
    );
  }
}