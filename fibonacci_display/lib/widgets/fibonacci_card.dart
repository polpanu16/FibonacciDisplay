import 'package:fibonacci_display/entities/fibonacci_number_entity.dart';
import 'package:fibonacci_display/enums/fibonacci_type.dart';
import 'package:flutter/material.dart';

class FibonacciCard extends StatelessWidget {
  const FibonacciCard(
      {super.key,
      required this.fibo,
      required this.onTap,
      required this.isSelected});
  final FibonacciNumberEntity fibo;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text("${fibo.number}"),
        trailing: Icon(fibo.type.getIcon),
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        tileColor: (isSelected) ? Colors.red : Colors.amber[100],
      ),
    );
  }
}
