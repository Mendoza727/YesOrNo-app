import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextFormField(
        onTapOutside: (event) {
          focusNode.unfocus();
        },
        focusNode: focusNode,
        controller: textController,
        decoration: InputDecoration(
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          hintText: 'End your message with "?"',
          suffixIcon: IconButton(
            onPressed: () {
              final textValue = textController.value.text;
              print('button $textValue');
              textController.clear();
            },
            icon: Icon(
              Icons.send_outlined,
              color: colorScheme.primary,
            ),
          ),
        ),
        style: TextStyle(color: colorScheme.onSurface), // Texto del input
        onFieldSubmitted: (value) {
          textController.clear();
          focusNode.requestFocus();
        },
      ),
    );
  }
}
