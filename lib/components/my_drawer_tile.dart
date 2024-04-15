import 'package:flutter/material.dart';

class MyDrawerTile extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback? onTap;

  const MyDrawerTile({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:8.0),
      child: ListTile(
        title: Text(
          text,
          style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
        ),
        leading: Icon(
          icon,
          color: Theme.of(context).colorScheme.onSurface,
        ),
        onTap: onTap,
      ),
    );
  }
}
