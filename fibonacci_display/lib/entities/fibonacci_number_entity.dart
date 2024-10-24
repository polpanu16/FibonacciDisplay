import 'package:fibonacci_display/enums/fibonacci_type.dart';
import 'package:flutter/material.dart';

class FibonacciNumberEntity {
  int number;
  FibonacciType type;
  Key key;

  FibonacciNumberEntity({required this.number, required this.type, Key? key})
      : key = key ?? UniqueKey();

  factory FibonacciNumberEntity.withRandomType({required int number}) =>
      FibonacciNumberEntity(number: number, type: getRandomType());
}
