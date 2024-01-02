import 'package:flutter/material.dart';

class CounterButton extends StatelessWidget {
  static const _textColor = Color.fromRGBO(51, 62, 70, 1);

  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  const CounterButton(
      {super.key,
      required this.label,
      required this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        style: TextButton.styleFrom(
            iconColor: _textColor,
            side: const BorderSide(color: Colors.black12),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(2))),
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(
          label,
          style: const TextStyle(color: _textColor),
        ));
  }
}
