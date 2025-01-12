import 'package:chat/config/helpers/yes_or_not_aswer.dart';
import 'package:chat/domain/entities/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController scrollControllerChat = ScrollController();
  final YesOrNotAswer getYesOrNotAswer = YesOrNotAswer();

  List<Message> messageList = [];

  Future<void> sendMessage(String msg) async {
    if (msg.isEmpty) return;

    final newMessage = Message(text: msg, fromWho: FrowWho.me);
    messageList.add(newMessage);

    if (msg.endsWith('?')) {
      getAswer();
    }

    notifyListeners();
    scrollToMessage();
  }

  Future<void> getAswer() async {
    final message = await getYesOrNotAswer.getAswer();
    messageList.add(message);

    notifyListeners();
    scrollToMessage();
  }

  Future<void> scrollToMessage() async {
    await Future.delayed(const Duration(milliseconds: 100));

    scrollControllerChat.animateTo(
        scrollControllerChat.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
