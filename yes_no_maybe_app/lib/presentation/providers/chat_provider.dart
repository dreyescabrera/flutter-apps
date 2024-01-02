import 'package:flutter/material.dart';
import 'package:yes_no_maybe_app/config/helpers/get_reply.dart';
import 'package:yes_no_maybe_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final scrollController = ScrollController();
  final getReply = GetReply();

  List<Message> messages = [
    Message(text: 'Hey babe. U there?', fromWho: FromWho.me),
    Message(
        text: 'Talk to me',
        fromWho: FromWho.peer,
        imageUrl:
            'https://media1.giphy.com/media/xTiIzJSKB4l7xTouE8/giphy.gif?cid=ecf05e473924uh338wcxtuo7npbd18j6qyrs35kibkremngs&ep=v1_gifs_search&rid=giphy.gif&ct=g')
  ];

  void sendMessage(String text) {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messages.add(newMessage);

    if (text.endsWith('?')) {
      expectReply();
    }

    notifyListeners();
    scrollToBottom();
  }

  Future<void> expectReply() async {
    final reply = await getReply.get();
    messages.add(reply);

    notifyListeners();
    scrollToBottom();
  }

  void scrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));

    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }
}
