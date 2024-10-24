import 'package:flutter/material.dart';

class FiboBottomSheet extends StatelessWidget {
  const FiboBottomSheet({super.key, required this.widgets});
  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shrinkWrap: true,
        itemCount: widgets.length,
        itemBuilder: (context, index) => widgets[index]);
  }
}
