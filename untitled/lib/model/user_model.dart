
import 'dart:convert';

List<UserModel> electronicsModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String electronicsModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel{
  String userName;
  String userId;


  UserModel({
    required this.userName,
    required this.userId,

  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    userName: json['userName'],
    userId: json['userId'],

  );

  Map<String, dynamic> toJson() => {
    "userName" : userName,
    "userId" : userId,

  };

}