import 'package:flutter/material.dart';
import 'package:yes_no_maybe_app/presentation/screens/chat/chat_view.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(6.0),
          child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://source.unsplash.com/random/100x100/?woman')),
        ),
        title: const Text('Mi amor ♥️'),
        centerTitle: false,
      ),
      body: const ChatView(),
    );
  }
}
