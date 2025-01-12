enum FrowWho { me, hers }

class Message {
  final String text;
  final String? gif;

  final FrowWho fromWho;

  Message({
    required this.text, 
    this.gif, 
    required this.fromWho
  });
}
