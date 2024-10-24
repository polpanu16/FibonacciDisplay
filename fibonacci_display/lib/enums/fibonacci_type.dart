import 'dart:math';

import 'package:flutter/material.dart';

enum FibonacciType { square, circle, cross }

FibonacciType getRandomType() {
  int index = Random().nextInt(FibonacciType.values.length);
  return FibonacciType.values[index];
}

extension FibonacciTypeExtension on FibonacciType {
  IconData get getIcon {
    switch (this) {
      case FibonacciType.square:
        return Icons.square;
      case FibonacciType.circle:
        return Icons.circle;
      case FibonacciType.cross:
        return Icons.close;
    }
  }
}
