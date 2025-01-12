import 'package:chat/domain/entities/message.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MessageBubbleUser extends StatelessWidget {
  final Message message;

  const MessageBubbleUser({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        decoration: BoxDecoration(
            color: color.secondary, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(message.text, style: TextStyle(color: Colors.white)),
        ),
      ),
      SizedBox(height: 5),
      _ImageBubble(
        imageUrl: message,
      ),
      SizedBox(height: 10),
    ]);
  }
}

class _ImageBubble extends StatelessWidget {
  final Message imageUrl;

  const _ImageBubble({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          imageUrl.gif.toString(),
          width: size.width * 0.7,
          height: 150,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;

            return Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                width: 262,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            );
          },
        ));
  }
}
