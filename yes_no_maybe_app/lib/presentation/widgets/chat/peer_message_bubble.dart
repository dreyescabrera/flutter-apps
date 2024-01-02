import 'package:flutter/material.dart';
import 'package:yes_no_maybe_app/domain/entities/message.dart';
import 'package:yes_no_maybe_app/presentation/widgets/chat/message_bubble.dart';

class PeerMessageBubble extends StatelessWidget {
  final Message message;

  const PeerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MessageBubble(
            message: message,
            alignment: CrossAxisAlignment.start,
            boxColor: colors.secondary,
            textColor: colors.onSecondary),
        _ImageBubble(
          imgUrl: message.imageUrl!,
        )
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String imgUrl;

  const _ImageBubble({required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imgUrl,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: size.width * 0.7,
            height: 150,
            padding: const EdgeInsets.all(20),
            child: const Text('Mi Amor is sending an image'),
          );
        },
      ),
    );
  }
}
