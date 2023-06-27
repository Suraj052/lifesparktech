
import 'dart:convert';

List<ChatModel> electronicsModelFromJson(String str) => List<ChatModel>.from(json.decode(str).map((x) => ChatModel.fromJson(x)));

String electronicsModelToJson(List<ChatModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChatModel{
  String sendUser;
  String receiveUser;
  String message;
  String id;



  ChatModel({
    required this.sendUser,
    required this.receiveUser,
    required this.message,
    required this.id

  });

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
    sendUser: json['sendUser'],
    receiveUser: json['receiveUser'],
    message: json['message'],
    id: json['id']

  );

  Map<String, dynamic> toJson() => {
    "sendUser" : sendUser,
    "receiveUser" : receiveUser,
    "message" : message,
    "id" : id

  };

}