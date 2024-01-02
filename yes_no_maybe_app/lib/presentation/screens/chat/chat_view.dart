import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_maybe_app/domain/entities/message.dart';
import 'package:yes_no_maybe_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_maybe_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_maybe_app/presentation/widgets/chat/peer_message_bubble.dart';
import 'package:yes_no_maybe_app/presentation/widgets/shared/message_field_box.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              controller: chatProvider.scrollController,
              itemCount: chatProvider.messages.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messages[index];
                if (message.fromWho == FromWho.me) {
                  return MyMessageBubble(
                    message: message,
                  );
                }
                return PeerMessageBubble(
                  message: message,
                );
              },
            )),
            MessageFieldBox(
              onValue: (value) => chatProvider.sendMessage(value),
            )
          ],
        ),
      ),
    );
  }
}
