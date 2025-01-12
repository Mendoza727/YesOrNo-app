import 'package:chat/presentation/widgets/chat/message_bubble_user.dart';
import 'package:chat/presentation/widgets/chat/my_message_bubble.dart';
import 'package:chat/presentation/widgets/shared/message_field_box.dart';
import 'package:flutter/material.dart';

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
                'https://imgcdn.stablediffusionweb.com/2024/7/15/b4d35727-e1b7-458c-be9d-7f4a021ea5a3.jpg'),
          ),
        ),
        title: Text('Yo'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          Expanded(
              child: ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return (index % 2 == 0)
                        ? const MessageBubbleUser()
                        : const MessageBubble();
                  })),
          

          // field box widget
          const MessageFieldBox(),
        ]),
      ),
    );
  }
}
