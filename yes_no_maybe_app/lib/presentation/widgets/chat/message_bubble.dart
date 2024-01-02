import 'package:flutter/material.dart';
import 'package:yes_no_maybe_app/domain/entities/message.dart';

class MessageBubble extends StatelessWidget {
  final Message message;
  final CrossAxisAlignment alignment;
  final Color boxColor;
  final Color textColor;

  const MessageBubble(
      {super.key,
      required this.message,
      required this.alignment,
      required this.boxColor,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Container(
          margin: const EdgeInsetsDirectional.symmetric(vertical: 5),
          decoration: BoxDecoration(
              color: boxColor, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: TextStyle(color: textColor),
            ),
          ),
        ),
      ],
    );
  }
}
