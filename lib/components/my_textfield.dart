import 'package:flutter/material.dart';
import 'package:sushi/extensions/size_on_context.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;

  const MyTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.keyboardType,
    this.textInputAction=TextInputAction.next
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: Theme.of(context).textTheme.bodyMedium,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        constraints: BoxConstraints(
          maxHeight: context.height * 0.07,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
            color: Theme.of(context)
                .colorScheme
                .primary), // Corrected property name
      ),
    );
  }
}
