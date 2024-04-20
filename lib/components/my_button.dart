import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final ButtonStyle? style;

  const MyButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius:
              BorderRadius.circular(8), // Corrected placement of comma
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              // Corrected 'textstyle' to 'TextStyle'
              fontWeight:
                  FontWeight.bold, // Corrected 'FontWeight' to 'fontWeight'
              color: Theme.of(context)
                  .colorScheme
                  .primary, // Corrected 'inverprimery' to 'onSecondary'
              fontSize: 16, // Corrected 'fontsize' to 'fontSize'
            ),
          ),
        ),
      ),
    );
  }
}
