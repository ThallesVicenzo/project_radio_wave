import 'package:flutter/material.dart';

final outlineBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: const BorderSide(color: Colors.white),
);

final errorBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: const BorderSide(color: Colors.red),
);

const shadowStyle = [
  Shadow(
    color: Colors.pink,
    blurRadius: 3,
  ),
  Shadow(
    color: Colors.pink,
    blurRadius: 6,
  ),
];

final boxShadowStyle = [
  for (double i = 1; i < 5; i++)
    BoxShadow(
      blurStyle: BlurStyle.outer,
      color: Colors.pink,
      blurRadius: 3 * i,
    ),
];
