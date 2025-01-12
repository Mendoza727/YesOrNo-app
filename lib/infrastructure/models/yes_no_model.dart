import 'dart:convert';

import 'package:chat/domain/entities/message.dart';

class YesNoModel {
  String answer;
  bool forced;
  String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoModel.fromRawJson(String str) =>
      YesNoModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory YesNoModel.fromJson(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };

  Message toMessageToEntity() => Message(
    text: answer == 'yes' ? 'Sí' : 'No',
    fromWho: FrowWho.hers,
    gif: image
  );
}
