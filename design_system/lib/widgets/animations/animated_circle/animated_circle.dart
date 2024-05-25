import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedCircle extends StatefulWidget {
  const AnimatedCircle({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<AnimatedCircle> createState() => _AnimatedCircleState();
}

class _AnimatedCircleState extends State<AnimatedCircle>
    with TickerProviderStateMixin {
  late AnimationController _rotationController;

  @override
  void initState() {
    _rotationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _rotationController;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _rotationController,
      builder: (_, child) => Transform.rotate(
        angle: _rotationController.value * 2 * pi,
        child: child,
      ),
      child: Container(
        height: 240,
        width: 240,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(180),
        ),
        child: Center(child: widget.child),
      ),
    );
  }
}
