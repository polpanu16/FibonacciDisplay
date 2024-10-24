import 'package:fibonacci_display/entities/fibonacci_number_entity.dart';

const int MAX_LENGTH = 40;

class FibonacciUtil {
  static List<FibonacciNumberEntity> getFibonacciNumbers() {
    List<FibonacciNumberEntity> fibonacciNumbers = [
      FibonacciNumberEntity.withRandomType(number: 0),
      FibonacciNumberEntity.withRandomType(number: 1)
    ];

    for (int i = 2; i < MAX_LENGTH; i++) {
      int nextNumber =
          fibonacciNumbers[i - 1].number + fibonacciNumbers[i - 2].number;
      fibonacciNumbers
          .add(FibonacciNumberEntity.withRandomType(number: nextNumber));
    }

    return fibonacciNumbers;
  }
}
