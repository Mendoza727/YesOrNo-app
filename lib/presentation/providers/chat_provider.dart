import 'package:chat/domain/entities/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> message = [
    Message(text: "hola mundo", fromWho: FrowWho.me),
    Message(text: "como estas", fromWho: FrowWho.me)
  ];


  Future<void> sendMessage(String msg) async {
    //todo: implementar metodo
  }
}
