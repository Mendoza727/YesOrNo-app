import 'package:chat/domain/entities/message.dart';
import 'package:chat/presentation/providers/chat_provider.dart';
import 'package:chat/presentation/widgets/chat/message_bubble_user.dart';
import 'package:chat/presentation/widgets/chat/my_message_bubble.dart';
import 'package:chat/presentation/widgets/shared/message_field_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://cdn.discordapp.com/attachments/954177284598825070/1327930836879933470/45fbf1d6-fb01-4aed-bd50-a093d8c66168.png?ex=6784db77&is=678389f7&hm=7c1f598f0640069a76975048c2969dfa9b4189325b0d21cd743498bbcde4083d&'),
          ),
        ),
        title: Text('Angie'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          Expanded(
              child: ListView.builder(
                controller: chatProvider.scrollControllerChat,
                  itemCount: chatProvider.messageList.length,
                  itemBuilder: (context, index) {
                    final message = chatProvider.messageList[index];

                    return (message.fromWho == FrowWho.hers)
                        ? MessageBubbleUser(
                          message: message
                        )
                        : MessageBubble(
                            message: message,
                          );
                  })),
          // field box widget
          MessageFieldBox(
            onValue: chatProvider.sendMessage,
          ),
        ]),
      ),
    );
  }
}
