import 'dart:ui';
import 'package:flutter/material.dart';

class BlurContainer extends StatelessWidget {
  final Widget child;

  const BlurContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: new Container(
        decoration: BoxDecoration(border: Border.all(width: 2)),
        child: new BackdropFilter(
          filter: new ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: new Padding(
            padding: const EdgeInsets.all(8.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
