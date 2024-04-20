import 'package:flutter/material.dart';

extension ShowSnackBar on BuildContext {
  showSnack(String message, {bool isError=false}) =>
      ScaffoldMessenger.of(this).showSnackBar(SnackBar(
          backgroundColor: isError ? Colors.red : Colors.blue,
          content: Text(
            message,
            style: Theme.of(this)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.white),
          )));
}
