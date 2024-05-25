import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class TransitionFactory {
  static CustomTransitionPage getSlideTransitionPage({
    required Widget child,
  }) {
    return CustomTransitionPage(
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          SlideTransition(
        position: animation.drive(
          Tween<Offset>(
            begin: const Offset(0.75, 0),
            end: Offset.zero,
          ).chain(
            CurveTween(
              curve: Curves.easeIn,
            ),
          ),
        ),
        child: child,
      ),
    );
  }

  static Page<dynamic> getSlidePageBuilder({
    required Widget child,
  }) {
    return TransitionFactory.getSlideTransitionPage(
      child: child,
    );
  }
}
