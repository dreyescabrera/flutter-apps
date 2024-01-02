// To parse this JSON data, do
//
//     final peerMessage = peerMessageFromJson(jsonString);

import 'package:yes_no_maybe_app/domain/entities/message.dart';

Map<String, dynamic> replies = const {
  'yes': 'I love you babe',
  'no': 'Get outta here. fck u.'
};

class ReplyModel {
  String answer;
  bool forced;
  String image;

  ReplyModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory ReplyModel.fromJson(Map<String, dynamic> json) => ReplyModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "answer": answer,
        "forced": forced,
        "image": image,
      };

  Message toMessage() =>
      Message(text: replies[answer], fromWho: FromWho.peer, imageUrl: image);
}
