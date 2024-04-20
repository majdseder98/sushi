import 'package:flutter/material.dart';


class Loading extends StatelessWidget {
  final bool condition;
  final Widget child;
  const Loading({super.key, required this.condition, required this.child});

  @override
  Widget build(BuildContext context) {
    if (condition) {
      return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
    } else {
      return child;
    }
  }
}