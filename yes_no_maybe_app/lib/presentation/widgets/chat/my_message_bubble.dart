import 'package:flutter/material.dart';
import 'package:yes_no_maybe_app/domain/entities/message.dart';
import 'package:yes_no_maybe_app/presentation/widgets/chat/message_bubble.dart';

class MyMessageBubble extends StatelessWidget {
  final Message message;

  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return MessageBubble(
        message: message,
        alignment: CrossAxisAlignment.end,
        boxColor: colors.primary,
        textColor: colors.onPrimary);
  }
}
